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
%DCData_lib( MVT )


** Define time periods  **;
%let _years = 2012_16;
%let year_lbl = 2012-16;

/*I removed the macro here, so you may need to add some semi colons etc*/
data compile_bpk_tabs2_&geosuf;
	merge 
		ACS.acs_2011_15_dc_sum_tr_tr10
			(keep= &geo
				popincivlaborforce_&_years.
				pop16andoveryears_&_years. popcivilianemployed_&_years. popunemployed_&_years. 
				poppoorpersons_&_years. personspovertydefined_&_years. popwithrace_&_years. 
				PopEmployedTravel_&_years. PopEmployedTravel_LT5_&_years.
				PopEmployedTravel_5_9_&_years. PopEmployedTravel_10_14_&_years.
				PopEmployedTravel_15_19_&_years. PopEmployedTravel_20_24_&_years. 
				PopEmployedTravel_25_29_&_years. PopEmployedTravel_30_34_&_years. 
				PopEmployedTravel_35_39_&_years. PopEmployedTravel_40_44_&_years. 
				PopEmployedTravel_45_59_&_years. PopEmployedTravel_60_89_&_years. 
				PopEmployedTravel_GT90_&_years.
				IncmByOwnerCst_LT10K_&_years. IncmByOwnerCst_10_19K_&_years.
				IncmByOwnerCst_20_34K_&_years. IncmByOwnerCst_35_49K_&_years.
				IncmByOwnerCst_50_74K_&_years. IncmByOwnerCst_75_99K_&_years.
				IncmByOwnerCst_100_149_&_years. IncmByOwnerCst_GT150K_&_years.
				NumOwnCstBurden_LT10K_&_years. NumOwnCstBurden_10_19K_&_years. 
				NumOwnCstBurden_20_34K_&_years. NumOwnCstBurden_35_49K_&_years. 
				NumOwnCstBurden_50_74K_&_years. NumOwnCstBurden_75_99K_&_years. 
				NumOwnCstBurden_100_149_&_years. NumOwnCstBurden_GT150K_&_years.
				MedFamIncm_&_years. )


		Acs.Acs_2011_15_dc_sum_bg_&geosuf
			(keep= &geo 
				popwhitenonhispbridge_&_years. popblacknonhispbridge_&_years. pophisp_&_years. 
				popasianpinonhispbridge_&_years. popotherracenonhispbridg_&_years. 
				pop25andoveryears_&_years. pop25andoverwhs_&_years. Pop25andOverWoutHS_&_years. pop25andoverwcollege_&_years. 
				PopEmployedByInd_&_years. PopEmployedAgric_&_years. PopEmployedConstr_&_years. 
				PopEmployedManuf_&_years. PopEmployedWhlsale_&_years. PopEmployedRetail_&_years. 
				PopEmployedTransprt_&_years. PopEmployedInfo_&_years. PopEmployedFinance_&_years. 
				PopEmployedProfServ_&_years. PopEmployedEduction_&_years. PopEmployedArts_&_years. 
				PopEmployedOther_&_years. PopEmployedPubAdmin_&_years.
				PopEmployedByOcc_&_years. PopEmployedMngmt_&_years.
				PopEmployedServ_&_years. PopEmployedSales_&_years.
				PopEmployedNatRes_&_years. PopEmployedProd_&_years. 
				PopEmployedWorkers_&_years. PopEmployedWorkInState_&_years. PopEmployedWorkOutState_&_years.
				NumRenterOccupiedHU_&_years. NumOwnerOccupiedHU_&_years. NumOccupiedHsgUnits_&_years.
				GrossRentLT100_&_years. GrossRent100_149_&_years. GrossRent150_199_&_years.  
				GrossRent200_249_&_years. GrossRent250_299_&_years. 
				GrossRent300_349_&_years. GrossRent350_349_&_years. 
				GrossRent400_449_&_years. GrossRent450_499_&_years. 
				GrossRent500_549_&_years. GrossRent550_599_&_years. 
				GrossRent600_649_&_years. GrossRent650_699_&_years. 
				GrossRent700_749_&_years. GrossRent750_799_&_years. 
				GrossRent800_899_&_years. GrossRent900_999_&_years.
				GrossRent1000_1249_&_years. GrossRent1250_1499_&_years.
				GrossRent1500_1999_&_years. GrossRent2000_2499_&_years.
				GrossRent2500_2999_&_years. GrossRent3000_3499_&_years.
				GrossRentGT3500_&_years. GrossRentNoCash_&_years.
				IncmByRenterCst_LT10K_&_years. IncmByRenterCst_10_19K_&_years.
				IncmByRenterCst_20_34K_&_years. IncmByRenterCst_35_49K_&_years.
				IncmByRenterCst_50_74K_&_years. IncmByRenterCst_75_99K_&_years.
				IncmByRenterCst_GT100K_&_years.
				AgeByRenterCst_15_24_&_years. AgeByRenterCst_25_34_&_years.
				AgeByRenterCst_35_64_&_years. AgeByRenterCst_65Over_&_years.
				AgeByOwnerCst_15_24_&_years. AgeByOwnerCst_25_34_&_years.
				AgeByOwnerCst_35_64_&_years. AgeByOwnerCst_65Over_&_years.
				RentCostBurdenDenom_&_years. OwnerCostBurdenDenom_&_years. 
				NumRenterCostBurden_&_years. NumRentSevereCostBurden_&_years. 
				NumOwnerCostBurden_&_years. NumOwnSevereCostBurden_&_years.
				NumRentCstBurden_15_24_&_years. NumRentCstBurden_25_34_&_years. 
				NumRentCstBurden_35_64_&_years. NumRentCstBurden_65Over_&_years. 
				NumOwnCstBurden_15_24_&_years. NumOwnCstBurden_25_34_&_years. 
				NumOwnCstBurden_35_64_&_years. NumOwnCstBurden_65Over_&_years. 
				NumRentCstBurden_LT10K_&_years. NumRentCstBurden_10_19K_&_years. 
				NumRentCstBurden_20_34K_&_years. NumRentCstBurden_35_49K_&_years. 
				NumRentCstBurden_50_74K_&_years. NumRentCstBurden_75_99K_&_years. 
				NumRentCstBurden_GT100K_&_years. FamIncomeLT75k_&_years. FamIncomeGT200k_&_years.
					)

		RealProp.num_units_&geosuf 
			(keep= &geo units_sf_2000 units_sf_2001 units_sf_2002 
				units_sf_2003 units_sf_2004 units_sf_2005 units_sf_2006 units_sf_2007 
				units_sf_2008 units_sf_2009 units_sf_2010 units_sf_2011 units_sf_2012 
				units_sf_2013 units_sf_2014 units_sf_2015 units_sf_2016

				units_condo_2000 units_condo_2001 units_condo_2002
				units_condo_2003 units_condo_2004 units_condo_2005 units_condo_2006 units_condo_2007 
				units_condo_2008 units_condo_2009 units_condo_2010 units_condo_2011 units_condo_2012 
				units_condo_2013 units_condo_2014 units_condo_2015 units_condo_2016)
					
		RealProp.sales_sum_&geosuf 
			(keep= &geo sales_sf_2000 sales_sf_2001
				sales_sf_2002 sales_sf_2003 sales_sf_2004 sales_sf_2005 
				sales_sf_2006 sales_sf_2007 sales_sf_2008 sales_sf_2009 
				sales_sf_2010 sales_sf_2011 sales_sf_2012 sales_sf_2013
				sales_sf_2014 sales_sf_2015 sales_sf_2016 

				r_mprice_sf_2000 
				r_mprice_sf_2001 r_mprice_sf_2002 r_mprice_sf_2003 r_mprice_sf_2004
				r_mprice_sf_2005 r_mprice_sf_2006 r_mprice_sf_2007 r_mprice_sf_2008
				r_mprice_sf_2009 r_mprice_sf_2010 r_mprice_sf_2011 r_mprice_sf_2012
				r_mprice_sf_2013 r_mprice_sf_2014 r_mprice_sf_2015 r_mprice_sf_2016

				sales_condo_2000 sales_condo_2001
				sales_condo_2002 sales_condo_2003 sales_condo_2004 sales_condo_2005 
				sales_condo_2006 sales_condo_2007 sales_condo_2008 sales_condo_2009 
				sales_condo_2010 sales_condo_2011 sales_condo_2012 sales_condo_2013
				sales_condo_2014 sales_condo_2015 sales_condo_2016

				r_mprice_condo_2000
				r_mprice_condo_2001 r_mprice_condo_2002 r_mprice_condo_2003 r_mprice_condo_2004
				r_mprice_condo_2005 r_mprice_condo_2006 r_mprice_condo_2007 r_mprice_condo_2008
				r_mprice_condo_2009 r_mprice_condo_2010 r_mprice_condo_2011 r_mprice_condo_2012
				r_mprice_condo_2013 r_mprice_condo_2014 r_mprice_condo_2015 r_mprice_condo_2016)

		Police.Crimes_sum_&geosuf
			(keep=&geo 
				crimes_pt1_property_2000 crimes_pt1_property_2001 
				crimes_pt1_property_2002 crimes_pt1_property_2003 crimes_pt1_property_2004 
				crimes_pt1_property_2005 crimes_pt1_property_2006 crimes_pt1_property_2007 
				crimes_pt1_property_2008 crimes_pt1_property_2009 crimes_pt1_property_2010
				crimes_pt1_property_2011 crimes_pt1_property_2012 crimes_pt1_property_2013
				crimes_pt1_property_2014 crimes_pt1_property_2015 crimes_pt1_property_2016 
				crimes_pt1_violent_2000 crimes_pt1_violent_2001 
				crimes_pt1_violent_2002 crimes_pt1_violent_2003 crimes_pt1_violent_2004 
				crimes_pt1_violent_2005 crimes_pt1_violent_2006 crimes_pt1_violent_2007 
				crimes_pt1_violent_2008 crimes_pt1_violent_2009 crimes_pt1_violent_2010 
				crimes_pt1_violent_2011 crimes_pt1_violent_2012 crimes_pt1_violent_2013 
				crimes_pt1_violent_2014 crimes_pt1_violent_2015 crimes_pt1_violent_2016 
				crime_rate_pop_2000 crime_rate_pop_2001 crime_rate_pop_2002 crime_rate_pop_2003 
				crime_rate_pop_2004 crime_rate_pop_2005 crime_rate_pop_2006 crime_rate_pop_2007 
				crime_rate_pop_2008 crime_rate_pop_2009 crime_rate_pop_2010 crime_rate_pop_2011 
				crime_rate_pop_2012 crime_rate_pop_2013 crime_rate_pop_2014 crime_rate_pop_2015 
				crime_rate_pop_2016)
		
		NCDB.Ncdb_sum_&geosuf
			(keep= &geo totpop_1990 totpop_2000 
				numoccupiedhsgunits_1990 numoccupiedhsgunits_2000)

		NCDB.Ncdb_sum_2010_&geosuf
			(keep= &geo totpop_2010 numoccupiedhsgunits_2010); 

		by Geo2010 /*this is the tract indicator in ACS file, you may need rename variables in other data sets*/;
run;

%File_info( data=compile_bpk_tabs2_&geosuf, contents=n, printobs=0 )

proc export data=bpk_tabs2_&geosuf
	outfile="&_dcdata_default_path\BridgePk\Data\bpktabs2_&geosuf..csv"
	dbms=csv replace;
	run;
