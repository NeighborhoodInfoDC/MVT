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

** Define time periods  **;
%let _years = _2012_16;
%let year_lbl = 2012-16;


%macro Compile_mvt_data (geo, geosuf);
** Define time periods  1990, 2000, 2010, 2012-2016 across data**;
 
data compile_mvt_tabs_&geosuf;
	merge	ACS.acs_2012_16_dc_sum_tr_&geosuf
			(keep= &geo 

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
			NumOwnCstBurden_GT150K_2012_16)

		
		NCDB.Ncdb_sum_&geosuf
			(keep= &geo totpop_1990 totpop_2000 popwithrace_1990 popasianpinonhispbridge_1990 popblacknonhispbridge_1990 
			popothernonhispbridge_1990 popwhitenonhispbridge_1990 popnativeamnonhispbridge_1990 pophisp_1990
			popwithrace_2000 popasianpinonhispbridge_2000 popblacknonhispbridge_2000 popothernonhispbridge_2000
			popwhitenonhispbridge_2000 popnativeamnonhispbridge_2000 pophisp_2000 numhshlds_1990 numhshlds_2000
			numoccupiedhsgunits_1990 numoccupiedhsgunits_2000 totpop_1990 totpop_2000
			numoccupiedhsgunits_1990 numoccupiedhsgunits_2000 poppoorpersons_1990 poppoorpersons_2000 
			personspovertydefined_1990 personspovertydefined_2000 Pop16andOverYears_1990 PopInCivLaborForce_1990
			PopCivilianEmployed_1990 PopUnemployed_1990 Pop16andOverYears_2000 PopInCivLaborForce_2000
			PopCivilianEmployed_2000 PopUnemployed_2000)

		NCDB.Ncdb_sum_2010_&geosuf
			(keep= &geo totpop_2010 popwithrace_2010 popasianpinonhispbridge_2010 popblacknonhispbridge_2010 popothernonhispbridge_2010
			popwhitenonhispbridge_2010 popnativeamnonhispbridge_2010 pophisp_2010 numoccupiedhsgunits_2010 totpop_2010 numoccupiedhsgunits_2010) 


			/*Annual Data Points*/

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

				Police.crimes_sum_&geosuf
				(keep=&geo 
				crimes_pt1_property_2000 crimes_pt1_property_2001 
				crimes_pt1_property_2002 crimes_pt1_property_2003 crimes_pt1_property_2004 
				crimes_pt1_property_2005 crimes_pt1_property_2006 crimes_pt1_property_2007 
				crimes_pt1_property_2008 crimes_pt1_property_2009 crimes_pt1_property_2010
				crimes_pt1_property_2011 crimes_pt1_property_2012 crimes_pt1_property_2013
				crimes_pt1_property_2014 crimes_pt1_property_2015 crimes_pt1_property_2016 
				crimes_pt1_property_2017 
				crimes_pt1_violent_2000 crimes_pt1_violent_2001 
				crimes_pt1_violent_2002 crimes_pt1_violent_2003 crimes_pt1_violent_2004 
				crimes_pt1_violent_2005 crimes_pt1_violent_2006 crimes_pt1_violent_2007 
				crimes_pt1_violent_2008 crimes_pt1_violent_2009 crimes_pt1_violent_2010 
				crimes_pt1_violent_2011 crimes_pt1_violent_2012 crimes_pt1_violent_2013 
				crimes_pt1_violent_2014 crimes_pt1_violent_2015 crimes_pt1_violent_2016 
				crimes_pt1_violent_2017
				crime_rate_pop_2000 crime_rate_pop_2001 crime_rate_pop_2002 crime_rate_pop_2003 
				crime_rate_pop_2004 crime_rate_pop_2005 crime_rate_pop_2006 crime_rate_pop_2007 
				crime_rate_pop_2008 crime_rate_pop_2009 crime_rate_pop_2010 crime_rate_pop_2011 
				crime_rate_pop_2012 crime_rate_pop_2013 crime_rate_pop_2014 crime_rate_pop_2015 
				crime_rate_pop_2016 crime_rate_pop_2017)

				Vital.births_sum_&geosuf
				(keep=&geo births_total_2003 births_total_2004 births_total_2005 births_total_2006
				births_total_2007 births_total_2008 births_total_2009 births_total_2010 births_total_2011
				births_total_2012 births_total_2013 births_total_2014 births_total_2015 births_total_2016

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
				births_prenat_adeq_2015 births_prenat_adeq_2016)

				/*Tanf.tanf_sum_&geosuf
				(keep=&geo 	tanf_client_2003 tanf_client_2004 tanf_client_2005 tanf_client_2006
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
				tanf_oth_rac_2012 tanf_oth_rac_2013 tanf_oth_rac_2014 tanf_oth_rac_2015 tanf_oth_rac_2016)

				Tanf.fs_sum_&geosuf
				(keep=&geo 	fs_client_2003 fs_client_2004 fs_client_2005 fs_client_2006
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
				fs_oth_rac_2012 fs_oth_rac_2013 fs_oth_rac_2014 fs_oth_rac_2015 fs_oth_rac_2016)*/

			/*NEED: Housing Tenure, Poverty Rate x People receiving SNAP/TANF, Assisted Housing Units in DC Prescat */

			/*popincivlaborforce_&_years.
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
				units_sf_2013 units_sf_2014 units_sf_2015 units_sf_2016 units_sf_2017 units_sf_2018

				units_condo_2000 units_condo_2001 units_condo_2002
				units_condo_2003 units_condo_2004 units_condo_2005 units_condo_2006 units_condo_2007 
				units_condo_2008 units_condo_2009 units_condo_2010 units_condo_2011 units_condo_2012 
				units_condo_2013 units_condo_2014 units_condo_2015 units_condo_2016 units_condo_2017 units_condo_2018)
					

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
				crime_rate_pop_2016)*/;

		by &geo; /*this is the tract indicator in ACS file, you may need rename variables in other data sets*/
run;


/**Set geography variables for target tracts (47.01 and 47.02) and tracts adjacent;
47.01+47.02 and 47.01+47.02+106+46+48.02+49.02+58+59***/

%mend Compile_mvt_data;


%Compile_mvt_data (geo2010, tr10);
%Compile_mvt_data (ward2012, wd12);
%Compile_mvt_data (city, city);

proc freq data = compile_mvt_tabs_tr10;
tables geo2010;
format _all_;
run; 

data compile_mvt_tabs_tr10_select;
	set compile_mvt_tabs_tr10;
	if Geo2010 in("11001004701","11001004702") then target = 1;
	if Geo2010 in("11001004701","11001004702","11001010600","11001004600","11001004802","11001004902","11001005800","11001005900") then target_adj = 1;
	if Geo2010 not in("11001004701","11001004702","11001010600","11001004600","11001004802","11001004902","11001005800","11001005900") then delete;
	
run;

**Keep relevant wards**;

proc freq data = compile_mvt_tabs_wd12;
tables ward2012;
format _all_;
run; 

data compile_mvt_tabs_wd12_select;
	set compile_mvt_tabs_wd12;
	if Ward2012 in("1","2","3","4","5") then delete;
run;

**Summarize data by whether they are target or target adjacent tracts**;


proc means data=compile_mvt_tabs_wd12_select sum;
by target;
output out=compile_mvt_tabs_wd12_sum sum=;
run;

proc print data=compile_mvt_tabs_wd12_sum;
run; 


proc sort data = compile_mvt_tabs_tr10_select; by target; run;
proc summary data = compile_mvt_tabs_tr10_select; 
	by target;
output out = compile_mvt_tabs_tr10_select;
run;

proc summary data = compile_mvt_tabs_tr10, out = compile_mvt_tabs_tr10;
	by target_adj;
run;

**Transpose from wide to long data where observations are the indicators**;

proc transpose data=compile_bpk_tabs2_&geosuf out=bpk_tabs2_&geosuf(label="Bridge Park Tabulations, &geo");
	var 	&geo 	

		/*Population*
			totpop_1990 totpop_2000 totpop_2010
			numoccupiedhsgunits_1990 numoccupiedhsgunits_2000 numoccupiedhsgunits_2010 
		
		/*Race and ethnicity*
			popwithrace_&_years. 
			PctWht_&_years. 
			PctBlk_&_years. 
			PctHisp_&_years.
			PctAsn_&_years.
			PctOth_&_years. 
	
		/*Homeownership, rent, and cost burden*
			NumOwnerOccupiedHU_&_years.
			NumRenterOccupiedHU_&_years. 
			PctHomeownership_&_years. 

			GrossRentLT100_&_years. GrossRent100_149_&_years. 
			GrossRent800_899_&_years. GrossRent900_999_&_years.
			GrossRent1000_1249_&_years. GrossRent1250_1499_&_years.
			GrossRent1500_1999_&_years. GrossRent2000_2499_&_years.
			GrossRent2500_2999_&_years. GrossRent3000_3499_&_years.
			GrossRentGT3500_&_years. 

			NumRenterCostBurden_&_years. 
			NumRentSevereCostBurden_&_years. 
			PctRenterCostBurden_&_years. 
			PctRentSevereCostBurden_&_years.

			NumOwnerCostBurden_&_years. 
			NumOwnSevereCostBurden_&_years. 
			PctOwnerCostBurden_&_years. 
			PctOwnSevereCostBurden_&_years. 

			PctRentCstBurden_15_24_&_years. 
			PctRentCstBurden_25_34_&_years. 
			PctRentCstBurden_35_64_&_years. 
			PctRentCstBurden_65Over_&_years. 

			PctOwnCstBurden_15_24_&_years. 
			PctOwnCstBurden_25_34_&_years. 
			PctOwnCstBurden_35_64_&_years. 
			PctOwnCstBurden_65Over_&_years. 

			PctRentCstBurden_LT10K_&_years. 
			PctRentCstBurden_10_19K_&_years. 
			PctRentCstBurden_20_34K_&_years. 
			PctRentCstBurden_35_49K_&_years. 
			PctRentCstBurden_50_74K_&_years. 
			PctRentCstBurden_75_99K_&_years. 
			PctRentCstBurden_GT100K_&_years. 

			PctOwnCstBurden_LT10K_&_years. 
			PctOwnCstBurden_10_19K_&_years. 
			PctOwnCstBurden_20_34K_&_years. 
			PctOwnCstBurden_35_49K_&_years. 
			PctOwnCstBurden_50_74K_&_years. 
			PctOwnCstBurden_75_99K_&_years. 
			PctOwnCstBurden_100_149_&_years. 
			PctOwnCstBurden_GT150K_&_years. 

		/*Poverty*
			PctPoorPersons_&_years.
			poppoorpersons_&_years. 
			personspovertydefined_&_years. 
			MedFamIncm_&_years.
			FamIncomeLT75k_&_years.
			FamIncomeGT200k_&_years.

		/*Education*
			Pop25andoveryears_&_years.
			PctHS_&_years. 
			PctCol_&_years. 
			PctWoutHS_&_years.

		/*Labor force and employment*
			PctLaborForce_&_years.
			PctPopEmployed_&_years. 
			PctPopUnemployed_&_years. 
			popincivlaborforce_&_years.
			pop16andoveryears_&_years. 
			popcivilianemployed_&_years. 
			popunemployed_&_years. 
			
		/*Employment by major occupations*
			PopEmployedByOcc_&_years. 
			PopEmployedMngmt_&_years.
			PopEmployedServ_&_years. 
			PopEmployedSales_&_years.
			PopEmployedNatRes_&_years. 
			PopEmployedProd_&_years. 


		/*Employment by major industries*
			PopEmployedByInd_&_years. 
			PopEmployedAgric_&_years. 
			PopEmployedConstr_&_years. 
			PopEmployedManuf_&_years. 
			PopEmployedWhlsale_&_years. 
			PopEmployedRetail_&_years. 
			PopEmployedTransprt_&_years. 
			PopEmployedInfo_&_years. 
			PopEmployedFinance_&_years. 
			PopEmployedProfServ_&_years. 
			PopEmployedEduction_&_years. 
			PopEmployedArts_&_years. 
			PopEmployedOther_&_years. 
			PopEmployedPubAdmin_&_years.

		/*Employment by workplace location*
			PctEmployedWorkInState_&_years. 
			PctEmployedWorkOutState_&_years. 

		/*Employment by travel time to work*
			PctEmployedTravel_LT5_&_years. 
			PctEmployedTravel_5_9_&_years. 
			PctEmployedTravel_10_14_&_years. 
			PctEmployedTravel_15_19_&_years. 
			PctEmployedTravel_20_24_&_years. 
			PctEmployedTravel_25_29_&_years. 
			PctEmployedTravel_30_34_&_years. 
			PctEmployedTravel_35_39_&_years. 
			PctEmployedTravel_40_44_&_years. 
			PctEmployedTravel_45_59_&_years. 
			PctEmployedTravel_60_89_&_years. 
			PctEmployedTravel_GT90_&_years. 
			
		/*Residential property: total units, total sales, and median sales price: 2000 - 2016*
			units_sf_2000 units_sf_2001 units_sf_2002 
			units_sf_2003 units_sf_2004 units_sf_2005 units_sf_2006 units_sf_2007 
			units_sf_2008 units_sf_2009 units_sf_2010 units_sf_2011 units_sf_2012 
			units_sf_2013 units_sf_2014 units_sf_2015 units_sf_2016

			units_condo_2000 units_condo_2001 units_condo_2002
			units_condo_2003 units_condo_2004 units_condo_2005 units_condo_2006 units_condo_2007 
			units_condo_2008 units_condo_2009 units_condo_2010 units_condo_2011 units_condo_2012 
			units_condo_2013 units_condo_2014 units_condo_2015 units_condo_2016
				
			sales_sf_2000 sales_sf_2001
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
			r_mprice_condo_2013 r_mprice_condo_2014 r_mprice_condo_2015 r_mprice_condo_2016


		/*Violent and property crime rates: 2000 - 2016*
			property_crime_rate_2000
			property_crime_rate_2001 property_crime_rate_2002 
			property_crime_rate_2003 property_crime_rate_2004
			property_crime_rate_2005 property_crime_rate_2006
			property_crime_rate_2007 property_crime_rate_2008
			property_crime_rate_2009 property_crime_rate_2010
			property_crime_rate_2011 property_crime_rate_2012 
			property_crime_rate_2013 property_crime_rate_2014
			property_crime_rate_2015 property_crime_rate_2016 
			
			violent_crime_rate_2000
			violent_crime_rate_2001 violent_crime_rate_2002 
			violent_crime_rate_2003 violent_crime_rate_2004
			violent_crime_rate_2005 violent_crime_rate_2006
			violent_crime_rate_2007 violent_crime_rate_2008
			violent_crime_rate_2009 violent_crime_rate_2010
			violent_crime_rate_2011 violent_crime_rate_2012 
			violent_crime_rate_2013 violent_crime_rate_2014
			violent_crime_rate_2015 violent_crime_rate_2016 
	
		/*More variables - added to the bottom to preserve linked formulas in csv*

			GrossRent150_199_&_years.  
			GrossRent200_249_&_years. GrossRent250_299_&_years. 
			GrossRent300_349_&_years. GrossRent350_349_&_years. 
			GrossRent400_449_&_years. GrossRent450_499_&_years. 
			GrossRent500_549_&_years. GrossRent550_599_&_years. 
			GrossRent600_649_&_years. GrossRent650_699_&_years. 
			GrossRent700_749_&_years. GrossRent750_799_&_years. 
			GrossRentNoCash_&_years.
		;

id &geo; 
run; 

%File_info( data=compile_bpk_tabs2_&geosuf, contents=n, printobs=0 )

proc export data=bpk_tabs2_&geosuf
	outfile="&_dcdata_default_path\BridgePk\Data\bpktabs2_&geosuf..csv"
	dbms=csv replace;
	run;*/



