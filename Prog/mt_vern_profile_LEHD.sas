/**************************************************************************
 Program:  mt_vern_profile_LEHD.sas
 Library:  MVT
 Project:  Urban-Greater DC
 Author:   L. Hendey
 Created:  11-2-18
 Version:  SAS 9.2
 Environment:  Local Windows session
 
 Description:  output summary stats on LEHD

**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";


%DCData_lib( LEHD )

/*compile lehd data*/

  %let  years=2010 2011 2012 2013 2014 2015;

  %macro uselehd;

  %do i=1 %to 6;
  %let yrs=%scan(&years.,&i.," ");


	data rac_primary_&yrs. (where=(year=&yrs.));
		set lehd.rac_primary (where=(st="11")); 

		keep geo2010 target year c000 ca: cr: cd: ct: cs:;

	if Geo2010 in("11001004701","11001004702") then target = 1;
	if Geo2010 in("11001010600","11001004600","11001004802","11001004902","11001005800","11001005900") then target = 2;
	 run; 


	%Transform_geo_data(
		keep_nonmatch=n,
		dat_ds_name=work.rac_primary_&yrs.,
		dat_org_geo=geo2010,
		dat_count_vars= c000 ca01 ca02 ca03 cr01 cr02 cr03 cr04 cr05 cr07 ct01 ct02 cd01 cd02 cd03 cd04 cs01 cs02,
		wgt_ds_name=general.Wt_tr10_ward12,
		wgt_org_geo=Geo2010,
		wgt_new_geo=ward2012, 
		wgt_id_vars=,
		wgt_wgt_var=PopWt,
		out_ds_name=lehd_&yrs._wd12,
		out_ds_label=%str(LEHD &yrs. ward2102),
		calc_vars=,calc_vars_labels=
	)
	%Transform_geo_data(
		keep_nonmatch=n,
		dat_ds_name=work.rac_primary_&yrs.,
		dat_org_geo=geo2010,
		dat_count_vars= c000 ca01 ca02 ca03 cr01 cr02 cr03 cr04 cr05 cr07 ct01 ct02 cd01 cd02 cd03 cd04 cs01 cs02,
		wgt_ds_name=general.Wt_tr10_city,
		wgt_org_geo=Geo2010,
		wgt_new_geo=city, 
		wgt_id_vars=,
		wgt_wgt_var=PopWt,
		out_ds_name=lehd_&yrs._city,
		out_ds_label=%str(LEHD city),
		calc_vars=,calc_vars_labels=
	)
	
    proc sort data=rac_primary_&yrs.;
		by target;
	proc summary data=rac_primary_&yrs.;
	where target=1;
	var c000 ca01 ca02 ca03 cr01 cr02 cr03 cr04 cr05 cr07 ct01 ct02 cd01 cd02 cd03 cd04 cs01 cs02;
	output out=lehd_&yrs._c47 sum=;
	run; 

	proc summary data=rac_primary_&yrs.;
	where target~=.;
	var c000 ca01 ca02 ca03 cr01 cr02 cr03 cr04 cr05 cr07 ct01 ct02 cd01 cd02 cd03 cd04 cs01 cs02;
	output out=lehd_&yrs._focus sum=;
	run; 

	data lehd_mvt_&yrs. (drop=city ward2012 );
		set lehd_&yrs._c47 (in=a drop=_type_ _freq_) lehd_&yrs._focus (in=b drop=_type_ _freq_) lehd_&yrs._wd12 lehd_&yrs._city;

		year=&yrs.;
		length geography $20.;
		if city=1 then geography="Washington, DC";
		if a then geography="Census Tract 47" ;
		if b then geography="MVT Target Area" ;
		if Ward2012="2" then Geography="Ward 2";
		if Ward2012="6" then Geography="Ward 6";
		If ward2012="5" then Geography="Ward 5";
		if ward2012="7" then Geography="Ward 7";
		if ward2012="1" then Geography="Ward 1";
		if ward2012="3" then Geography="Ward 3";
		if ward2012="4" then Geography="Ward 4";
 		if ward2012="8" then Geography="Ward 8";

		run; 


   %end;



   %mend uselehd;
   %uselehd; 
	
data allyears;

set lehd_mvt_2010 lehd_mvt_2011 lehd_mvt_2012 lehd_mvt_2013 lehd_mvt_2014 lehd_mvt_2015;

	pctfemale=cs02/c000; 
	pctmale=cs01/c000;
	pctlths=cd01/c000;
	pct4yr=cd04/c000;

	pcthisp=ct02/c000;
	pctblack=cr02/c000;
	pctwhite=cr01/c000; 
	pctasian=cr04/c000;

	pctu29=ca01/c000;
	pct30to54=ca02/c000;
	pctover55=ca03/c000; 

run; 

proc sort data=allyears;
by geography;
proc transpose data=allyears out=allyears_a;
by geography;
id year;
var c000 ca01 ca02 ca03 cr01 cr02 cr03 cr04 cr05 cr07 ct01 ct02 cd01 cd02 cd03 cd04 cs01 cs02 
	pctfemale pctmale pctlths pct4yr pcthisp pctblack pctwhite pctasian pctu29 pct30to54 pctover55 ;
run;

 data allyears_b;
	set allyears_a;

	pctchg10_15=(_2015-_2010)/_2010;

	if _name_ in("pctfemale" "pctmale" "pctlths" "pct4yr" "pcthisp" "pctblack" "pctwhite" "pctasian" "pctu29" "pct30to54" "pctover55") THEN pctchg10_15=.;
	run; 
proc sort data=allyears_b;
by _name_ geography;
proc export data=allyears_b
outfile="&_dcdata_default_path\MVT\Prog\mvt_tabs_lehd.csv"
	dbms=csv replace;
	run;*/
