/**************************************************************************
 Program:  mt_vern_profile_data.sas
 Library:  MVT
 Project:  NeighborhoodInfo DC
 Author:   O. Arena
 Created:  08/30/18
 Version:  SAS 9.2
 Environment:  Local Windows session
 
 Description:  Adapted from "BPKPresentationResults" program created by Somala Diby, this program 
 generates similar data for the MT. Vernon Triangle Profile area

**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( ACS )
%DCData_lib( Realprop )
%DCData_lib( Police )
%DCData_lib( NCDB )
%DCData_lib( Vital )
%DCData_lib( TANF )
%DCData_lib( MVT )
%DCData_lib( PresCat )

** Define time periods and variables **;
%let _years = _2012_16;
%let year_lbl = 2012-16;

%let acs_vars = 
			TotPop_2012_16
			NumHshlds_2012_16

			PopWithRace_2012_16
			PopBlackNonHispBridge_2012_16
			PopWhiteNonHispBridge_2012_16
			PopHisp_2012_16
			PopAsianPINonHispBridge_2012_16
			PopOtherNonHispBridge_2012_16
			PopForeignBorn_2012_16

			Pop25andOverYears_2012_16
			Pop25andOverWoutHS_2012_16
			Pop25andOverWHS_2012_16
			Pop25andOverWSC_2012_16
			Pop25andOverWCollege_2012_16

			PopEmployedByOcc&_years.
 			PopEmployedMngmt&_years.
			PopEmployedServ&_years.
			PopEmployedSales&_years.
			PopEmployedNatRes&_years.
			PopEmployedProd&_years.

			Pop16andOverYears_2012_16
			PopInCivLaborForce_2012_16
			PopCivilianEmployed_2012_16
			PopUnemployed_2012_16

			PersonsPovertyDefined_2012_16
			PopPoorPersons_2012_16
			poppoorchildren&_years.
			childrenpovertydefined&_years.

			popemployedworkers_2012_16
			earning10to15k_2012_16
			earning15to25k_2012_16 	
			earning25to35k_2012_16 
			earning35to50k_2012_16 
			earning50to65k_2012_16 
			earning65to75k_2012_16 
			earningover75k_2012_16 
			earningunder10k_2012_16


			NumHsgUnits_2012_16
			NumOccupiedHsgUnits_2012_16
			NumOwnerOccupiedHU_2012_16
			NumOwnerOccupiedHsgUnits_2012_16
			NumRenterOccupiedHU_2012_16
			NumRenterOccupiedHsgUnit_2012_16
			RentCostBurdenDenom&_years.
			OwnerCostBurdenDenom&_years.
			
			GrossRentLT100_2012_16
			GrossRent100_149_2012_16
			GrossRent150_199_2012_16
			GrossRent200_249_2012_16
			GrossRent250_299_2012_16
			GrossRent300_349_2012_16
			GrossRent350_349_2012_16 /*incorrect var name*/
			GrossRent400_449_2012_16
			GrossRent450_499_2012_16
			GrossRent500_549_2012_16
			GrossRent550_599_2012_16
			GrossRent600_649_2012_16
			GrossRent650_699_2012_16
			GrossRent700_749_2012_16
			GrossRent750_799_2012_16
			GrossRent800_899_2012_16
			GrossRent900_999_2012_16
			GrossRent1000_1249_2012_16
			GrossRent1250_1499_2012_16
			GrossRent1500_1999_2012_16
			GrossRent2000_2499_2012_16
			GrossRent2500_2999_2012_16
			GrossRent3000_3499_2012_16
			GrossRentGT3500_2012_16
			GrossRentNoCash_2012_16

			NumRenterCostBurden_2012_16
			NumRentSevereCostBurden_2012_16
			NumOwnerCostBurden_2012_16
			NumOwnSevereCostBurden_2012_16

			NumRentCstBurden_15_24_2012_16
			NumRentCstBurden_25_34_2012_16
			NumRentCstBurden_35_64_2012_16
			NumRentCstBurden_65Over_2012_16
			NumOwnCstBurden_15_24_2012_16
			NumOwnCstBurden_25_34_2012_16
			NumOwnCstBurden_35_64_2012_16
			NumOwnCstBurden_65Over_2012_16

			NumRentCstBurden_LT10K_2012_16
			NumRentCstBurden_10_19K_2012_16
			NumRentCstBurden_20_34K_2012_16
			NumRentCstBurden_35_49K_2012_16
			NumRentCstBurden_50_74K_2012_16
			NumRentCstBurden_75_99K_2012_16
			NumRentCstBurden_GT100K_2012_16
			NumOwnCstBurden_LT10K_2012_16
			NumOwnCstBurden_10_19K_2012_16
			NumOwnCstBurden_20_34K_2012_16
			NumOwnCstBurden_35_49K_2012_16
			NumOwnCstBurden_50_74K_2012_16
			NumOwnCstBurden_75_99K_2012_16
			NumOwnCstBurden_100_149_2012_16
			NumOwnCstBurden_GT150K_2012_16;

	%let ncdbold_vars = totpop_1990 totpop_2000 popwithrace_1990 popasianpinonhispbridge_1990 popblacknonhispbridge_1990 
			popothernonhispbridge_1990 popwhitenonhispbridge_1990 popnativeamnonhispbridge_1990 pophisp_1990
			popwithrace_2000 popasianpinonhispbridge_2000 popblacknonhispbridge_2000 popothernonhispbridge_2000
			popwhitenonhispbridge_2000 popnativeamnonhispbridge_2000 pophisp_2000 numhshlds_1990 numhshlds_2000
			numoccupiedhsgunits_1990 numoccupiedhsgunits_2000 totpop_1990 totpop_2000
			numoccupiedhsgunits_1990 numoccupiedhsgunits_2000 poppoorpersons_1990 poppoorpersons_2000 
			personspovertydefined_1990 personspovertydefined_2000 Pop16andOverYears_1990 PopInCivLaborForce_1990
			PopCivilianEmployed_1990 PopUnemployed_1990 Pop16andOverYears_2000 PopInCivLaborForce_2000
			PopCivilianEmployed_2000 PopUnemployed_2000;

	%let ncdb_vars = totpop_2010 popwithrace_2010 popasianpinonhispbridge_2010 popblacknonhispbridge_2010 popothernonhispbridge_2010
			popwhitenonhispbridge_2010 popnativeamnonhispbridge_2010 pophisp_2010 numoccupiedhsgunits_2010 totpop_2010 numoccupiedhsgunits_2010;

	%let birth_vars =births_total_2003 births_total_2004 births_total_2005 births_total_2006
				births_total_2007 births_total_2008 births_total_2009 births_total_2010 births_total_2011
				births_total_2012 births_total_2013 births_total_2014 births_total_2015 births_total_2016

				births_w_race_2003 births_w_race_2004 births_w_race_2005 births_w_race_2006
				births_w_race_2007 births_w_race_2008 births_w_race_2009 births_w_race_2010 births_w_race_2011
				births_w_race_2012 births_w_race_2013 births_w_race_2014 births_w_race_2015 births_w_race_2016

				births_white_2003 births_white_2004 births_white_2005 births_white_2006
				births_white_2007 births_white_2008 births_white_2009 births_white_2010 births_white_2011
				births_white_2012 births_white_2013 births_white_2014 births_white_2015 births_white_2016 

				births_black_2003 births_black_2004 births_black_2005 births_black_2006
				births_black_2007 births_black_2008 births_black_2009 births_black_2010 births_black_2011
				births_black_2012 births_black_2013 births_black_2014 births_black_2015 births_black_2016 

				births_hisp_2003 births_hisp_2004 births_hisp_2005 births_hisp_2006
				births_hisp_2007 births_hisp_2008 births_hisp_2009 births_hisp_2010 births_hisp_2011
				births_hisp_2012 births_hisp_2013 births_hisp_2014 births_hisp_2015 births_hisp_2016 

				births_asian_2003 births_asian_2004 births_asian_2005 births_asian_2006
				births_asian_2007 births_asian_2008 births_asian_2009 births_asian_2010 births_asian_2011
				births_asian_2012 births_asian_2013 births_asian_2014 births_asian_2015 births_asian_2016 

				births_oth_rac_2003 births_oth_rac_2004 births_oth_rac_2005 births_oth_rac_2006
				births_oth_rac_2007 births_oth_rac_2008 births_oth_rac_2009 births_oth_rac_2010 births_oth_rac_2011
				births_oth_rac_2012 births_oth_rac_2013 births_oth_rac_2014 births_oth_rac_2015 births_oth_rac_2016 

				births_prenat_adeq_2003 births_prenat_adeq_2004 births_prenat_adeq_2005 births_prenat_adeq_2006 
				births_prenat_adeq_2007 births_prenat_adeq_2008 births_prenat_adeq_2009 births_prenat_adeq_2010
				births_prenat_adeq_2011 births_prenat_adeq_2012 births_prenat_adeq_2013 births_prenat_adeq_2014
				births_prenat_adeq_2015 births_prenat_adeq_2016;
		
		%let sales_vars = sales_sf_2000 sales_sf_2001
				sales_sf_2002 sales_sf_2003 sales_sf_2004 sales_sf_2005 
				sales_sf_2006 sales_sf_2007 sales_sf_2008 sales_sf_2009 
				sales_sf_2010 sales_sf_2011 sales_sf_2012 sales_sf_2013
				sales_sf_2014 sales_sf_2015 sales_sf_2016 

				sales_condo_2000 sales_condo_2001
				sales_condo_2002 sales_condo_2003 sales_condo_2004 sales_condo_2005 
				sales_condo_2006 sales_condo_2007 sales_condo_2008 sales_condo_2009 
				sales_condo_2010 sales_condo_2011 sales_condo_2012 sales_condo_2013
				sales_condo_2014 sales_condo_2015 sales_condo_2016;

		%let crime_vars = crimes_pt1_property_2000 crimes_pt1_property_2001 
				crimes_pt1_property_2002 crimes_pt1_property_2003 crimes_pt1_property_2004 
				crimes_pt1_property_2005 crimes_pt1_property_2006 crimes_pt1_property_2007 
				crimes_pt1_property_2008 crimes_pt1_property_2009 crimes_pt1_property_2010
				crimes_pt1_property_2011 crimes_pt1_property_2012 crimes_pt1_property_2013
				crimes_pt1_property_2014 crimes_pt1_property_2015 crimes_pt1_property_2016 crimes_pt1_property_2017
				crimes_pt1_violent_2000 crimes_pt1_violent_2001 
				crimes_pt1_violent_2002 crimes_pt1_violent_2003 crimes_pt1_violent_2004 
				crimes_pt1_violent_2005 crimes_pt1_violent_2006 crimes_pt1_violent_2007 
				crimes_pt1_violent_2008 crimes_pt1_violent_2009 crimes_pt1_violent_2010 
				crimes_pt1_violent_2011 crimes_pt1_violent_2012 crimes_pt1_violent_2013 
				crimes_pt1_violent_2014 crimes_pt1_violent_2015 crimes_pt1_violent_2016  crimes_pt1_violent_2017
				crime_rate_pop_2000 crime_rate_pop_2001 crime_rate_pop_2002 crime_rate_pop_2003 
				crime_rate_pop_2004 crime_rate_pop_2005 crime_rate_pop_2006 crime_rate_pop_2007 
				crime_rate_pop_2008 crime_rate_pop_2009 crime_rate_pop_2010 crime_rate_pop_2011 
				crime_rate_pop_2012 crime_rate_pop_2013 crime_rate_pop_2014 crime_rate_pop_2015 
				crime_rate_pop_2016 crime_rate_pop_2017;

		%let fs_vars = fs_client_2003 fs_client_2004 fs_client_2005 fs_client_2006
				fs_client_2007 fs_client_2008 fs_client_2009 fs_client_2010 fs_client_2011
				fs_client_2012 fs_client_2013 fs_client_2014 fs_client_2015 fs_client_2016

				fs_white_2003 fs_white_2004 fs_white_2005 fs_white_2006
				fs_white_2007 fs_white_2008 fs_white_2009 fs_white_2010 fs_white_2011
				fs_white_2012 fs_white_2013 fs_white_2014 fs_white_2015 fs_white_2016 

				fs_black_2003 fs_black_2004 fs_black_2005 fs_black_2006
				fs_black_2007 fs_black_2008 fs_black_2009 fs_black_2010 fs_black_2011
				fs_black_2012 fs_black_2013 fs_black_2014 fs_black_2015 fs_black_2016 

				fs_hisp_2003 fs_hisp_2004 fs_hisp_2005 fs_hisp_2006
				fs_hisp_2007 fs_hisp_2008 fs_hisp_2009 fs_hisp_2010 fs_hisp_2011
				fs_hisp_2012 fs_hisp_2013 fs_hisp_2014 fs_hisp_2015 fs_hisp_2016 

				fs_asian_2003 fs_asian_2004 fs_asian_2005 fs_asian_2006
				fs_asian_2007 fs_asian_2008 fs_asian_2009 fs_asian_2010 fs_asian_2011
				fs_asian_2012 fs_asian_2013 fs_asian_2014 fs_asian_2015 fs_asian_2016 

				fs_oth_rac_2003 fs_oth_rac_2004 fs_oth_rac_2005 fs_oth_rac_2006
				fs_oth_rac_2007 fs_oth_rac_2008 fs_oth_rac_2009 fs_oth_rac_2010 fs_oth_rac_2011
				fs_oth_rac_2012 fs_oth_rac_2013 fs_oth_rac_2014 fs_oth_rac_2015 fs_oth_rac_2016

				fs_w_race_2003 fs_w_race_2004 fs_w_race_2005 fs_w_race_2006
				fs_w_race_2007 fs_w_race_2008 fs_w_race_2009 fs_w_race_2010 fs_w_race_2011
				fs_w_race_2012 fs_w_race_2013 fs_w_race_2014 fs_w_race_2015 fs_w_race_2016;


		%let tanf_vars = tanf_client_2003 tanf_client_2004 tanf_client_2005 tanf_client_2006
				tanf_client_2007 tanf_client_2008 tanf_client_2009 tanf_client_2010 tanf_client_2011
				tanf_client_2012 tanf_client_2013 tanf_client_2014 tanf_client_2015 tanf_client_2016

				tanf_white_2003 tanf_white_2004 tanf_white_2005 tanf_white_2006
				tanf_white_2007 tanf_white_2008 tanf_white_2009 tanf_white_2010 tanf_white_2011
				tanf_white_2012 tanf_white_2013 tanf_white_2014 tanf_white_2015 tanf_white_2016 

				tanf_black_2003 tanf_black_2004 tanf_black_2005 tanf_black_2006
				tanf_black_2007 tanf_black_2008 tanf_black_2009 tanf_black_2010 tanf_black_2011
				tanf_black_2012 tanf_black_2013 tanf_black_2014 tanf_black_2015 tanf_black_2016 

				tanf_hisp_2003 tanf_hisp_2004 tanf_hisp_2005 tanf_hisp_2006
				tanf_hisp_2007 tanf_hisp_2008 tanf_hisp_2009 tanf_hisp_2010 tanf_hisp_2011
				tanf_hisp_2012 tanf_hisp_2013 tanf_hisp_2014 tanf_hisp_2015 tanf_hisp_2016 

				tanf_asian_2003 tanf_asian_2004 tanf_asian_2005 tanf_asian_2006
				tanf_asian_2007 tanf_asian_2008 tanf_asian_2009 tanf_asian_2010 tanf_asian_2011
				tanf_asian_2012 tanf_asian_2013 tanf_asian_2014 tanf_asian_2015 tanf_asian_2016 

				tanf_oth_rac_2003 tanf_oth_rac_2004 tanf_oth_rac_2005 tanf_oth_rac_2006
				tanf_oth_rac_2007 tanf_oth_rac_2008 tanf_oth_rac_2009 tanf_oth_rac_2010 tanf_oth_rac_2011
				tanf_oth_rac_2012 tanf_oth_rac_2013 tanf_oth_rac_2014 tanf_oth_rac_2015 tanf_oth_rac_2016

				tanf_w_race_2003 tanf_w_race_2004 tanf_w_race_2005 tanf_w_race_2006
				tanf_w_race_2007 tanf_w_race_2008 tanf_w_race_2009 tanf_w_race_2010 tanf_w_race_2011
				tanf_w_race_2012 tanf_w_race_2013 tanf_w_race_2014 tanf_w_race_2015 tanf_w_race_2016;

		%let unit_vars = units_sf_2000 units_sf_2001 units_sf_2002 
				units_sf_2003 units_sf_2004 units_sf_2005 units_sf_2006 units_sf_2007 
				units_sf_2008 units_sf_2009 units_sf_2010 units_sf_2011 units_sf_2012 
				units_sf_2013 units_sf_2014 units_sf_2015 units_sf_2016 units_sf_2017 units_sf_2018

				units_condo_2000 units_condo_2001 units_condo_2002
				units_condo_2003 units_condo_2004 units_condo_2005 units_condo_2006 units_condo_2007 
				units_condo_2008 units_condo_2009 units_condo_2010 units_condo_2011 units_condo_2012 
				units_condo_2013 units_condo_2014 units_condo_2015 units_condo_2016 units_condo_2017 units_condo_2018;

		%let price_vars = 
				mprice2003 mprice2004 mprice2005 mprice2006 mprice2007 
				mprice2008 mprice2009 mprice2010 mprice2011 mprice2012 
				mprice2013 mprice2014 mprice2015 mprice2016 mprice2017 mprice2018;

		%let subs_vars = Proj_Units_Assist_Min_Sum Proj_Units_Assist_Max_Sum;


data project;
set prescat.project;
length city $1;
format city $CITY16.;
city = "1";
run;


%macro Compile_mvt_data (geo, geosuf);

proc sort data=project out = project_tab_&geosuf;
	by &geo;
run;

proc tabulate data = project_tab_&geosuf out = project_&geosuf;
where status = 'A';
class &geo;
var Proj_Units_Assist_Min Proj_Units_Assist_Max ;
table &geo, (sum) *Proj_Units_Assist_Min Proj_Units_Assist_Max;
run;

data compile_mvt_tabs_&geosuf;
	merge	ACS.acs_2012_16_dc_sum_tr_&geosuf
			(keep= &geo &acs_vars)
		
		NCDB.Ncdb_sum_&geosuf
			(keep= &geo &ncdbold_vars)

		NCDB.Ncdb_sum_2010_&geosuf
			(keep= &geo &ncdb_vars) 

			/*Annual Data Points*/

		RealProp.sales_sum_&geosuf 
			(keep= &geo &sales_vars)

		Police.crimes_sum_&geosuf
			(keep=&geo &crime_vars)

		Vital.births_sum_&geosuf
			(keep=&geo &birth_vars)

		Tanf.tanf_sum_&geosuf
			(keep=&geo &tanf_vars)

		Tanf.fs_sum_&geosuf
			(keep=&geo &fs_vars)

		RealPr_r.num_units_&geosuf 
			(keep= &geo &unit_vars)

		project_&geosuf (keep = &geo &subs_vars);

		by &geo;
				
run;


**Add Median Sales Price seperately as target area will need to be aggregated later**;

data sales_res;
	set realpr_r.sales_res_clean;
	saleyear=year(saledate);
	
			%dollar_convert( saleprice, sale_adj, saleyear, 2017, series=CUUR0000SA0L2 )

run;

proc sort data=sales_res;
	by &geo;
run;

proc tabulate data = sales_res out = price_tab_&geosuf;
class &geo saleyear;
var sale_adj ;
table &geo, saleyear *(median) *sale_adj;
run;

proc transpose data=price_tab_&geosuf out=price_&geosuf prefix=mprice;
    by &geo ;
    id saleyear;
    var sale_adj_median;
run;

%if &geo = ward2012 %then %do;	
data compile_mvt_tabs_wd12_full;
	merge compile_mvt_tabs_wd12 price_wd12 (keep= &geo &price_vars);
	by &geo;
run; %end;
%else %if &geo = city %then %do;
data compile_mvt_tabs_city_full;
	merge compile_mvt_tabs_city price_city (keep= &geo &price_vars);
	by &geo;
run; %end;
%mend Compile_mvt_data;


%Compile_mvt_data (geo2010, tr10);
%Compile_mvt_data (ward2012, wd12);
%Compile_mvt_data (city, city);

**Select out target areas**;

data compile_mvt_tabs_tr10_select;
	set compile_mvt_tabs_tr10;
	if Geo2010 in("11001004701","11001004702") then target = 1;
	if Geo2010 in("11001010600","11001004600","11001004802","11001004902","11001005800","11001005900") then target = 2;
	if Geo2010 not in("11001004701","11001004702","11001010600","11001004600","11001004802","11001004902","11001005800","11001005900") then delete;
run;

data compile_mvt_tabs_wd12_select;
	set compile_mvt_tabs_wd12_full;
	if Ward2012 in("3","4","5","7","8") then delete;
	length geography $20.;
	geography = Ward2012;
run;

data compile_mvt_tabs_city_select;
	set compile_mvt_tabs_city_full;
	length geography $20.;
	geography = "Washington DC";
run;

**Summarize data by whether they are target or target adjacent tracts**;

proc sort data = compile_mvt_tabs_tr10_select; by target; run;

proc summary data = compile_mvt_tabs_tr10_select; output out = compile_mvt_tabs_target sum=; 
	where target = 1;
	var &acs_vars &ncdbold_vars &ncdb_vars &sales_vars &crime_vars &birth_vars &tanf_vars &fs_vars &unit_vars &subs_vars;
run;

data compile_mvt_tabs_target_select;
	set compile_mvt_tabs_target;
	length geography $20.;
	geography = "Census Tract 47";
	target = 1;
run;

proc summary data = compile_mvt_tabs_tr10_select ; output out = compile_mvt_tabs_target_adj sum=;
	var &acs_vars &ncdbold_vars &ncdb_vars &sales_vars &crime_vars &birth_vars &tanf_vars &fs_vars &unit_vars &subs_vars;
run;

data compile_mvt_tabs_adj_select;
	set compile_mvt_tabs_target_adj;
	length geography $20.;
	geography = "MVT Target Area";
	target = 2;
run;

**Add sales data to target level file**;

data sales_res_target;
	set realprop.sales_res_clean;
	saleyear=year(saledate);
	if Geo2010 in("11001004701","11001004702") then target = 1;
	if Geo2010 in("11001010600","11001004600","11001004802","11001004902","11001005800","11001005900") then target = 2;
	%dollar_convert( saleprice, sale_adj, saleyear, 2017, series=CUUR0000SA0L2 )
run;

proc sort data=sales_res_target;
	by target;
run;

proc tabulate data = sales_res_target out = price_tab_target;
class target saleyear;
var sale_adj ;
table target, saleyear *(median) *sale_adj;
run;

proc transpose data=price_tab_target out=price_target prefix=mprice;
    by target ;
    id saleyear;
    var sale_adj_median;
run;

data compile_mvt_tabs_tracts;
	set compile_mvt_tabs_target_select compile_mvt_tabs_adj_select;
run;

data compile_mvt_tabs_tracts_select;
	merge compile_mvt_tabs_tracts price_target (keep= target &price_vars);
	by target;
run;

**Aggregate into one data set**;

data compile_mvt_tabs_full;
	set compile_mvt_tabs_tracts_select compile_mvt_tabs_wd12_select compile_mvt_tabs_city_select;

		/*Race and ethnicity*/
			PctWht&_years. = popwhitenonhispbridge&_years. / popwithrace&_years.;
			PctBlk&_years. = popblacknonhispbridge&_years. / popwithrace&_years.;
			PctHisp&_years. = pophisp&_years. / popwithrace&_years.;
			PctAsn&_years. = popasianpinonhispbridge&_years. / popwithrace&_years.;
			PctOth&_years. = popothernonhispbridge&_years. / popwithrace&_years.;

		/*Education*/
			PctHS&_years. = pop25andoverwhs&_years. / pop25andoveryears&_years.;
			PctCol&_years. = pop25andoverwcollege&_years. / pop25andoveryears&_years.;
			PctWoutHS&_years. = Pop25andOverWoutHS&_years. / pop25andoveryears&_years.; 

		/*Homeownership, rent, and cost burden by age of householder and household income*/
			PctOwnerOccupiedHU&_years. = numowneroccupiedhu&_years. / numoccupiedhsgunits&_years.;
			PctRenterOccupiedHU&_years. = numrenteroccupiedhu&_years. / numoccupiedhsgunits&_years.;

			PctRenterCostBurden&_years. = NumRenterCostBurden&_years./RentCostBurdenDenom&_years.;
			PctRentSevereCostBurden&_years. = NumRentSevereCostBurden&_years./RentCostBurdenDenom&_years.;
			PctOwnerCostBurden&_years. = NumOwnerCostBurden&_years./OwnerCostBurdenDenom&_years.;
			PctOwnSevereCostBurden&_years. = NumOwnSevereCostBurden&_years./OwnerCostBurdenDenom&_years.;

		/*Employment by major occupations*/
			PctEmpMngmt&_years. = popemployedmngmt&_years. / popemployedbyocc_2012_16;
			PctEmpNatRes&_years. = popemployednatres&_years. / popemployedbyocc_2012_16;
			PctEmpProd&_years. = popemployedprod&_years. / popemployedbyocc_2012_16;
			PctEmpSales&_years. = popemployedsales&_years. / popemployedbyocc_2012_16;
			PctEmpServ&_years. = popemployedserv&_years. / popemployedbyocc_2012_16;

		/*Labor force, employment, and poverty*/
			PctLaborForce&_years. = popincivlaborforce&_years. / pop16andoveryears&_years.;
			PctPopEmployed&_years. = popcivilianemployed&_years. / popincivlaborforce&_years.;
			PctPopUnemployed&_years. = popunemployed&_years. / popincivlaborforce&_years.;
			PctPoorPersons&_years. = poppoorpersons&_years. / personspovertydefined&_years.;
			PctPoorChildren&_years. = poppoorchildren&_years. / childrenpovertydefined&_years.;

		/*Property crime rates*/
			property_crime_rate_2000 = crimes_pt1_property_2000 / crime_rate_pop_2000;
			property_crime_rate_2001 = crimes_pt1_property_2001 / crime_rate_pop_2001;
			property_crime_rate_2002 = crimes_pt1_property_2002 / crime_rate_pop_2002;
			property_crime_rate_2003 = crimes_pt1_property_2003 / crime_rate_pop_2003;
			property_crime_rate_2004 = crimes_pt1_property_2004 / crime_rate_pop_2004;
			property_crime_rate_2005 = crimes_pt1_property_2005 / crime_rate_pop_2005;
			property_crime_rate_2006 = crimes_pt1_property_2006 / crime_rate_pop_2006;
			property_crime_rate_2007 = crimes_pt1_property_2007 / crime_rate_pop_2007;
			property_crime_rate_2008 = crimes_pt1_property_2008 / crime_rate_pop_2008;
			property_crime_rate_2009 = crimes_pt1_property_2009 / crime_rate_pop_2009;
			property_crime_rate_2010 = crimes_pt1_property_2010 / crime_rate_pop_2010;
			property_crime_rate_2011 = crimes_pt1_property_2011 / crime_rate_pop_2011;
			property_crime_rate_2012 = crimes_pt1_property_2012 / crime_rate_pop_2012;
			property_crime_rate_2013 = crimes_pt1_property_2013 / crime_rate_pop_2013;
			property_crime_rate_2014 = crimes_pt1_property_2014 / crime_rate_pop_2014;
			property_crime_rate_2015 = crimes_pt1_property_2015 / crime_rate_pop_2015;
			property_crime_rate_2016 = crimes_pt1_property_2016 / crime_rate_pop_2016;
			property_crime_rate_2017 = crimes_pt1_property_2017 / crime_rate_pop_2017;


		/*Violent crime rates*/
			violent_crime_rate_2000 = crimes_pt1_violent_2000 / crime_rate_pop_2000;
			violent_crime_rate_2001 = crimes_pt1_violent_2001 / crime_rate_pop_2001;
			violent_crime_rate_2002 = crimes_pt1_violent_2002 / crime_rate_pop_2002;
			violent_crime_rate_2003 = crimes_pt1_violent_2003 / crime_rate_pop_2003;
			violent_crime_rate_2004 = crimes_pt1_violent_2004 / crime_rate_pop_2004;
			violent_crime_rate_2005 = crimes_pt1_violent_2005 / crime_rate_pop_2005;
			violent_crime_rate_2006 = crimes_pt1_violent_2006 / crime_rate_pop_2006;
			violent_crime_rate_2007 = crimes_pt1_violent_2007 / crime_rate_pop_2007;
			violent_crime_rate_2008 = crimes_pt1_violent_2008 / crime_rate_pop_2008;
			violent_crime_rate_2009 = crimes_pt1_violent_2009 / crime_rate_pop_2009;
			violent_crime_rate_2010 = crimes_pt1_violent_2010 / crime_rate_pop_2010;
			violent_crime_rate_2011 = crimes_pt1_violent_2011 / crime_rate_pop_2011;
			violent_crime_rate_2012 = crimes_pt1_violent_2012 / crime_rate_pop_2012;
			violent_crime_rate_2013 = crimes_pt1_violent_2013 / crime_rate_pop_2013;
			violent_crime_rate_2014 = crimes_pt1_violent_2014 / crime_rate_pop_2014;
			violent_crime_rate_2015 = crimes_pt1_violent_2015 / crime_rate_pop_2015;
			violent_crime_rate_2016 = crimes_pt1_violent_2016 / crime_rate_pop_2016;
			violent_crime_rate_2017 = crimes_pt1_violent_2017 / crime_rate_pop_2017;

		/*Births by race*/

pctbirths_asi_2003 = births_asian_2003/births_w_race_2003; pctbirths_asi_2004 = births_asian_2004/births_w_race_2004; pctbirths_asi_2005 = births_asian_2005/births_w_race_2005; pctbirths_asi_2006 = births_asian_2006/births_w_race_2006; pctbirths_asi_2007 = births_asian_2007/births_w_race_2007; pctbirths_asi_2008 = births_asian_2008/births_w_race_2008; pctbirths_asi_2009 = births_asian_2009/births_w_race_2009; pctbirths_asi_2010 = births_asian_2010/births_w_race_2010; pctbirths_asi_2011 = births_asian_2011/births_w_race_2011; pctbirths_asi_2012 = births_asian_2012/births_w_race_2012; pctbirths_asi_2013 = births_asian_2013/births_w_race_2013; pctbirths_asi_2014 = births_asian_2014/births_w_race_2014; pctbirths_asi_2015 = births_asian_2015/births_w_race_2015; pctbirths_asi_2016 = births_asian_2016/births_w_race_2016; 
			 
pctbirths_blk_2003 = births_black_2003/births_w_race_2003; pctbirths_blk_2004 = births_black_2004/births_w_race_2004; pctbirths_blk_2005 = births_black_2005/births_w_race_2005; pctbirths_blk_2006 = births_black_2006/births_w_race_2006; pctbirths_blk_2007 = births_black_2007/births_w_race_2007; pctbirths_blk_2008 = births_black_2008/births_w_race_2008; pctbirths_blk_2009 = births_black_2009/births_w_race_2009; pctbirths_blk_2010 = births_black_2010/births_w_race_2010; pctbirths_blk_2011 = births_black_2011/births_w_race_2011; pctbirths_blk_2012 = births_black_2012/births_w_race_2012; pctbirths_blk_2013 = births_black_2013/births_w_race_2013; pctbirths_blk_2014 = births_black_2014/births_w_race_2014; pctbirths_blk_2015 = births_black_2015/births_w_race_2015; pctbirths_blk_2016 = births_black_2016/births_w_race_2016; 
pctbirths_hsp_2003 = births_hisp_2003/births_w_race_2003; pctbirths_hsp_2004 = births_hisp_2004/births_w_race_2004; pctbirths_hsp_2005 = births_hisp_2005/births_w_race_2005; pctbirths_hsp_2006 = births_hisp_2006/births_w_race_2006; pctbirths_hsp_2007 = births_hisp_2007/births_w_race_2007; pctbirths_hsp_2008 = births_hisp_2008/births_w_race_2008; pctbirths_hsp_2009 = births_hisp_2009/births_w_race_2009; pctbirths_hsp_2010 = births_hisp_2010/births_w_race_2010; pctbirths_hsp_2011 = births_hisp_2011/births_w_race_2011; pctbirths_hsp_2012 = births_hisp_2012/births_w_race_2012; pctbirths_hsp_2013 = births_hisp_2013/births_w_race_2013; pctbirths_hsp_2014 = births_hisp_2014/births_w_race_2014; pctbirths_hsp_2015 = births_hisp_2015/births_w_race_2015; pctbirths_hsp_2016 = births_hisp_2016/births_w_race_2016; 

			pctbirths_wht_2003 = births_white_2003/births_w_race_2003;
			pctbirths_wht_2004 = births_white_2004/births_w_race_2004;
			pctbirths_wht_2005 = births_white_2005/births_w_race_2005;
			pctbirths_wht_2006 = births_white_2006/births_w_race_2006;
			pctbirths_wht_2007 = births_white_2007/births_w_race_2007;
			pctbirths_wht_2008 = births_white_2008/births_w_race_2008;
			pctbirths_wht_2009 = births_white_2009/births_w_race_2009;
			pctbirths_wht_2010 = births_white_2010/births_w_race_2010;
			pctbirths_wht_2011 = births_white_2011/births_w_race_2011;
			pctbirths_wht_2012 = births_white_2012/births_w_race_2012;
			pctbirths_wht_2013 = births_white_2013/births_w_race_2013; 
			pctbirths_wht_2014 = births_white_2014/births_w_race_2014;
			pctbirths_wht_2015 = births_white_2015/births_w_race_2015;
			pctbirths_wht_2016 = births_white_2016/births_w_race_2016;

			/*Tanf and Snap by race*/

			

pctfs_asi_2003 = fs_asian_2003/fs_w_race_2003; pctfs_asi_2004 = fs_asian_2004/fs_w_race_2004; pctfs_asi_2005 = fs_asian_2005/fs_w_race_2005; pctfs_asi_2006 = fs_asian_2006/fs_w_race_2006; pctfs_asi_2007 = fs_asian_2007/fs_w_race_2007; pctfs_asi_2008 = fs_asian_2008/fs_w_race_2008; pctfs_asi_2009 = fs_asian_2009/fs_w_race_2009; pctfs_asi_2010 = fs_asian_2010/fs_w_race_2010; pctfs_asi_2011 = fs_asian_2011/fs_w_race_2011; pctfs_asi_2012 = fs_asian_2012/fs_w_race_2012; pctfs_asi_2013 = fs_asian_2013/fs_w_race_2013; pctfs_asi_2014 = fs_asian_2014/fs_w_race_2014; pctfs_asi_2015 = fs_asian_2015/fs_w_race_2015; pctfs_asi_2016 = fs_asian_2016/fs_w_race_2016; 
			 
pctfs_blk_2003 = fs_black_2003/fs_w_race_2003; pctfs_blk_2004 = fs_black_2004/fs_w_race_2004; pctfs_blk_2005 = fs_black_2005/fs_w_race_2005; pctfs_blk_2006 = fs_black_2006/fs_w_race_2006; pctfs_blk_2007 = fs_black_2007/fs_w_race_2007; pctfs_blk_2008 = fs_black_2008/fs_w_race_2008; pctfs_blk_2009 = fs_black_2009/fs_w_race_2009; pctfs_blk_2010 = fs_black_2010/fs_w_race_2010; pctfs_blk_2011 = fs_black_2011/fs_w_race_2011; pctfs_blk_2012 = fs_black_2012/fs_w_race_2012; pctfs_blk_2013 = fs_black_2013/fs_w_race_2013; pctfs_blk_2014 = fs_black_2014/fs_w_race_2014; pctfs_blk_2015 = fs_black_2015/fs_w_race_2015; pctfs_blk_2016 = fs_black_2016/fs_w_race_2016; 
pctfs_hsp_2003 = fs_hisp_2003/fs_w_race_2003; pctfs_hsp_2004 = fs_hisp_2004/fs_w_race_2004; pctfs_hsp_2005 = fs_hisp_2005/fs_w_race_2005; pctfs_hsp_2006 = fs_hisp_2006/fs_w_race_2006; pctfs_hsp_2007 = fs_hisp_2007/fs_w_race_2007; pctfs_hsp_2008 = fs_hisp_2008/fs_w_race_2008; pctfs_hsp_2009 = fs_hisp_2009/fs_w_race_2009; pctfs_hsp_2010 = fs_hisp_2010/fs_w_race_2010; pctfs_hsp_2011 = fs_hisp_2011/fs_w_race_2011; pctfs_hsp_2012 = fs_hisp_2012/fs_w_race_2012; pctfs_hsp_2013 = fs_hisp_2013/fs_w_race_2013; pctfs_hsp_2014 = fs_hisp_2014/fs_w_race_2014; pctfs_hsp_2015 = fs_hisp_2015/fs_w_race_2015; pctfs_hsp_2016 = fs_hisp_2016/fs_w_race_2016; 

			pctfs_wht_2003 = fs_white_2003/fs_w_race_2003;
			pctfs_wht_2004 = fs_white_2004/fs_w_race_2004;
			pctfs_wht_2005 = fs_white_2005/fs_w_race_2005;
			pctfs_wht_2006 = fs_white_2006/fs_w_race_2006;
			pctfs_wht_2007 = fs_white_2007/fs_w_race_2007;
			pctfs_wht_2008 = fs_white_2008/fs_w_race_2008;
			pctfs_wht_2009 = fs_white_2009/fs_w_race_2009;
			pctfs_wht_2010 = fs_white_2010/fs_w_race_2010;
			pctfs_wht_2011 = fs_white_2011/fs_w_race_2011;
			pctfs_wht_2012 = fs_white_2012/fs_w_race_2012;
			pctfs_wht_2013 = fs_white_2013/fs_w_race_2013; 
			pctfs_wht_2014 = fs_white_2014/fs_w_race_2014;
			pctfs_wht_2015 = fs_white_2015/fs_w_race_2015;
			pctfs_wht_2016 = fs_white_2016/fs_w_race_2016;


pcttanf_asi_2003 = tanf_asian_2003/tanf_w_race_2003; pcttanf_asi_2004 = tanf_asian_2004/tanf_w_race_2004; pcttanf_asi_2005 = tanf_asian_2005/tanf_w_race_2005; pcttanf_asi_2006 = tanf_asian_2006/tanf_w_race_2006; pcttanf_asi_2007 = tanf_asian_2007/tanf_w_race_2007; pcttanf_asi_2008 = tanf_asian_2008/tanf_w_race_2008; pcttanf_asi_2009 = tanf_asian_2009/tanf_w_race_2009; pcttanf_asi_2010 = tanf_asian_2010/tanf_w_race_2010; pcttanf_asi_2011 = tanf_asian_2011/tanf_w_race_2011; pcttanf_asi_2012 = tanf_asian_2012/tanf_w_race_2012; pcttanf_asi_2013 = tanf_asian_2013/tanf_w_race_2013; pcttanf_asi_2014 = tanf_asian_2014/tanf_w_race_2014; pcttanf_asi_2015 = tanf_asian_2015/tanf_w_race_2015; pcttanf_asi_2016 = tanf_asian_2016/tanf_w_race_2016; 
			 
pcttanf_blk_2003 = tanf_black_2003/tanf_w_race_2003; pcttanf_blk_2004 = tanf_black_2004/tanf_w_race_2004; pcttanf_blk_2005 = tanf_black_2005/tanf_w_race_2005; pcttanf_blk_2006 = tanf_black_2006/tanf_w_race_2006; pcttanf_blk_2007 = tanf_black_2007/tanf_w_race_2007; pcttanf_blk_2008 = tanf_black_2008/tanf_w_race_2008; pcttanf_blk_2009 = tanf_black_2009/tanf_w_race_2009; pcttanf_blk_2010 = tanf_black_2010/tanf_w_race_2010; pcttanf_blk_2011 = tanf_black_2011/tanf_w_race_2011; pcttanf_blk_2012 = tanf_black_2012/tanf_w_race_2012; pcttanf_blk_2013 = tanf_black_2013/tanf_w_race_2013; pcttanf_blk_2014 = tanf_black_2014/tanf_w_race_2014; pcttanf_blk_2015 = tanf_black_2015/tanf_w_race_2015; pcttanf_blk_2016 = tanf_black_2016/tanf_w_race_2016; 
pcttanf_hsp_2003 = tanf_hisp_2003/tanf_w_race_2003; pcttanf_hsp_2004 = tanf_hisp_2004/tanf_w_race_2004; pcttanf_hsp_2005 = tanf_hisp_2005/tanf_w_race_2005; pcttanf_hsp_2006 = tanf_hisp_2006/tanf_w_race_2006; pcttanf_hsp_2007 = tanf_hisp_2007/tanf_w_race_2007; pcttanf_hsp_2008 = tanf_hisp_2008/tanf_w_race_2008; pcttanf_hsp_2009 = tanf_hisp_2009/tanf_w_race_2009; pcttanf_hsp_2010 = tanf_hisp_2010/tanf_w_race_2010; pcttanf_hsp_2011 = tanf_hisp_2011/tanf_w_race_2011; pcttanf_hsp_2012 = tanf_hisp_2012/tanf_w_race_2012; pcttanf_hsp_2013 = tanf_hisp_2013/tanf_w_race_2013; pcttanf_hsp_2014 = tanf_hisp_2014/tanf_w_race_2014; pcttanf_hsp_2015 = tanf_hisp_2015/tanf_w_race_2015; pcttanf_hsp_2016 = tanf_hisp_2016/tanf_w_race_2016; 

			pcttanf_wht_2003 = tanf_white_2003/tanf_w_race_2003;
			pcttanf_wht_2004 = tanf_white_2004/tanf_w_race_2004;
			pcttanf_wht_2005 = tanf_white_2005/tanf_w_race_2005;
			pcttanf_wht_2006 = tanf_white_2006/tanf_w_race_2006;
			pcttanf_wht_2007 = tanf_white_2007/tanf_w_race_2007;
			pcttanf_wht_2008 = tanf_white_2008/tanf_w_race_2008;
			pcttanf_wht_2009 = tanf_white_2009/tanf_w_race_2009;
			pcttanf_wht_2010 = tanf_white_2010/tanf_w_race_2010;
			pcttanf_wht_2011 = tanf_white_2011/tanf_w_race_2011;
			pcttanf_wht_2012 = tanf_white_2012/tanf_w_race_2012;
			pcttanf_wht_2013 = tanf_white_2013/tanf_w_race_2013; 
			pcttanf_wht_2014 = tanf_white_2014/tanf_w_race_2014;
			pcttanf_wht_2015 = tanf_white_2015/tanf_w_race_2015;
			pcttanf_wht_2016 = tanf_white_2016/tanf_w_race_2016;


if geography="1" then geography="Ward 1";
if geography="2" then geography="Ward 2";
if geography="6" then geography="Ward 6";

run;

**Transpose from wide to long data where observations are the indicators**;

proc transpose data=compile_mvt_tabs_full out=mvt_tabs(label="MVT Tabulations");
	var geography &acs_vars &ncdbold_vars &ncdb_vars &sales_vars &birth_vars &tanf_vars &fs_vars &unit_vars &price_vars &subs_vars
		/*Race and ethnicity*/
			PctWht&_years.
			PctBlk&_years.
			PctHisp&_years.
			PctAsn&_years. 
			PctOth&_years.

		/*Education*/
			PctHS&_years.
			PctCol&_years. 
			PctWoutHS&_years.

		/*Homeownership, rent, and cost burden by age of householder and household income*/
			PctOwnerOccupiedHU&_years. 
			PctRenterOccupiedHU&_years.

		/*Employment by major occupations*/
			PctEmpMngmt&_years. 
			PctEmpNatRes&_years. 
			PctEmpProd&_years.
			PctEmpSales&_years.
			PctEmpServ&_years.

		/*Labor force, employment, and poverty*/
			PctLaborForce&_years. 
			PctPopEmployed&_years. 
			PctPopUnemployed&_years.
			PctPoorPersons&_years. 
			PctPoorChildren&_years. 

		/*Property crime rates*/
			property_crime_rate_2000
			property_crime_rate_2001
			property_crime_rate_2002 
			property_crime_rate_2003 
			property_crime_rate_2004 
			property_crime_rate_2005 
			property_crime_rate_2006 
			property_crime_rate_2007
			property_crime_rate_2008 
			property_crime_rate_2009
			property_crime_rate_2010 
			property_crime_rate_2011 
			property_crime_rate_2012
			property_crime_rate_2013 
			property_crime_rate_2014 
			property_crime_rate_2015
			property_crime_rate_2016 
			property_crime_rate_2017


		/*Violent crime rates*/
			violent_crime_rate_2000 
			violent_crime_rate_2001
			violent_crime_rate_2002 
			violent_crime_rate_2003 
			violent_crime_rate_2004
			violent_crime_rate_2005 
			violent_crime_rate_2006
			violent_crime_rate_2007
			violent_crime_rate_2008
			violent_crime_rate_2009
			violent_crime_rate_2010
			violent_crime_rate_2011
			violent_crime_rate_2012
			violent_crime_rate_2013
			violent_crime_rate_2014
			violent_crime_rate_2015
			violent_crime_rate_2016
			violent_crime_rate_2017;
id geography; 
run; 

proc sort data = compile_mvt_tabs_full;
	by geography;
run;

/*
ods tagsets.excelxp file="D:\Users\MCohen\Box Sync\MCohen\MVT Profile\mvtprofile.xls" 
      options( sheet_interval='' );
ods listing close;

ods tagsets.excelxp options( sheet_name="Population");
proc print data= compile_mvt_tabs_full label noobs;
  var geography totpop_1990 totpop_2000 totpop_2010 
  		popwithrace_1990 popasianpinonhispbridge_1990 popblacknonhispbridge_1990 
		popothernonhispbridge_1990 popwhitenonhispbridge_1990 popnativeamnonhispbridge_1990 pophisp_1990
		popwithrace_2000 popasianpinonhispbridge_2000 popblacknonhispbridge_2000 popothernonhispbridge_2000
		popwhitenonhispbridge_2000 popnativeamnonhispbridge_2000 pophisp_2000 popwithrace_2010
		popasianpinonhispbridge_2010 popblacknonhispbridge_2010 popothernonhispbridge_2010 
		popwhitenonhispbridge_2010 popnativeamnonhispbridge_2010 pophisp_2010;
run;

ods tagsets.excelxp options( sheet_name="Race Trends");
proc print data= compile_mvt_tabs_full label noobs;
  var geography 		popwithrace_1990 popasianpinonhispbridge_1990 popblacknonhispbridge_1990 
		popothernonhispbridge_1990 popwhitenonhispbridge_1990 popnativeamnonhispbridge_1990 pophisp_1990
		popwithrace_2000 popasianpinonhispbridge_2000 popblacknonhispbridge_2000 popothernonhispbridge_2000
		popwhitenonhispbridge_2000 popnativeamnonhispbridge_2000 pophisp_2000 popwithrace_2010
		popasianpinonhispbridge_2010 popblacknonhispbridge_2010 popothernonhispbridge_2010 
		popwhitenonhispbridge_2010 popnativeamnonhispbridge_2010 pophisp_2010;
run;

ods tagsets.excelxp options( sheet_name="Curr Race");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography
			PctWht&_years. 
			PctBlk&_years.
			PctHisp&_years.
			PctAsn&_years.
			PctOth&_years.;
run;

ods tagsets.excelxp options( sheet_name="Births");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography births_total_2003 
		births_total_2004 births_total_2005 births_total_2006 births_total_2007 births_total_2008 
		births_total_2009 births_total_2010 births_total_2011 births_total_2012 births_total_2013 
		births_total_2014 births_total_2015 births_total_2016;
run;

ods tagsets.excelxp options( sheet_name="Births by Race");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography pctbirths_b: pctbirths_w: pctbirths_a: pctbirths_h:;
run;

ods tagsets.excelxp options( sheet_name="Tenure");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography 
PctOwnerOccupiedHU&_years. 	PctRenterOccupiedHU&_years.;
run;

ods tagsets.excelxp options( sheet_name="SF Home Price");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography 
mprice:;
run;

ods tagsets.excelxp options( sheet_name="Housing Burden");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography 
			PctRenterCostBurden&_years.
			PctRentSevereCostBurden&_years.
			PctOwnerCostBurden&_years.
			PctOwnSevereCostBurden&_years.;
run;

ods tagsets.excelxp options( sheet_name="Labor");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography 
			PctLaborForce&_years.
			PctPopEmployed&_years.
			PctPopUnemployed&_years.;
run;

ods tagsets.excelxp options( sheet_name="Poverty");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography 
			PctPoorPersons&_years.
			PctPoorChildren&_years.;
run;

ods tagsets.excelxp options( sheet_name="Poverty");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography 
			PctPoorPersons&_years.
			PctPoorChildren&_years.;
run;

ods tagsets.excelxp options( sheet_name="Industry");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography 
			PctEmpMngmt&_years.
			PctEmpNatRes&_years.
			PctEmpProd&_years. 
			PctEmpSales&_years.
			PctEmpServ&_years.;
run;

ods tagsets.excelxp options( sheet_name="Snap/Tanf by Race");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography pctfs_b: pctfs_w: pctfs_a: pctfs_h: pcttanf_b: pcttanf_w: pcttanf_a: pcttanf_h:;
run;

ods tagsets.excelxp close;
ods listing;
run;

%File_info( data=compile_bpk_tabs2_&geosuf, contents=n, printobs=0 )

proc export data=mvt_tabs
	outfile="&_dcdata_default_path\MVT\Prog\mvt_tabs..csv"
	dbms=csv replace;
	run;*/



