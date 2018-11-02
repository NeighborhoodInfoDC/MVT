/**************************************************************************
 Program:  Calculate death by age group and geography.sas
 Library:  Vital
 Project:  NeighborhoodInfo DC
 Author:   Yipeng Su
 Created:  9/10/18
 Version:  SAS 9.4
 Environment:  Windows with SAS/Connect
 
 Description:  Summarize total death by age group and geograpy for calculating mortality rate and years of life lost 

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Vital )
%DCData_lib( Census )
%DCData_lib( MVT )
** create age groups based on public health research standards https://ibis.health.state.nm.us/resource/AARate.html  **;
data deaths_2014_16;
	set vital.Deaths_2016 vital.Deaths_2015 vital.Deaths_2014;

	if age_calc < 1 then age_group = 1;
		else if 1 <= age_calc  <5 then age_group = 2;
		else if 5 <= age_calc  <15 then age_group = 3;
		else if 15 <= age_calc  <25 then age_group = 4;
		else if 25 <= age_calc  <35 then age_group = 5;
		else if 35 <= age_calc  <45 then age_group = 6;
		else if 45 <= age_calc  <55 then age_group = 7;
		else if 55 <= age_calc  <65 then age_group = 8;
        else if 65 <= age_calc  <75 then age_group = 9;
        else if 75 <= age_calc  < 85 then age_group = 10;
        else if age_calc  >= 85 then age_group = 11;
		else age_group = .;

run;
data deaths_2009_11;
	set vital.Deaths_2009 vital.Deaths_2010 vital.Deaths_2011;

	if age_calc < 1 then age_group = 1;
		else if 1 <= age_calc  <5 then age_group = 2;
		else if 5 <= age_calc  <15 then age_group = 3;
		else if 15 <= age_calc  <25 then age_group = 4;
		else if 25 <= age_calc  <35 then age_group = 5;
		else if 35 <= age_calc  <45 then age_group = 6;
		else if 45 <= age_calc  <55 then age_group = 7;
		else if 55 <= age_calc  <65 then age_group = 8;
        else if 65 <= age_calc  <75 then age_group = 9;
        else if 75 <= age_calc  < 85 then age_group = 10;
        else if age_calc  >= 85 then age_group = 11;
		else age_group = .;

run;
data deaths_2010_12;
	set vital.Deaths_2010 vital.Deaths_2011 vital.Deaths_2012;

	if age_calc < 1 then age_group = 1;
		else if 1 <= age_calc  <5 then age_group = 2;
		else if 5 <= age_calc  <15 then age_group = 3;
		else if 15 <= age_calc  <25 then age_group = 4;
		else if 25 <= age_calc  <35 then age_group = 5;
		else if 35 <= age_calc  <45 then age_group = 6;
		else if 45 <= age_calc  <55 then age_group = 7;
		else if 55 <= age_calc  <65 then age_group = 8;
        else if 65 <= age_calc  <75 then age_group = 9;
        else if 75 <= age_calc  < 85 then age_group = 10;
        else if age_calc  >= 85 then age_group = 11;
		else age_group = .;

run;
data deaths_2011_13;
	set vital.Deaths_2011 vital.Deaths_2012  vital.Deaths_2013;

	if age_calc < 1 then age_group = 1;
		else if 1 <= age_calc  <5 then age_group = 2;
		else if 5 <= age_calc  <15 then age_group = 3;
		else if 15 <= age_calc  <25 then age_group = 4;
		else if 25 <= age_calc  <35 then age_group = 5;
		else if 35 <= age_calc  <45 then age_group = 6;
		else if 45 <= age_calc  <55 then age_group = 7;
		else if 55 <= age_calc  <65 then age_group = 8;
        else if 65 <= age_calc  <75 then age_group = 9;
        else if 75 <= age_calc  < 85 then age_group = 10;
        else if age_calc  >= 85 then age_group = 11;
		else age_group = .;

run;
data deaths_2012_14;
	set  vital.Deaths_2012  vital.Deaths_2013 vital.Deaths_2014;

	if age_calc < 1 then age_group = 1;
		else if 1 <= age_calc  <5 then age_group = 2;
		else if 5 <= age_calc  <15 then age_group = 3;
		else if 15 <= age_calc  <25 then age_group = 4;
		else if 25 <= age_calc  <35 then age_group = 5;
		else if 35 <= age_calc  <45 then age_group = 6;
		else if 45 <= age_calc  <55 then age_group = 7;
		else if 55 <= age_calc  <65 then age_group = 8;
        else if 65 <= age_calc  <75 then age_group = 9;
        else if 75 <= age_calc  < 85 then age_group = 10;
        else if age_calc  >= 85 then age_group = 11;
		else age_group = .;

run;
data deaths_2013_15;
	set   vital.Deaths_2013 vital.Deaths_2014 vital.Deaths_2015 ;

	if age_calc < 1 then age_group = 1;
		else if 1 <= age_calc  <5 then age_group = 2;
		else if 5 <= age_calc  <15 then age_group = 3;
		else if 15 <= age_calc  <25 then age_group = 4;
		else if 25 <= age_calc  <35 then age_group = 5;
		else if 35 <= age_calc  <45 then age_group = 6;
		else if 45 <= age_calc  <55 then age_group = 7;
		else if 55 <= age_calc  <65 then age_group = 8;
        else if 65 <= age_calc  <75 then age_group = 9;
        else if 75 <= age_calc  < 85 then age_group = 10;
        else if age_calc  >= 85 then age_group = 11;
		else age_group = .;

run;

** Repeat for census population data as denominator  **;
data population (where=(geo2010 ne ''));
keep geo2010 agegroup_1 agegroup_2 agegroup_3 agegroup_4 agegroup_5 agegroup_6 agegroup_7 agegroup_8 agegroup_9 agegroup_10 agegroup_11 ;
	set census.Census_sf1_2010_dc_ph;
        agegroup_1= sum(pct12i107, pct12i3);
		agegroup_2= sum(pct12i108, pct12i109, pct12i110, pct12i111, pct12i4, pct12i5, pct12i6, pct12i7 );
		agegroup_3= sum(p12i28, p12i29, p12i4, p12i5 );
		agegroup_4= sum(p12i30, p12i31, p12i32, p12i33, p12i34, p12i6, p12i7, p12i8, p12i9, p12i10);
		agegroup_5= sum(p12i11, p12i12, p12i35, p12i36);
		agegroup_6= sum(p12i13, p12i14, p12i37, p12i38 );
		agegroup_7= sum(p12i15, p12i16, p12i39, p12i40 );
		agegroup_8= sum(p12i17, p12i18, p12i19, p12i41, p12i42, p12i43 );
		agegroup_9= sum(p12i20, p12i21, p12i22, p12i44, p12i45, p12i46);
        agegroup_10= sum(p12i23, p12i24, p12i47, p12i48);
		agegroup_11= sum(p12i25, p12i49);

;
	 label agegroup_1="under 1 year old";
	     label  agegroup_2= "1 - 4 Years";
        label   agegroup_3= "5 - 14 Years";
       label    agegroup_4= "15 - 24 Years";
       label    agegroup_5= "25 - 34 Years";
	  label     agegroup_6= "35 - 44 Years";
	 label      agegroup_7= "45 - 54 Years";
      label     agegroup_8= "55 - 64 Years";
      label    agegroup_9= "65 - 74 Years";
    label      agegroup_10 ="75 - 84 Years";
     label     agegroup_11= "85 Years and Over";
run;
%let years=2009_11 2010_12 2011_13 2012_14 2013_15 2014_16;

%macro mortality;
 %do i=1 %to 6;
 %let yrs=%scan(&years.,&i.," ");

	proc sort data = deaths_&yrs.; by age_group geo2010; run;
	proc summary data=deaths_&yrs.;
	by age_group geo2010;
	var deaths_total ;
		output	out=death_age_&yrs._tr10	sum= ;
	run;
	proc sort data= death_age_&yrs._tr10;
	by  geo2010 ;
	run;
	proc transpose data=death_age_&yrs._tr10 out=death_age_&yrs._tr10_new prefix = death_age_group_;
	var Deaths_total; 
	by geo2010;
	id age_group; 
	run;

	proc sort data= population;
	by geo2010;
	run;

	data death_pop_&yrs.;
	merge death_age_&yrs._tr10_new population;
	by geo2010;
		if Geo2010 in("11001004701","11001004702") then target = 1;
		if Geo2010 in("11001010600","11001004600","11001004802","11001004902","11001005800","11001005900") then target = 2;
	run;

	data death_pop_&yrs._target;
	 set death_pop_&yrs. (where=(target~=.));
	 run; 
	proc sort data=death_pop_&yrs._target;
	by target;
	proc summary data=death_pop_&yrs._target;
	where target=1; 
	var agegroup_1 agegroup_2 agegroup_3 agegroup_4 agegroup_5 agegroup_6 agegroup_7 agegroup_8 agegroup_9 agegroup_10 agegroup_11 
	death_age_group_1 death_age_group_2 death_age_group_3 death_age_group_4 death_age_group_5 death_age_group_6 death_age_group_7 death_age_group_8 death_age_group_9 
		death_age_group_10 death_age_group_11;
	output out=death_pop_&yrs._target_c47 sum=;
	run;
	proc summary data=death_pop_&yrs._target;
	var agegroup_1 agegroup_2 agegroup_3 agegroup_4 agegroup_5 agegroup_6 agegroup_7 agegroup_8 agegroup_9 agegroup_10 agegroup_11 
	death_age_group_1 death_age_group_2 death_age_group_3 death_age_group_4 death_age_group_5 death_age_group_6 death_age_group_7 death_age_group_8 death_age_group_9 
		death_age_group_10 death_age_group_11;
	output out=death_pop_&yrs._target_focus sum=;
	run;
	data death_pop_&yrs._target_c47a;
		set death_pop_&yrs._target_c47;
	length geography $20.;
	geography="Census Tract 47";
	drop _type_ _freq_; 
	run; 
	data death_pop_&yrs._target_focusa;
		set death_pop_&yrs._target_focus;
	length geography $20.;
	geography="MVT Focus Area";
	drop _type_ _freq_; 
	run; 
	data deaths_tracts_&yrs.;
	set death_pop_&yrs._target_c47a death_pop_&yrs._target_focusa;

	run;



%Transform_geo_data(
keep_nonmatch=n,
dat_ds_name=work.death_pop_&yrs.,
dat_org_geo=geo2010,
dat_count_vars= agegroup_1 agegroup_2 agegroup_3 agegroup_4 agegroup_5 agegroup_6 agegroup_7 agegroup_8 agegroup_9 agegroup_10 agegroup_11 death_age_group_1 death_age_group_2 death_age_group_3 death_age_group_4 death_age_group_5 death_age_group_6 death_age_group_7 death_age_group_8 death_age_group_9 death_age_group_10 death_age_group_11,
wgt_ds_name=general.Wt_tr10_ward12,
wgt_org_geo=Geo2010,
wgt_new_geo=ward2012, 
wgt_id_vars=,
wgt_wgt_var=PopWt,
out_ds_name=death_by_ward_&yrs.,
out_ds_label=%str(Population by age group from tract 2010 to ward, &yrs.),
calc_vars= 
,
calc_vars_labels=

)

%Transform_geo_data(
keep_nonmatch=n,
dat_ds_name=work.death_pop_&yrs.,
dat_org_geo=geo2010,
dat_count_vars= agegroup_1 agegroup_2 agegroup_3 agegroup_4 agegroup_5 agegroup_6 agegroup_7 agegroup_8 agegroup_9 agegroup_10 agegroup_11 death_age_group_1 death_age_group_2 death_age_group_3 death_age_group_4 death_age_group_5 death_age_group_6 death_age_group_7 death_age_group_8 death_age_group_9 death_age_group_10 death_age_group_11,
wgt_ds_name=general.Wt_tr10_city,
wgt_org_geo=Geo2010,
wgt_new_geo=city, 
wgt_id_vars=,
wgt_wgt_var=PopWt,
out_ds_name=death_by_city_&yrs.,
out_ds_label=%str(Population by age group from tract 2010 to city, &yrs.),
calc_vars= 
,
calc_vars_labels=

)


/*DC population weights 2010 census excluding 75+ aged population (511806)

under 1 year old: 7156 [0.012556963]
1-4: 25457 [0.044670573]
5-14: 51188 [0.089821946]
15-24: 104029 [0.182544487]
25-34: 124745 [0.218895808]
35-44: 80659 [0.14153607]
45-54: 75703 [0.132839548]
55-64: 63977 [0.112263394]
65-74: 36969 [0.06487121]
75-84: 21525 
85+: 10315 

*/
data DCweight_tracts_&yrs.;
set deaths_tracts_&yrs.;
length indicator $80;
keep indicator year geography numerator denom equityvariable;
indicator = "Age-adjusted premature mortality rate";
year = "&yrs.";
denom= sum(agegroup_1, agegroup_2, agegroup_3, agegroup_4, agegroup_5, agegroup_6, agegroup_7, agegroup_8, agegroup_9);
equityvariable = sum ( 
			   (death_age_group_1/agegroup_1/3*0.012556963*1000),
               (death_age_group_2/agegroup_2/3*0.044670573*1000),
               (death_age_group_3/agegroup_3/3*0.089821946*1000),
               (death_age_group_4/agegroup_4/3*0.182544487*1000),
               (death_age_group_5/agegroup_5/3*0.218895808*1000),
               (death_age_group_6/agegroup_6/3*0.14153607*1000),
               (death_age_group_7/agegroup_7/3*0.132839548*1000),
               (death_age_group_8/agegroup_8/3*0.112263394*1000),
               (death_age_group_9/agegroup_9/3*0.06487121*1000)
				
);

numerator= equityvariable * denom /1000;
if numerator <=5 then do; numerator=.; equityvariable=.; end;
run;


data DCweight_ward_&yrs. ;
	set Death_by_ward_&yrs.;
length indicator $80;
keep indicator year Ward2012 numerator denom equityvariable geography;
indicator = "Age-adjusted premature mortality rate";
year = "&yrs.";
denom= sum(agegroup_1, agegroup_2, agegroup_3, agegroup_4, agegroup_5, agegroup_6, agegroup_7, agegroup_8, agegroup_9);
equityvariable = sum ( 
			   (death_age_group_1/agegroup_1/3*0.012556963*1000),
               (death_age_group_2/agegroup_2/3*0.044670573*1000),
               (death_age_group_3/agegroup_3/3*0.089821946*1000),
               (death_age_group_4/agegroup_4/3*0.182544487*1000),
               (death_age_group_5/agegroup_5/3*0.218895808*1000),
               (death_age_group_6/agegroup_6/3*0.14153607*1000),
               (death_age_group_7/agegroup_7/3*0.132839548*1000),
               (death_age_group_8/agegroup_8/3*0.112263394*1000),
               (death_age_group_9/agegroup_9/3*0.06487121*1000)
				
);

numerator= equityvariable * denom /1000;
if numerator <=5 then do; numerator=.; equityvariable=.; end;
length geography $20.;
Geography=Ward2012;

run;

data DCweight_city_&yrs.;
set Death_by_city_&yrs.;
length indicator $80;
keep indicator year City numerator denom equityvariable geography;
indicator = "Age-adjusted premature mortality rate";
year = "&yrs.";
denom= sum(agegroup_1, agegroup_2, agegroup_3, agegroup_4, agegroup_5, agegroup_6, agegroup_7, agegroup_8, agegroup_9);
equityvariable = sum ( 
			   (death_age_group_1/agegroup_1/3*0.012556963*1000),
               (death_age_group_2/agegroup_2/3*0.044670573*1000),
               (death_age_group_3/agegroup_3/3*0.089821946*1000),
               (death_age_group_4/agegroup_4/3*0.182544487*1000),
               (death_age_group_5/agegroup_5/3*0.218895808*1000),
               (death_age_group_6/agegroup_6/3*0.14153607*1000),
               (death_age_group_7/agegroup_7/3*0.132839548*1000),
               (death_age_group_8/agegroup_8/3*0.112263394*1000),
               (death_age_group_9/agegroup_9/3*0.06487121*1000)
				
);

numerator= equityvariable * denom /1000;
length geography $20.;
Geography="Washington, DC";

run;
%end;
%mend;
%mortality;

data mvt_mortality;
	set DCweight_tracts_2009_11 DCweight_tracts_2010_12 DCweight_tracts_2011_13 DCweight_tracts_2012_14 DCweight_tracts_2013_15 DCweight_tracts_2014_16 
	DCweight_ward_2009_11 DCweight_ward_2010_12 DCweight_ward_2011_13 DCweight_ward_2012_14 DCweight_ward_2013_15 DCweight_ward_2014_16 
	DCweight_city_2009_11 DCweight_city_2010_12 DCweight_city_2011_13 DCweight_city_2012_14 DCweight_city_2013_15 DCweight_city_2014_16;

	run;

proc export data=mvt_mortality
	outfile="&_dcdata_default_path\MVT\Prog\mvt_mortality.csv"
	dbms=csv replace;
run;
