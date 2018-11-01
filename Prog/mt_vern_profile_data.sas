/**************************************************************************
 Program:  mt_vern_profile_data.sas
 Library:  MVT
 Project:  Urban-Greater DC
 Author:   O. Arena, M. Cohen
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
%DCData_lib( Planning )

** Define time periods and variables **;
%let _years = _2012_16;
%let year_lbl = 2012-16;

%let acs_vars = 
			TotPop_2012_16
			NumHshlds_2012_16
			Mtotpop_2012_16

			PopWithRace_2012_16
			PopBlackNonHispBridge_2012_16
			PopWhiteNonHispBridge_2012_16
			PopHisp_2012_16
			PopAsianPINonHispBridge_2012_16
			PopOtherNonHispBridge_2012_16
			PopNativeAmnonhispbridge_2012_16
			PopMultiRacialnonhisp_2012_16
			PopForeignBorn_2012_16

			popaloneaiom_2012_16 
			popalonea_2012_16 
			popalonew_2012_16 
			popaloneb_2012_16 
			popaloneh_2012_16 
			popaloneiom_2012_16 

			popunder18years_2012_16
			popunder18yearsaiom_2012_16
			popunder18yearsa_2012_16
			popunder18yearsb_2012_16
			popunder18yearsw_2012_16
			popunder18yearsh_2012_16
			popunder18yearsiom_2012_16

			pop18_34years_2012_16
			pop18_34yearsaiom_2012_16
			pop18_34yearsa_2012_16
			pop18_34yearsb_2012_16
			pop18_34yearsw_2012_16
			pop18_34yearsh_2012_16
			pop18_34yearsiom_2012_16

			pop35_64years_2012_16
			pop35_64yearsaiom_2012_16
			pop35_64yearsa_2012_16
			pop35_64yearsb_2012_16
			pop35_64yearsw_2012_16
			pop35_64yearsh_2012_16
			pop35_64yearsiom_2012_16

			pop65andoveryears_2012_16
			pop65andoveryearsaiom_2012_16
			pop65andoveryearsa_2012_16
			pop65andoveryearsb_2012_16
			pop65andoveryearsw_2012_16
			pop65andoveryearsh_2012_16
			pop65andoveryearsiom_2012_16

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

			popworkftlt75kaiom_2012_16 /*all remaining groups*/
			popworkftlt35ka_2012_16
			popworkftlt35kb_2012_16 
			popworkftlt35kh_2012_16
			popworkftlt35kiom_2012_16  /*Indigenous, other, multiracial*/
			popworkftlt35kw_2012_16
			popworkftlt35k_2012_16 

			popworkftlt75kaiom_2012_16
			popworkftlt75ka_2012_16 
			popworkftlt75kb_2012_16 
			popworkftlt75kh_2012_16
			popworkftlt75kiom_2012_16 
			popworkftlt75kw_2012_16 
			popworkftlt75k_2012_16


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
			NumOwnCstBurden_GT150K_2012_16


			numhshlds_2012_16
			hshldinc100000plus_2012_16
			hshldinc100000to124999_2012_16
			hshldinc10000to14999_2012_16
			hshldinc125000to149999_2012_16
			hshldinc150000to199999_2012_16
			hshldinc15000to19999_2012_16
			hshldinc15000to34999_2012_16
			hshldinc200000andover_2012_16
			hshldinc200000plus_2012_16
			hshldinc20000to24999_2012_16
			hshldinc25000to29999_2012_16
			hshldinc30000to34999_2012_16
			hshldinc35000to39999_2012_16
			hshldinc35000to49999_2012_16
			hshldinc40000to44999_2012_16
			hshldinc45000to49999_2012_16
			hshldinc50000to59999_2012_16
			hshldinc50000to74999_2012_16
			hshldinc60000to74999_2012_16
			hshldinc75000to99999_2012_16
			hshldincunder10000_2012_16
			hshldincunder15000_2012_16



;

	%let ncdbold_vars = totpop_1980 totpop_1990 popwithrace_1980 popblacknonhispbridge_1980 
			 popwhitenonhispbridge_1980 pophisp_1980
			popwithrace_1990 popasianpinonhispbridge_1990 popblacknonhispbridge_1990 
			popothernonhispbridge_1990 popwhitenonhispbridge_1990 popnativeamnonhispbridge_1990 pophisp_1990
			totpop_2000 popwithrace_2000 popasianpinonhispbridge_2000 popblacknonhispbridge_2000 popothernonhispbridge_2000
			popwhitenonhispbridge_2000 popnativeamnonhispbridge_2000 pophisp_2000 popmultiracialnonhisp_2000
			numhshlds_1990 numhshlds_2000 numoccupiedhsgunits_1990 numoccupiedhsgunits_2000 numoccupiedhsgunits_1990 numoccupiedhsgunits_2000 poppoorpersons_1990 poppoorpersons_2000 
			personspovertydefined_1990 personspovertydefined_2000 Pop16andOverYears_1990 PopInCivLaborForce_1990
			PopCivilianEmployed_1990 PopUnemployed_1990 Pop16andOverYears_2000 PopInCivLaborForce_2000
			PopCivilianEmployed_2000 PopUnemployed_2000
			popunder18years_1980 popunder18years_1990 popunder18years_2000 pop18to64years_1980 pop18to64years_1990 pop18to64years_2000 pop65andoveryears_1980 pop65andoveryears_1990 pop65andoveryears_2000
			
;

	%let ncdb_vars = totpop_2010 popwithrace_2010 popasianpinonhispbridge_2010 popblacknonhispbridge_2010 popothernonhispbridge_2010 popmultiracialnonhisp_2010
			popwhitenonhispbridge_2010 popnativeamnonhispbridge_2010 pophisp_2010 numoccupiedhsgunits_2010 totpop_2010 numoccupiedhsgunits_2010;

			%let ncdb_1980a = SHRNHJ8N  shrnhj9n shrnhj0n shrnhj1n SHR8D SHR9D SHR0D SHR1D;
	

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

				births_w_prenat_wht_2003 births_w_prenat_wht_2004 births_w_prenat_wht_2005 births_w_prenat_wht_2006
				births_w_prenat_wht_2007 births_w_prenat_wht_2008 births_w_prenat_wht_2009 births_w_prenat_wht_2010 births_w_prenat_wht_2011
				births_w_prenat_wht_2012 births_w_prenat_wht_2013 births_w_prenat_wht_2014 births_w_prenat_wht_2015 births_w_prenat_wht_2016 

				births_w_prenat_blk_2003 births_w_prenat_blk_2004 births_w_prenat_blk_2005 births_w_prenat_blk_2006
				births_w_prenat_blk_2007 births_w_prenat_blk_2008 births_w_prenat_blk_2009 births_w_prenat_blk_2010 births_w_prenat_blk_2011
				births_w_prenat_blk_2012 births_w_prenat_blk_2013 births_w_prenat_blk_2014 births_w_prenat_blk_2015 births_w_prenat_blk_2016 

				births_w_prenat_hsp_2003 births_w_prenat_hsp_2004 births_w_prenat_hsp_2005 births_w_prenat_hsp_2006
				births_w_prenat_hsp_2007 births_w_prenat_hsp_2008 births_w_prenat_hsp_2009 births_w_prenat_hsp_2010 births_w_prenat_hsp_2011
				births_w_prenat_hsp_2012 births_w_prenat_hsp_2013 births_w_prenat_hsp_2014 births_w_prenat_hsp_2015 births_w_prenat_hsp_2016 

				births_w_prenat_asn_2003 births_w_prenat_asn_2004 births_w_prenat_asn_2005 births_w_prenat_asn_2006
				births_w_prenat_asn_2007 births_w_prenat_asn_2008 births_w_prenat_asn_2009 births_w_prenat_asn_2010 births_w_prenat_asn_2011
				births_w_prenat_asn_2012 births_w_prenat_asn_2013 births_w_prenat_asn_2014 births_w_prenat_asn_2015 births_w_prenat_asn_2016 

				births_w_prenat_oth_2003 births_w_prenat_oth_2004 births_w_prenat_oth_2005 births_w_prenat_oth_2006
				births_w_prenat_oth_2007 births_w_prenat_oth_2008 births_w_prenat_oth_2009 births_w_prenat_oth_2010 births_w_prenat_oth_2011
				births_w_prenat_oth_2012 births_w_prenat_oth_2013 births_w_prenat_oth_2014 births_w_prenat_oth_2015 births_w_prenat_oth_2016 

				births_w_prenat_2003 births_w_prenat_2004 births_w_prenat_2005 births_w_prenat_2006 
				births_w_prenat_2007 births_w_prenat_2008 births_w_prenat_2009 births_w_prenat_2010
				births_w_prenat_2011 births_w_prenat_2012 births_w_prenat_2013 births_w_prenat_2014
				births_w_prenat_2015 births_w_prenat_2016

				births_prenat_inad_2003 births_prenat_inad_2004 births_prenat_inad_2005 births_prenat_inad_2006 
				births_prenat_inad_2007 births_prenat_inad_2008 births_prenat_inad_2009 births_prenat_inad_2010
				births_prenat_inad_2011 births_prenat_inad_2012 births_prenat_inad_2013 births_prenat_inad_2014
				births_prenat_inad_2015 births_prenat_inad_2016

				births_prenat_inad_wht_2003 births_prenat_inad_wht_2004 births_prenat_inad_wht_2005 births_prenat_inad_wht_2006
				births_prenat_inad_wht_2007 births_prenat_inad_wht_2008 births_prenat_inad_wht_2009 births_prenat_inad_wht_2010 births_prenat_inad_wht_2011
				births_prenat_inad_wht_2012 births_prenat_inad_wht_2013 births_prenat_inad_wht_2014 births_prenat_inad_wht_2015 births_prenat_inad_wht_2016 

				births_prenat_inad_blk_2003 births_prenat_inad_blk_2004 births_prenat_inad_blk_2005 births_prenat_inad_blk_2006
				births_prenat_inad_blk_2007 births_prenat_inad_blk_2008 births_prenat_inad_blk_2009 births_prenat_inad_blk_2010 births_prenat_inad_blk_2011
				births_prenat_inad_blk_2012 births_prenat_inad_blk_2013 births_prenat_inad_blk_2014 births_prenat_inad_blk_2015 births_prenat_inad_blk_2016 

				births_prenat_inad_hsp_2003 births_prenat_inad_hsp_2004 births_prenat_inad_hsp_2005 births_prenat_inad_hsp_2006
				births_prenat_inad_hsp_2007 births_prenat_inad_hsp_2008 births_prenat_inad_hsp_2009 births_prenat_inad_hsp_2010 births_prenat_inad_hsp_2011
				births_prenat_inad_hsp_2012 births_prenat_inad_hsp_2013 births_prenat_inad_hsp_2014 births_prenat_inad_hsp_2015 births_prenat_inad_hsp_2016 

				births_prenat_inad_asn_2003 births_prenat_inad_asn_2004 births_prenat_inad_asn_2005 births_prenat_inad_asn_2006
				births_prenat_inad_asn_2007 births_prenat_inad_asn_2008 births_prenat_inad_asn_2009 births_prenat_inad_asn_2010 births_prenat_inad_asn_2011
				births_prenat_inad_asn_2012 births_prenat_inad_asn_2013 births_prenat_inad_asn_2014 births_prenat_inad_asn_2015 births_prenat_inad_asn_2016 

				births_prenat_inad_oth_2003 births_prenat_inad_oth_2004 births_prenat_inad_oth_2005 births_prenat_inad_oth_2006
				births_prenat_inad_oth_2007 births_prenat_inad_oth_2008 births_prenat_inad_oth_2009 births_prenat_inad_oth_2010 births_prenat_inad_oth_2011
				births_prenat_inad_oth_2012 births_prenat_inad_oth_2013 births_prenat_inad_oth_2014 births_prenat_inad_oth_2015 births_prenat_inad_oth_2016 

				births_w_weight_2003 births_w_weight_2004 births_w_weight_2005 births_w_weight_2006	
				births_w_weight_2007 births_w_weight_2008 births_w_weight_2009 births_w_weight_2010 births_w_weight_2011 
				births_w_weight_2012 births_w_weight_2013 births_w_weight_2014 births_w_weight_2015 births_w_weight_2016

				births_low_wt_2003 births_low_wt_2004 births_low_wt_2005 births_low_wt_2006	
				births_low_wt_2007 births_low_wt_2008 births_low_wt_2009 births_low_wt_2010	births_low_wt_2011 
				births_low_wt_2012 births_low_wt_2013 births_low_wt_2014 births_low_wt_2015 births_low_wt_2016 

				births_low_wt_asn_2003 births_low_wt_asn_2004 births_low_wt_asn_2005 births_low_wt_asn_2006
				births_low_wt_asn_2007 births_low_wt_asn_2008 births_low_wt_asn_2009 births_low_wt_asn_2010	births_low_wt_asn_2011 
				births_low_wt_asn_2012 births_low_wt_asn_2013 births_low_wt_asn_2014 births_low_wt_asn_2015 births_low_wt_asn_2016

				births_low_wt_blk_2003 births_low_wt_blk_2004 births_low_wt_blk_2005 births_low_wt_blk_2006
				births_low_wt_blk_2007 births_low_wt_blk_2008 births_low_wt_blk_2009 births_low_wt_blk_2010 births_low_wt_blk_2011
				births_low_wt_blk_2012 births_low_wt_blk_2013 births_low_wt_blk_2014 births_low_wt_blk_2015	births_low_wt_blk_2016

				births_low_wt_hsp_2003 births_low_wt_hsp_2004 births_low_wt_hsp_2005 births_low_wt_hsp_2006
				births_low_wt_hsp_2007 births_low_wt_hsp_2008 births_low_wt_hsp_2009 births_low_wt_hsp_2010 births_low_wt_hsp_2011
				births_low_wt_hsp_2012 births_low_wt_hsp_2013 births_low_wt_hsp_2014 births_low_wt_hsp_2015	births_low_wt_hsp_2016

				births_low_wt_oth_2003 births_low_wt_oth_2004 births_low_wt_oth_2005 births_low_wt_oth_2006
				births_low_wt_oth_2007 births_low_wt_oth_2008 births_low_wt_oth_2009 births_low_wt_oth_2010 births_low_wt_oth_2011
				births_low_wt_oth_2012 births_low_wt_oth_2013 births_low_wt_oth_2014 births_low_wt_oth_2015 births_low_wt_oth_2016

				births_low_wt_wht_2003 births_low_wt_wht_2004 births_low_wt_wht_2005 births_low_wt_wht_2006
				births_low_wt_wht_2007 births_low_wt_wht_2008 births_low_wt_wht_2009 births_low_wt_wht_2010	births_low_wt_wht_2011
				births_low_wt_wht_2012 births_low_wt_wht_2013 births_low_wt_wht_2014 births_low_wt_wht_2015	births_low_wt_wht_2016

				births_w_weight_asn_2003 births_w_weight_asn_2004 births_w_weight_asn_2005 births_w_weight_asn_2006
				births_w_weight_asn_2007 births_w_weight_asn_2008 births_w_weight_asn_2009 births_w_weight_asn_2010	births_w_weight_asn_2011 
				births_w_weight_asn_2012 births_w_weight_asn_2013 births_w_weight_asn_2014 births_w_weight_asn_2015	births_w_weight_asn_2016

				births_w_weight_blk_2003 births_w_weight_blk_2004 births_w_weight_blk_2005 births_w_weight_blk_2006
				births_w_weight_blk_2007 births_w_weight_blk_2008 births_w_weight_blk_2009 births_w_weight_blk_2010 births_w_weight_blk_2011
				births_w_weight_blk_2012 births_w_weight_blk_2013 births_w_weight_blk_2014 births_w_weight_blk_2015 births_w_weight_blk_2016

				births_w_weight_hsp_2003 births_w_weight_hsp_2004 births_w_weight_hsp_2005 births_w_weight_hsp_2006
				births_w_weight_hsp_2007 births_w_weight_hsp_2008 births_w_weight_hsp_2009 births_w_weight_hsp_2010	births_w_weight_hsp_2011
				births_w_weight_hsp_2012 births_w_weight_hsp_2013 births_w_weight_hsp_2014 births_w_weight_hsp_2015	births_w_weight_hsp_2016

				births_w_weight_oth_2003 births_w_weight_oth_2004 births_w_weight_oth_2005 births_w_weight_oth_2006
				births_w_weight_oth_2007 births_w_weight_oth_2008 births_w_weight_oth_2009 births_w_weight_oth_2010	births_w_weight_oth_2011
				births_w_weight_oth_2012 births_w_weight_oth_2013 births_w_weight_oth_2014 births_w_weight_oth_2015 births_w_weight_oth_2016

				births_w_weight_wht_2003 births_w_weight_wht_2004 births_w_weight_wht_2005 births_w_weight_wht_2006
				births_w_weight_wht_2007 births_w_weight_wht_2008 births_w_weight_wht_2009 births_w_weight_wht_2010 births_w_weight_wht_2011
				births_w_weight_wht_2012 births_w_weight_wht_2013 births_w_weight_wht_2014 births_w_weight_wht_2015 births_w_weight_wht_2016

;


		
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
				mprice2013 mprice2014 mprice2015 mprice2016 mprice2017 mprice2018 mprice2003 mCondoprice2004 mCondoprice2005 mCondoprice2006 mCondoprice2007 
				mCondoprice2008 mCondoprice2009 mCondoprice2010 mCondoprice2011 mCondoprice2012 
				mCondoprice2013 mCondoprice2014 mCondoprice2015 mCondoprice2016 mCondoprice2017 mCondoprice2018;

		%let subs_vars = Proj_Units_Assist_Min_Sum Proj_Units_Assist_Max_Sum;

		%let plan_vars=tpop2010 tpop2015 tpop2020 tpop2025 tpop2030 tpop2035 tpop2040 tpop2045;


data project;
set prescat.project;
length city $1;
format city $CITY16.;
city = "1";
run;

/*compile 1980 asian data*/ 
	data get1980race;
		set ncdb.Ncdb_master_update (where=(ucounty='11001'));
		keep geo2010  &ncdb_1980a;
	 
		shrnhj1n=(shrnhi1n +shrnha1n + shrnho1n);

		label shrnhj1n="Total NH Amer Indian, Asian, Pacific Islander, or Other race, 2010"
			  shrnhj0n="Total NH Amer Indian, Asian, Pacific Islander, or Other race, 2000"
			   shrnhj9n="Total NH Amer Indian, Asian, Pacific Islander, or Other race, 1990"
			    shrnhj8n="Total NH Amer Indian, Asian, Pacific Islander, or Other race, 1980"
		;
		
	run;
	%tr10_to_stdgeos(in_ds=get1980race, out_ds=get1980race2)

	proc sort data=get1980race2;
	by ward2012;
	proc summary data=get1980race2;
	by ward2012;
	var  &ncdb_1980a;
	output out=get1980race_wd12 sum=;
	run;
	proc sort data=get1980race2;
	by city;
	proc summary data=get1980race2;
	by city;
	var   &ncdb_1980a;
	output out=get1980race_city sum=;
	run;


/*compile other data*/ 
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

		project_&geosuf (keep = &geo &subs_vars)

		planning.Pop_forecast_r9_dc_&geosuf (keep= &geo &plan_vars);

		by &geo;
				
run;


**Add Median Sales Price seperately as target area will need to be aggregated later**;

data sales_res;
	set realpr_r.sales_res_clean;
	saleyear=year(saledate);
	
			%dollar_convert( saleprice, sale_adj, saleyear, 2017, series=CUUR0000SA0L2 )

			total=1;
			condo=0;
			sf=0;
			if ui_proptype="11" then do; sale_condo_adj=sale_adj; condo=1; end;
			if ui_proptype="10" then do; sale_sf_adj=sale_adj;sf=1; end;

run;

proc sort data=sales_res;
	by &geo;
run;

proc tabulate data = sales_res out = price_tab_&geosuf;
class &geo saleyear;
var sale_adj sale_sf_adj sale_condo_adj;
table &geo, saleyear *(median) *(sale_adj sale_sf_adj sale_condo_adj);
run;

proc transpose data=price_tab_&geosuf out=price_&geosuf prefix=mprice;
    by &geo ;
    id saleyear;
    var sale_adj_median ;
run;

proc transpose data=price_tab_&geosuf out=priceCondo_&geosuf prefix=mCondoprice;
    by &geo ;
    id saleyear;
    var sale_condo_adj_median;
run;



%if &geo = ward2012 %then %do;	
data compile_mvt_tabs_wd12_full;
	merge compile_mvt_tabs_wd12 price_wd12 (drop= _name_) Pricecondo_wd12  (drop=_name_);
	by &geo;
run; %end;
%else %if &geo = city %then %do;
data compile_mvt_tabs_city_full;
	merge compile_mvt_tabs_city price_city (drop= _name_)  priceCondo_city (drop= _name_);
	by &geo;
run; %end;
%mend Compile_mvt_data;


%Compile_mvt_data (geo2010, tr10);
%Compile_mvt_data (ward2012, wd12);
%Compile_mvt_data (city, city);

**Select out target areas**;
 *merge in 1980 data;
  proc sort data=compile_mvt_tabs_tr10;
  by geo2010;
  proc sort data=get1980race2;
  by geo2010;
  data compile_mvt_tabs_tr10_select (where=(target~=.));
  	merge compile_mvt_tabs_tr10 get1980race2;
	by geo2010;

	if Geo2010 in("11001004701","11001004702") then target = 1;
	if Geo2010 in("11001010600","11001004600","11001004802","11001004902","11001005800","11001005900") then target = 2;
	run;
	proc sort data=Get1980race_wd12;
	by ward2012;
	proc sort data=compile_mvt_tabs_wd12_full;
	by ward2012;

 data compile_mvt_tabs_wd12_select;
	merge compile_mvt_tabs_wd12_full Get1980race_wd12;
	by Ward2012;
	if Ward2012 in("3","4","1","7","8") then delete;
	length geography $20.;
	geography = Ward2012;
run;

data compile_mvt_tabs_city_select;
	merge compile_mvt_tabs_city_full Get1980race_city;
	length geography $20.;
	geography = "Washington DC";
run;

**Summarize data by whether they are target or target adjacent tracts**;

proc sort data = compile_mvt_tabs_tr10_select; by target; run;

proc summary data = compile_mvt_tabs_tr10_select; 
	where target = 1;
	var &acs_vars &ncdbold_vars &ncdb_vars &ncdb_1980a &sales_vars &crime_vars &birth_vars &tanf_vars &fs_vars &unit_vars &subs_vars &plan_vars;
	output out = compile_mvt_tabs_target sum=; 
run;

data compile_mvt_tabs_target_select;
	set compile_mvt_tabs_target;
	length geography $20.;
	geography = "Census Tract 47";
	target = 1;
run;

proc summary data = compile_mvt_tabs_tr10_select ; output out = compile_mvt_tabs_target_adj sum=;
	var &acs_vars &ncdbold_vars &ncdb_vars &ncdb_1980a &sales_vars &crime_vars &birth_vars &tanf_vars &fs_vars &unit_vars &subs_vars &plan_vars;
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

			total=1;
			condo=0;
			sf=0;
			if ui_proptype="11" then do; sale_condo_adj=sale_adj; condo=1; end;
			if ui_proptype="10" then do; sale_sf_adj=sale_adj;sf=1; end;
run;

proc sort data=sales_res_target;
	by target;
run;

proc tabulate data = sales_res_target out = price_tab_target;
class target saleyear;
var sale_adj sale_sf_adj sale_condo_adj ;
table target, saleyear *(median) * (sale_adj sale_sf_adj sale_condo_adj);
run;

proc transpose data=price_tab_target out=price_target prefix=mprice;
    by target ;
    id saleyear;
    var sale_adj_median ;
run;
proc transpose data=price_tab_target out=priceCondo_target prefix=mCondoprice;
    by target ;
    id saleyear;
    var sale_condo_adj_median ;
run;
data compile_mvt_tabs_tracts;
	set compile_mvt_tabs_target_select compile_mvt_tabs_adj_select;
run;

data compile_mvt_tabs_tracts_select;
	merge compile_mvt_tabs_tracts price_target (drop=_name_) priceCondo_target (drop=_name_);
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
			PctMult&_years. = PopMultiRacialnonhisp&_years. / popwithrace&_years.;
			PctNat&_years. = PopNativeAmnonhispbridge&_years. / popwithrace&_years.;
			PctOth&_years. = popothernonhispbridge&_years. / popwithrace&_years.;


		/*Education*/
			PctHS&_years. = (pop25andoverwhs&_years.-pop25andoverwcollege&_years.) / pop25andoveryears&_years.;
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
			property_crime_rate_2000 = (crimes_pt1_property_2000 / crime_rate_pop_2000)*1000;
			property_crime_rate_2001 = (crimes_pt1_property_2001 / crime_rate_pop_2001)*1000;
			property_crime_rate_2002 = (crimes_pt1_property_2002 / crime_rate_pop_2002)*1000;
			property_crime_rate_2003 = (crimes_pt1_property_2003 / crime_rate_pop_2003)*1000;
			property_crime_rate_2004 = (crimes_pt1_property_2004 / crime_rate_pop_2004)*1000;
			property_crime_rate_2005 = (crimes_pt1_property_2005 / crime_rate_pop_2005)*1000;
			property_crime_rate_2006 = (crimes_pt1_property_2006 / crime_rate_pop_2006)*1000;
			property_crime_rate_2007 = (crimes_pt1_property_2007 / crime_rate_pop_2007)*1000;
			property_crime_rate_2008 = (crimes_pt1_property_2008 / crime_rate_pop_2008)*1000;
			property_crime_rate_2009 = (crimes_pt1_property_2009 / crime_rate_pop_2009)*1000;
			property_crime_rate_2010 = (crimes_pt1_property_2010 / crime_rate_pop_2010)*1000;
			property_crime_rate_2011 = (crimes_pt1_property_2011 / crime_rate_pop_2011)*1000;
			property_crime_rate_2012 = (crimes_pt1_property_2012 / crime_rate_pop_2012)*1000;
			property_crime_rate_2013 = (crimes_pt1_property_2013 / crime_rate_pop_2013)*1000;
			property_crime_rate_2014 = (crimes_pt1_property_2014 / crime_rate_pop_2014)*1000;
			property_crime_rate_2015 = (crimes_pt1_property_2015 / crime_rate_pop_2015)*1000;
			property_crime_rate_2016 = (crimes_pt1_property_2016 / crime_rate_pop_2016)*1000;
			property_crime_rate_2017 = (crimes_pt1_property_2017 / crime_rate_pop_2017)*1000;


		/*Violent crime rates*/
			violent_crime_rate_2000 = (crimes_pt1_violent_2000 / crime_rate_pop_2000)*1000;
			violent_crime_rate_2001 = (crimes_pt1_violent_2001 / crime_rate_pop_2001)*1000;
			violent_crime_rate_2002 = (crimes_pt1_violent_2002 / crime_rate_pop_2002)*1000;
			violent_crime_rate_2003 = (crimes_pt1_violent_2003 / crime_rate_pop_2003)*1000;
			violent_crime_rate_2004 = (crimes_pt1_violent_2004 / crime_rate_pop_2004)*1000;
			violent_crime_rate_2005 = (crimes_pt1_violent_2005 / crime_rate_pop_2005)*1000;
			violent_crime_rate_2006 = (crimes_pt1_violent_2006 / crime_rate_pop_2006)*1000;
			violent_crime_rate_2007 = (crimes_pt1_violent_2007 / crime_rate_pop_2007)*1000;
			violent_crime_rate_2008 = (crimes_pt1_violent_2008 / crime_rate_pop_2008)*1000;
			violent_crime_rate_2009 = (crimes_pt1_violent_2009 / crime_rate_pop_2009)*1000;
			violent_crime_rate_2010 = (crimes_pt1_violent_2010 / crime_rate_pop_2010)*1000;
			violent_crime_rate_2011 = (crimes_pt1_violent_2011 / crime_rate_pop_2011)*1000;
			violent_crime_rate_2012 = (crimes_pt1_violent_2012 / crime_rate_pop_2012)*1000;
			violent_crime_rate_2013 = (crimes_pt1_violent_2013 / crime_rate_pop_2013)*1000;
			violent_crime_rate_2014 = (crimes_pt1_violent_2014 / crime_rate_pop_2014)*1000;
			violent_crime_rate_2015 = (crimes_pt1_violent_2015 / crime_rate_pop_2015)*1000;
			violent_crime_rate_2016 = (crimes_pt1_violent_2016 / crime_rate_pop_2016)*1000;
			violent_crime_rate_2017 = (crimes_pt1_violent_2017 / crime_rate_pop_2017)*1000;


		/*Births by race*/
		%macro birthsbyrace;
		/*making these three year rolling averages**/

			%let race_st=asi blk hsp wht oth;
			%let race=asian black hisp white oth;
			%let race_label=Asian Black Hispanic White Other;
			
			%do i=1 %to 5;
				%let rc_st=%scan(&race_st.,&i.," "); 
				%let rc=%scan(&race.,&i," "); 
				%let rc_lbl=%scan(&race_label.,&i.," ");

				pctbirths_&rc_st._2003_05=(births_&rc._2003 + births_&rc._2004 + births_&rc._2005 ) / (births_w_race_2003 + births_w_race_2004 + births_w_race_2005);
				pctbirths_&rc_st._2004_06=(births_&rc._2004 + births_&rc._2005 + births_&rc._2006 ) / (births_w_race_2004 + births_w_race_2005 + births_w_race_2006);
				pctbirths_&rc_st._2005_07=(births_&rc._2005 + births_&rc._2006 + births_&rc._2007 ) / (births_w_race_2005 + births_w_race_2006 + births_w_race_2007);
				pctbirths_&rc_st._2006_08=(births_&rc._2006 + births_&rc._2007 + births_&rc._2008 ) / (births_w_race_2006 + births_w_race_2007 + births_w_race_2008);
				pctbirths_&rc_st._2007_09=(births_&rc._2007 + births_&rc._2008 + births_&rc._2009 ) / (births_w_race_2007 + births_w_race_2008 + births_w_race_2009);
				pctbirths_&rc_st._2008_10=(births_&rc._2008 + births_&rc._2009 + births_&rc._2010 ) / (births_w_race_2008 + births_w_race_2009 + births_w_race_2010);
				pctbirths_&rc_st._2009_11=(births_&rc._2009 + births_&rc._2010 + births_&rc._2011 ) / (births_w_race_2009 + births_w_race_2010 + births_w_race_2011);
				pctbirths_&rc_st._2010_12=(births_&rc._2010 + births_&rc._2011 + births_&rc._2012 ) / (births_w_race_2010 + births_w_race_2011 + births_w_race_2012);
				pctbirths_&rc_st._2011_13=(births_&rc._2011 + births_&rc._2012 + births_&rc._2013 ) / (births_w_race_2011 + births_w_race_2012 + births_w_race_2013);
				pctbirths_&rc_st._2012_14=(births_&rc._2012 + births_&rc._2013 + births_&rc._2014 ) / (births_w_race_2012 + births_w_race_2013 + births_w_race_2014);
				pctbirths_&rc_st._2013_15=(births_&rc._2013 + births_&rc._2014 + births_&rc._2015 ) / (births_w_race_2013 + births_w_race_2014 + births_w_race_2015);
				pctbirths_&rc_st._2014_16=(births_&rc._2014 + births_&rc._2015 + births_&rc._2016 ) / (births_w_race_2014 + births_w_race_2015 + births_w_race_2016);

				pctbirths_low_wt_&rc_st._2003_05=(births_low_wt_&rc_st._2003 + births_low_wt_&rc_st._2004 + births_low_wt_&rc_st._2005 ) / (births_w_weight_&rc_st._2003 + births_w_weight_&rc_st._2004 + births_w_weight_&rc_st._2005);
				pctbirths_low_wt_&rc_st._2004_06=(births_low_wt_&rc_st._2004 + births_low_wt_&rc_st._2005 + births_low_wt_&rc_st._2006 ) / (births_w_weight_&rc_st._2004 + births_w_weight_&rc_st._2005 + births_w_weight_&rc_st._2006);
				pctbirths_low_wt_&rc_st._2005_07=(births_low_wt_&rc_st._2005 + births_low_wt_&rc_st._2006 + births_low_wt_&rc_st._2007 ) / (births_w_weight_&rc_st._2005 + births_w_weight_&rc_st._2006 + births_w_weight_&rc_st._2007);
				pctbirths_low_wt_&rc_st._2006_08=(births_low_wt_&rc_st._2006 + births_low_wt_&rc_st._2007 + births_low_wt_&rc_st._2008 ) / (births_w_weight_&rc_st._2006 + births_w_weight_&rc_st._2007 + births_w_weight_&rc_st._2008);
				pctbirths_low_wt_&rc_st._2007_09=(births_low_wt_&rc_st._2007 + births_low_wt_&rc_st._2008 + births_low_wt_&rc_st._2009 ) / (births_w_weight_&rc_st._2007 + births_w_weight_&rc_st._2008 + births_w_weight_&rc_st._2009);
				pctbirths_low_wt_&rc_st._2008_10=(births_low_wt_&rc_st._2008 + births_low_wt_&rc_st._2009 + births_low_wt_&rc_st._2010 ) / (births_w_weight_&rc_st._2008 + births_w_weight_&rc_st._2009 + births_w_weight_&rc_st._2010);
				pctbirths_low_wt_&rc_st._2009_11=(births_low_wt_&rc_st._2009 + births_low_wt_&rc_st._2010 + births_low_wt_&rc_st._2011 ) / (births_w_weight_&rc_st._2009 + births_w_weight_&rc_st._2010 + births_w_weight_&rc_st._2011);
				pctbirths_low_wt_&rc_st._2010_12=(births_low_wt_&rc_st._2010 + births_low_wt_&rc_st._2011 + births_low_wt_&rc_st._2012 ) / (births_w_weight_&rc_st._2010 + births_w_weight_&rc_st._2011 + births_w_weight_&rc_st._2012);
				pctbirths_low_wt_&rc_st._2011_13=(births_low_wt_&rc_st._2011 + births_low_wt_&rc_st._2012 + births_low_wt_&rc_st._2013 ) / (births_w_weight_&rc_st._2011 + births_w_weight_&rc_st._2012 + births_w_weight_&rc_st._2013);
				pctbirths_low_wt_&rc_st._2012_14=(births_low_wt_&rc_st._2012 + births_low_wt_&rc_st._2013 + births_low_wt_&rc_st._2014 ) / (births_w_weight_&rc_st._2012 + births_w_weight_&rc_st._2013 + births_w_weight_&rc_st._2014);
				pctbirths_low_wt_&rc_st._2013_15=(births_low_wt_&rc_st._2013 + births_low_wt_&rc_st._2014 + births_low_wt_&rc_st._2015 ) / (births_w_weight_&rc_st._2013 + births_w_weight_&rc_st._2014 + births_w_weight_&rc_st._2015);
				pctbirths_low_wt_&rc_st._2014_16=(births_low_wt_&rc_st._2014 + births_low_wt_&rc_st._2015 + births_low_wt_&rc_st._2016 ) / (births_w_weight_&rc_st._2014 + births_w_weight_&rc_st._2015 + births_w_weight_&rc_st._2016);


				pctbirths_inadcare_&rc_st._2003_05=(births_prenat_inad_&rc_st._2003 + births_prenat_inad_&rc_st._2004 + births_prenat_inad_&rc_st._2005 ) / (births_w_prenat_&rc_st._2003 + births_w_prenat_&rc_st._2004 + births_w_prenat_&rc_st._2005);
				pctbirths_inadcare_&rc_st._2004_06=(births_prenat_inad_&rc_st._2004 + births_prenat_inad_&rc_st._2005 + births_prenat_inad_&rc_st._2006 ) / (births_w_prenat_&rc_st._2004 + births_w_prenat_&rc_st._2005 + births_w_prenat_&rc_st._2006);
				pctbirths_inadcare_&rc_st._2005_07=(births_prenat_inad_&rc_st._2005 + births_prenat_inad_&rc_st._2006 + births_prenat_inad_&rc_st._2007 ) / (births_w_prenat_&rc_st._2005 + births_w_prenat_&rc_st._2006 + births_w_prenat_&rc_st._2007);
				pctbirths_inadcare_&rc_st._2006_08=(births_prenat_inad_&rc_st._2006 + births_prenat_inad_&rc_st._2007 + births_prenat_inad_&rc_st._2008 ) / (births_w_prenat_&rc_st._2006 + births_w_prenat_&rc_st._2007 + births_w_prenat_&rc_st._2008);
				pctbirths_inadcare_&rc_st._2007_09=(births_prenat_inad_&rc_st._2007 + births_prenat_inad_&rc_st._2008 + births_prenat_inad_&rc_st._2009 ) / (births_w_prenat_&rc_st._2007 + births_w_prenat_&rc_st._2008 + births_w_prenat_&rc_st._2009);
				pctbirths_inadcare_&rc_st._2008_10=(births_prenat_inad_&rc_st._2008 + births_prenat_inad_&rc_st._2009 + births_prenat_inad_&rc_st._2010 ) / (births_w_prenat_&rc_st._2008 + births_w_prenat_&rc_st._2009 + births_w_prenat_&rc_st._2010);
				pctbirths_inadcare_&rc_st._2009_11=(births_prenat_inad_&rc_st._2009 + births_prenat_inad_&rc_st._2010 + births_prenat_inad_&rc_st._2011 ) / (births_w_prenat_&rc_st._2009 + births_w_prenat_&rc_st._2010 + births_w_prenat_&rc_st._2011);
				pctbirths_inadcare_&rc_st._2010_12=(births_prenat_inad_&rc_st._2010 + births_prenat_inad_&rc_st._2011 + births_prenat_inad_&rc_st._2012 ) / (births_w_prenat_&rc_st._2010 + births_w_prenat_&rc_st._2011 + births_w_prenat_&rc_st._2012);
				pctbirths_inadcare_&rc_st._2011_13=(births_prenat_inad_&rc_st._2011 + births_prenat_inad_&rc_st._2012 + births_prenat_inad_&rc_st._2013 ) / (births_w_prenat_&rc_st._2011 + births_w_prenat_&rc_st._2012 + births_w_prenat_&rc_st._2013);
				pctbirths_inadcare_&rc_st._2012_14=(births_prenat_inad_&rc_st._2012 + births_prenat_inad_&rc_st._2013 + births_prenat_inad_&rc_st._2014 ) / (births_w_prenat_&rc_st._2012 + births_w_prenat_&rc_st._2013 + births_w_prenat_&rc_st._2014);
				pctbirths_inadcare_&rc_st._2013_15=(births_prenat_inad_&rc_st._2013 + births_prenat_inad_&rc_st._2014 + births_prenat_inad_&rc_st._2015 ) / (births_w_prenat_&rc_st._2013 + births_w_prenat_&rc_st._2014 + births_w_prenat_&rc_st._2015);
				pctbirths_inadcare_&rc_st._2014_16=(births_prenat_inad_&rc_st._2014 + births_prenat_inad_&rc_st._2015 + births_prenat_inad_&rc_st._2016 ) / (births_w_prenat_&rc_st._2014 + births_w_prenat_&rc_st._2015 + births_w_prenat_&rc_st._2016);
				
				label pctbirths_inadcare_&rc_st._2003_05="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2003-05"
				 pctbirths_inadcare_&rc_st._2004_06="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2004-06"
				  pctbirths_inadcare_&rc_st._2005_07="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2005-07"
					pctbirths_inadcare_&rc_st._2006_08="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2006-08"
				   pctbirths_inadcare_&rc_st._2007_09="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2007-09"
				    pctbirths_inadcare_&rc_st._2008_10="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2008-10"
					 pctbirths_inadcare_&rc_st._2009_11="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2009-11"
					  pctbirths_inadcare_&rc_st._2010_12="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2010-12"
					   pctbirths_inadcare_&rc_st._2011_13="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2011-13"
					    pctbirths_inadcare_&rc_st._2012_14="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2012-14"
						 pctbirths_inadcare_&rc_st._2013_15="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2013-15"
						  pctbirths_inadcare_&rc_st._2014_16="Percent of &rc_lbl. births with Inadequate Prenatal Care, 2014-16"
					;
				%end; 

			%mend birthsbyrace; 
			%birthsbyrace; 

			/* Birth weights by rate*/
			pctbirths_low_wt_2003 = births_low_wt_2003/births_w_weight_2003;
			pctbirths_low_wt_2004 = births_low_wt_2004/births_w_weight_2004;
			pctbirths_low_wt_2005 = births_low_wt_2005/births_w_weight_2005;
			pctbirths_low_wt_2006 = births_low_wt_2006/births_w_weight_2006;
			pctbirths_low_wt_2007 = births_low_wt_2007/births_w_weight_2007;
			pctbirths_low_wt_2008 = births_low_wt_2008/births_w_weight_2008;
			pctbirths_low_wt_2009 = births_low_wt_2009/births_w_weight_2009;
			pctbirths_low_wt_2010 = births_low_wt_2010/births_w_weight_2010;
			pctbirths_low_wt_2011 = births_low_wt_2011/births_w_weight_2011;
			pctbirths_low_wt_2012 = births_low_wt_2012/births_w_weight_2012;
			pctbirths_low_wt_2013 = births_low_wt_2013/births_w_weight_2013;
			pctbirths_low_wt_2014 = births_low_wt_2014/births_w_weight_2014;
			pctbirths_low_wt_2015 = births_low_wt_2015/births_w_weight_2015;
			pctbirths_low_wt_2016 = births_low_wt_2016/births_w_weight_2016;

		

			/* Births with Prenatal care*/

            pctinad_care_2003 = births_prenat_inad_2003/births_w_prenat_2003;
			pctinad_care_2004 = births_prenat_inad_2004/births_w_prenat_2004;
			pctinad_care_2005 = births_prenat_inad_2005/births_w_prenat_2005;
			pctinad_care_2006 = births_prenat_inad_2006/births_w_prenat_2006;
			pctinad_care_2007 = births_prenat_inad_2007/births_w_prenat_2007;
			pctinad_care_2008 = births_prenat_inad_2008/births_w_prenat_2008;
			pctinad_care_2009 = births_prenat_inad_2009/births_w_prenat_2009;
			pctinad_care_2010 = births_prenat_inad_2010/births_w_prenat_2010;
			pctinad_care_2011 = births_prenat_inad_2011/births_w_prenat_2011;
			pctinad_care_2012 = births_prenat_inad_2012/births_w_prenat_2012;
			pctinad_care_2013 = births_prenat_inad_2013/births_w_prenat_2013; 
			pctinad_care_2014 = births_prenat_inad_2014/births_w_prenat_2014;
			pctinad_care_2015 = births_prenat_inad_2015/births_w_prenat_2015;
			pctinad_care_2016 = births_prenat_inad_2016/births_w_prenat_2016;


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
			pctfs_oth_2003 = fs_other_2003/fs_w_race_2003;
			pctfs_oth_2004 = fs_other_2004/fs_w_race_2004;
			pctfs_oth_2005 = fs_other_2005/fs_w_race_2005;
			pctfs_oth_2006 = fs_other_2006/fs_w_race_2006;
			pctfs_oth_2007 = fs_other_2007/fs_w_race_2007;
			pctfs_oth_2008 = fs_other_2008/fs_w_race_2008;
			pctfs_oth_2009 = fs_other_2009/fs_w_race_2009;
			pctfs_oth_2010 = fs_other_2010/fs_w_race_2010;
			pctfs_oth_2011 = fs_other_2011/fs_w_race_2011;
			pctfs_oth_2012 = fs_other_2012/fs_w_race_2012;
			pctfs_oth_2013 = fs_other_2013/fs_w_race_2013; 
			pctfs_oth_2014 = fs_other_2014/fs_w_race_2014;
			pctfs_oth_2015 = fs_other_2015/fs_w_race_2015;
			pctfs_oth_2016 = fs_other_2016/fs_w_race_2016;


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

pcttanf_oth_2003 = tanf_other_2003/tanf_w_race_2003;
			pcttanf_oth_2004 = tanf_other_2004/tanf_w_race_2004;
			pcttanf_oth_2005 = tanf_other_2005/tanf_w_race_2005;
			pcttanf_oth_2006 = tanf_other_2006/tanf_w_race_2006;
			pcttanf_oth_2007 = tanf_other_2007/tanf_w_race_2007;
			pcttanf_oth_2008 = tanf_other_2008/tanf_w_race_2008;
			pcttanf_oth_2009 = tanf_other_2009/tanf_w_race_2009;
			pcttanf_oth_2010 = tanf_other_2010/tanf_w_race_2010;
			pcttanf_oth_2011 = tanf_other_2011/tanf_w_race_2011;
			pcttanf_oth_2012 = tanf_other_2012/tanf_w_race_2012;
			pcttanf_oth_2013 = tanf_other_2013/tanf_w_race_2013; 
			pcttanf_oth_2014 = tanf_other_2014/tanf_w_race_2014;
			pcttanf_oth_2015 = tanf_other_2015/tanf_w_race_2015;
			pcttanf_oth_2016 = tanf_other_2016/tanf_w_race_2016;

			**Population Change**;
			
			pctchange_80_90 = (totpop_1990-totpop_1980)/totpop_1980;
			pctchange_90_00 = (totpop_2000-totpop_1990)/totpop_1990;
			pctchange_00_10 = (totpop_2010-totpop_2000)/totpop_2000;

			Pctchange_blk_80_90 = (popblacknonhispbridge_1990-popblacknonhispbridge_1980)/popblacknonhispbridge_1980;
			Pctchange_blk_90_00 = (popblacknonhispbridge_2000-popblacknonhispbridge_1990)/popblacknonhispbridge_1990;
			pctchange_blk_00_10 = (popblacknonhispbridge_2010-popblacknonhispbridge_2000)/popblacknonhispbridge_2000;

		
			Pctchange_asi_90_00 = (popasianpinonhispbridge_2000-popasianpinonhispbridge_1990)/popasianpinonhispbridge_1990;
			pctchange_asi_00_10 = (popasianpinonhispbridge_2010-popasianpinonhispbridge_2000)/popasianpinonhispbridge_2000;

			Pctchange_wht_80_90 = (popwhitenonhispbridge_1990-popwhitenonhispbridge_1980)/popwhitenonhispbridge_1980;
			Pctchange_wht_90_00 = (popwhitenonhispbridge_2000-popwhitenonhispbridge_1990)/popwhitenonhispbridge_1990;
			pctchange_wht_00_10 = (popwhitenonhispbridge_2010-popwhitenonhispbridge_2000)/popwhitenonhispbridge_2000;

			
			Pctchange_oth_90_00 = (popothernonhispbridge_2000-popothernonhispbridge_1990)/popothernonhispbridge_1990;
			pctchange_oth_00_10 = (popothernonhispbridge_2010-popothernonhispbridge_2000)/popothernonhispbridge_2000;

			
			Pctchange_nat_90_00 = (popnativeamnonhispbridge_2000-popnativeamnonhispbridge_1990)/popnativeamnonhispbridge_1990;
			pctchange_nat_00_10 = (popnativeamnonhispbridge_2010-popnativeamnonhispbridge_2000)/popnativeamnonhispbridge_2000;

			Pctchange_hsp_80_90 = (pophisp_1990-pophisp_1980)/pophisp_1980;
			Pctchange_hsp_90_00 = (pophisp_2000-pophisp_1990)/pophisp_1990;
			pctchange_hsp_00_10 = (pophisp_2010-pophisp_2000)/pophisp_2000;

			Pctchange_alloth_80_90 =(shrnhj9n-SHRNHJ8N) / SHRNHJ8N;
			Pctchange_alloth_90_00 =(shrnhj0n - shrnhj9n) /shrnhj9n;
			Pctchange_alloth_00_10 =(shrnhj1n - shrnhj0n)/shrnhj0n;

			/*gross rent*/

			grossrentunder500&_years. = GrossRentNoCash_2012_16 + GrossRentLT100_2012_16 +
			GrossRent100_149_2012_16 +
			GrossRent150_199_2012_16 +
			GrossRent200_249_2012_16 +
			GrossRent250_299_2012_16 +
			GrossRent300_349_2012_16 +
			GrossRent350_349_2012_16  +/*incorrect var name*/
			GrossRent400_449_2012_16 +
			GrossRent450_499_2012_16;

			grossrent500_750&_years. = GrossRent500_549_2012_16 +
			GrossRent550_599_2012_16 +
			GrossRent600_649_2012_16 +
			GrossRent650_699_2012_16 +
			GrossRent700_749_2012_16;

			grossrent750_1000&_years. = GrossRent750_799_2012_16 +
			GrossRent800_899_2012_16 +
			GrossRent900_999_2012_16 ;

			grossrent1000_1250&_years. = GrossRent1000_1249_2012_16;

			grossrent1250_1500&_years. = GrossRent1250_1499_2012_16;

			grossrentover1500&_years. = GrossRent1500_1999_2012_16 +
			GrossRent2000_2499_2012_16 +
			GrossRent2500_2999_2012_16 +
			GrossRent3000_3499_2012_16 +
			GrossRentGT3500_2012_16;

			**Pop Age 18-64 Years Old 2012_16**;

			pop18to64years_2012_16 = pop18_34years_2012_16 + pop35_64years_2012_16; 

			**Age by race**;
			pctu18&_years. = popunder18years_2012_16/totpop&_years.;
			pct18_34&_years. = pop18_34years_2012_16/totpop&_years.;
			pct35_64&_years. = pop35_64years_2012_16/totpop&_years.;
			pcto65&_years. = pop65andoveryears_2012_16/totpop&_years.;

			pctu18b&_years. = popunder18yearsb_2012_16/popaloneb_2012_16 ;
			pct18_34b&_years. = pop18_34yearsb_2012_16/popaloneb_2012_16 ;
			pct35_64b&_years. = pop35_64yearsb_2012_16/popaloneb_2012_16 ;
			pcto65b&_years. = pop65andoveryearsb_2012_16/popaloneb_2012_16 ;

			pctu18a&_years. = popunder18yearsa_2012_16/popalonea_2012_16 ;
			pct18_34a&_years. = pop18_34yearsa_2012_16/popalonea_2012_16 ;
			pct35_64a&_years. = pop35_64yearsa_2012_16/popalonea_2012_16 ;
			pcto65a&_years. = pop65andoveryearsa_2012_16/popalonea_2012_16 ;

			pctu18w&_years. = popunder18yearsw_2012_16/popalonew_2012_16 ;
			pct18_34w&_years. = pop18_34yearsw_2012_16/popalonew_2012_16 ;
			pct35_64w&_years. = pop35_64yearsw_2012_16/popalonew_2012_16 ;
			pcto65w&_years. = pop65andoveryearsw_2012_16/popalonew_2012_16 ;

			pctu18h&_years. = popunder18yearsh_2012_16/popaloneh_2012_16 ;
			pct18_34h&_years. = pop18_34yearsh_2012_16/popaloneh_2012_16 ;
			pct35_64h&_years. = pop35_64yearsh_2012_16/popaloneh_2012_16 ;
			pcto65h&_years. = pop65andoveryearsh_2012_16/popaloneh_2012_16 ;

			pctu18aiom&_years. = popunder18yearsaiom_2012_16/popaloneaiom_2012_16 ;
			pct18_34aiom&_years. = pop18_34yearsaiom_2012_16/popaloneaiom_2012_16 ;
			pct35_64aiom&_years. = pop35_64yearsaiom_2012_16/popaloneaiom_2012_16 ;
			pcto65aiom&_years. = pop65andoveryearsaiom_2012_16/popaloneaiom_2012_16 ;

			
			**Income**; 

			hshldincunder25000_2012_16 = hshldincunder10000_2012_16+ hshldinc10000to14999_2012_16 + hshldinc15000to19999_2012_16 + hshldinc20000to24999_2012_16; 
			hshldinc25000to49999_2012_16 = hshldinc25000to29999_2012_16 + hshldinc30000to34999_2012_16 + hshldinc35000to39999_2012_16 + hshldinc40000to44999_2012_16 + hshldinc45000to49999_2012_16;
			hshldinc75000to124999_2012_16 =  hshldinc75000to99999_2012_16 + hshldinc100000to124999_2012_16; 
			hshldinc125000plus_2012_16 = hshldinc125000to149999_2012_16 + hshldinc150000to199999_2012_16 + hshldinc200000andover_2012_16; 
			
			pct_hshldincunder10000_2012_16 = hshldincunder10000_2012_16/numhshlds_2012_16;
			pct_hshldincunder25000_2012_16 = hshldincunder25000_2012_16/numhshlds_2012_16;
			pct_hshldinc25000to49999_2012_16 = hshldinc25000to49999_2012_16/numhshlds_2012_16;
			pct_hshldinc50000to74999_2012_16 = hshldinc50000to74999_2012_16/numhshlds_2012_16;
			pct_hshldinc75000124999_2012_16 = hshldinc75000to124999_2012_16/numhshlds_2012_16;
			pct_hshldinc125000plus_2012_16 = hshldinc125000plus_2012_16/numhshlds_2012_16;

			/*pct_hshldinc100000plus_2012_16 = hshldinc100000plus_2012_16/numhshlds_2012_16;
			pct_hshldinc100000124999_2012_16 = hshldinc100000to124999_2012_16/numhshlds_2012_16;
			pct_hshldinc10000to14999_2012_16 = hshldinc10000to14999_2012_16/numhshlds_2012_16;
			pct_hshldinc125000149999_2012_16 = hshldinc125000to149999_2012_16/numhshlds_2012_16;
			pct_hshldinc150000199999_2012_16 = hshldinc150000to199999_2012_16/numhshlds_2012_16;
			pct_hshldinc15000to19999_2012_16 = hshldinc15000to19999_2012_16/numhshlds_2012_16;
			pct_hshldinc15000to34999_2012_16 = hshldinc15000to34999_2012_16/numhshlds_2012_16;
			pct_hshldinc200000over_2012_16 = hshldinc200000andover_2012_16/numhshlds_2012_16;
			pct_hshldinc200000plus_2012_16 = hshldinc200000plus_2012_16/numhshlds_2012_16;
			pct_hshldinc20000to24999_2012_16 = hshldinc20000to24999_2012_16/numhshlds_2012_16;
			pct_hshldinc25000to29999_2012_16 = hshldinc25000to29999_2012_16/numhshlds_2012_16;
			pct_hshldinc30000to34999_2012_16 = hshldinc30000to34999_2012_16/numhshlds_2012_16;
			pct_hshldinc35000to39999_2012_16 = hshldinc35000to39999_2012_16/numhshlds_2012_16;
			pct_hshldinc35000to49999_2012_16 = hshldinc35000to49999_2012_16/numhshlds_2012_16;
			pct_hshldinc40000to44999_2012_16 = hshldinc40000to44999_2012_16/numhshlds_2012_16;
			pct_hshldinc45000to49999_2012_16 = hshldinc45000to49999_2012_16/numhshlds_2012_16;
			pct_hshldinc50000to59999_2012_16 = hshldinc50000to59999_2012_16/numhshlds_2012_16;
			pct_hshldinc50000to74999_2012_16 = hshldinc50000to74999_2012_16/numhshlds_2012_16;
			pct_hshldinc60000to74999_2012_16 = hshldinc60000to74999_2012_16/numhshlds_2012_16;
			pct_hshldinc75000to99999_2012_16 = hshldinc75000to99999_2012_16/numhshlds_2012_16;
			pct_hshldincunder10000_2012_16 = hshldincunder10000_2012_16/numhshlds_2012_16;
			pct_hshldincunder15000_2012_16 = hshldincunder15000_2012_16/numhshlds_2012_16;*/



label 

		PctPoorPersons&_years. = "Poverty Rate"
		PctPoorChildren&_years. = "Child Poverty Rate"
		PctLaborForce&_years. = "Labor Force Participation Rate"
		PctPopEmployed&_years. = "Employment Rate"
		PctPopUnemployed&_years. = "Unemployment Rate"
		PctWht&_years. = "Percent White"
		PctBlk&_years. = "Percent Black"
		PctHisp&_years. = "Percent Latino"
		PctAsn&_years. = "Percent Asian"
		PctMult&_years. = "Percent Multiracial"
		PctNat&_years. = "Percent Indigenous American"
		PctOth&_years. = "Percent Other"
		PctHS&_years. = "High School Diploma"
		PctCol&_years. = "Bachelor's or Graduate Degree"
		PctWoutHS&_years. = "Without High School Dimploma"
		PctOwnerOccupiedHU&_years. = "Owner"
		PctRenterOccupiedHU&_years. = "Renter"
		PctRenterCostBurden&_years. = "Cost-Burdened Renter"
		PctRentSevereCostBurden&_years. = "Severely Cost-Burdened Renter"
		PctOwnerCostBurden&_years. = "Cost-Burdened Owner"
		PctOwnSevereCostBurden&_years. = "Severely Cost Burdened Owner"
		pctchange_80_90 = "Population Change 1980-1990"
		pctchange_90_00 = "Population Change 1990-2000"
		pctchange_00_10 = "Population Change 2000-2010"

		Pctchange_blk_80_90 = "Black Population Change 1980-1990"
		Pctchange_blk_90_00 = "Black Population Change 1990-2000"
		pctchange_blk_00_10 = "Black Population Change 2000-2010" 

		Pctchange_asi_90_00 = "Asian Population Change 1990-2000"
		pctchange_asi_00_10 = "Asian Population Change 2000-2010"

		Pctchange_wht_80_90 = "White Population Change 1980-1990"
		Pctchange_wht_90_00 = "White Population Change 1990-2000"
		pctchange_wht_00_10 = "White Population Change 2000-2010"

		Pctchange_oth_90_00 = "Other Population Change 1990-2000"
		pctchange_oth_00_10 = "Other Population Change 2000-2010"

		Pctchange_nat_90_00 = "Indigenous Population Change 1990-2000"
		pctchange_nat_00_10 = "Indigenous Population Change 2000-2010"

		Pctchange_hsp_80_90 = "Latino Population Change 1980-1990"
		Pctchange_hsp_90_00 = "Latino Population Change 1990-2000"
		pctchange_hsp_00_10 = "Latino Population Change 2000-2010"

		Pctchange_alloth_80_90 ="Asian, PI, Native, Other change 1980-1990"
		Pctchange_alloth_90_00 ="Asian, PI, Native, Other change 1990-2000"
		Pctchange_alloth_00_10 ="Asian, PI, Native, Other change 2000-2010"

			/*pct_hshldinc100000plus_2012_16 = "Percent Households with Income $100,000 Plus" 
			pct_hshldinc100000124999_2012_16 = "Percent Households with Income $100,000- $124,999" 
			pct_hshldinc10000to14999_2012_16 = "Percent Households with Income $10,000-$14,999 " 
			pct_hshldinc125000149999_2012_16 = "Percent Households with Income $125,000- $149,999" 
			pct_hshldinc150000199999_2012_16 = "Percent Households with Income $150,000 - $199,999" 
			pct_hshldinc15000to19999_2012_16 ="Percent Households with Income $15,000 -$19,999" 
			pct_hshldinc15000to34999_2012_16 = "Percent Households with Income $15,000 -$34,999" 
			pct_hshldinc200000over_2012_16 = "Percent Households with Income $200,000 and over" 
			pct_hshldinc200000plus_2012_16 = "Percent Households with Income $200,000 Plus" 
			pct_hshldinc20000to24999_2012_16 = "Percent Households with Income $20,000- $24,999" 
			pct_hshldinc25000to29999_2012_16 = "Percent Households with Income $25,000- $29,999" 
			pct_hshldinc30000to34999_2012_16 = "Percent Households with Income $30,000- $34,999" 
			pct_hshldinc35000to39999_2012_16 ="Percent Households with Income $35,000- $39,999" 
			pct_hshldinc35000to49999_2012_16 = "Percent Households with Income $35,000- $49,999" 
			pct_hshldinc40000to44999_2012_16 = "Percent Households with Income $40,000- $44,999" 
			pct_hshldinc45000to49999_2012_16 = "Percent Households with Income $45,000- $49,999" 
			pct_hshldinc50000to59999_2012_16 ="Percent Households with Income $50,000- $59,999" 
			pct_hshldinc50000to74999_2012_16 = "Percent Households with Income $50,000- $74,999" 
			pct_hshldinc60000to74999_2012_16 ="Percent Households with Income $60,000- $74,999" 
			pct_hshldinc75000to99999_2012_16 = "Percent Households with Income $75,000- $99,999" 
			pct_hshldincunder10000_2012_16 = "Percent Households with Income under $10,000" 
			pct_hshldincunder15000_2012_16 ="Percent Households with Income under $15,000" */

			pct_hshldincunder10000_2012_16 = "Percent Households with Income under $10,000" 
			pct_hshldincunder25000_2012_16 = "Percent Households with Income under $25,000"
			pct_hshldinc25000to49999_2012_16 = "Percent Households with Income $25,000- $49,999"
			pct_hshldinc50000to74999_2012_16 = "Percent Households with Income $50,000- $74,999"
			pct_hshldinc75000124999_2012_16 = "Percent Households with Income $75,000- $124,999"
			pct_hshldinc125000plus_2012_16 = "Percent Households with Income $125,000 and Over"

			pctbirths_low_wt_2003 = "Percent Low Weight Births 2003" 
			pctbirths_low_wt_2004 ="Percent Low Weight Births 2004" 
			pctbirths_low_wt_2005 = "Percent Low Weight Births 2005" 
			pctbirths_low_wt_2006 ="Percent Low Weight Births 2006" 
			pctbirths_low_wt_2007 = "Percent Low Weight Births 2007" 
			pctbirths_low_wt_2008 = "Percent Low Weight Births 2008" 
			pctbirths_low_wt_2009 = "Percent Low Weight Births 2009" 
			pctbirths_low_wt_2010 = "Percent Low Weight Births 2010" 
			pctbirths_low_wt_2011 = "Percent Low Weight Births 2011" 
			pctbirths_low_wt_2012 = "Percent Low Weight Births 2012" 
			pctbirths_low_wt_2013 = "Percent Low Weight Births 2013" 
			pctbirths_low_wt_2014 = "Percent Low Weight Births 2014" 
			pctbirths_low_wt_2015 = "Percent Low Weight Births 2015" 
			pctbirths_low_wt_2016 = "Percent Low Weight Births 2016" 

			pctbirths_low_wt_asn_2003_05 = "Percent Low Weight Births 2003-05 (Asian)" 
			pctbirths_low_wt_asn_2004_06 = "Percent Low Weight Births 2004-06 (Asian)" 
			pctbirths_low_wt_asn_2005_07 = "Percent Low Weight Births 2005-07 (Asian)" 
			pctbirths_low_wt_asn_2006_08 = "Percent Low Weight Births 2006-08 (Asian)" 
			pctbirths_low_wt_asn_2007_09 = "Percent Low Weight Births 2007-09 (Asian)" 
			pctbirths_low_wt_asn_2008_10 = "Percent Low Weight Births 2008-10 (Asian)"
			pctbirths_low_wt_asn_2009_11 = "Percent Low Weight Births 2009-11 (Asian)"
			pctbirths_low_wt_asn_2010_12 = "Percent Low Weight Births 2010-12 (Asian)"
			pctbirths_low_wt_asn_2011_13 = "Percent Low Weight Births 2011-13 (Asian)"
			pctbirths_low_wt_asn_2012_14 = "Percent Low Weight Births 2012-14 (Asian)"
			pctbirths_low_wt_asn_2013_15 = "Percent Low Weight Births 2013-15 (Asian)"
			pctbirths_low_wt_asn_2014_16 = "Percent Low Weight Births 2014-16 (Asian)"
		
			pctbirths_low_wt_blk_2003_05 = "Percent Low Weight Births 2003-05 (Black)" 
			pctbirths_low_wt_blk_2004_06 = "Percent Low Weight Births 2004-06 (Black)" 
			pctbirths_low_wt_blk_2005_07 = "Percent Low Weight Births 2005-07 (Black)" 
			pctbirths_low_wt_blk_2006_08 = "Percent Low Weight Births 2006-08 (Black)"  
			pctbirths_low_wt_blk_2007_09 = "Percent Low Weight Births 2007-09 (Black)" 
			pctbirths_low_wt_blk_2008_10 = "Percent Low Weight Births 2008-10 (Black)" 
			pctbirths_low_wt_blk_2009_11 = "Percent Low Weight Births 2009-11 (Black)" 
			pctbirths_low_wt_blk_2010_12 = "Percent Low Weight Births 2010-12 (Black)"  
			pctbirths_low_wt_blk_2011_13 = "Percent Low Weight Births 2011-13 (Black)" 
			pctbirths_low_wt_blk_2012_14 = "Percent Low Weight Births 2012-14 (Black)" 
			pctbirths_low_wt_blk_2013_15 = "Percent Low Weight Births 2013-15 (Black)"  
			pctbirths_low_wt_blk_2014_16 = "Percent Low Weight Births 2014-16 (Black)" 
	
			pctbirths_low_wt_hsp_2003_05 = "Percent Low Weight Births 2003-05 (Hispanic)" 
			pctbirths_low_wt_hsp_2004_06 = "Percent Low Weight Births 2004-06 (Hispanic)" 
			pctbirths_low_wt_hsp_2005_07 = "Percent Low Weight Births 2005-07 (Hispanic)" 
			pctbirths_low_wt_hsp_2006_08 = "Percent Low Weight Births 2006-08 (Hispanic)" 
			pctbirths_low_wt_hsp_2007_09 = "Percent Low Weight Births 2007-09 (Hispanic)" 
			pctbirths_low_wt_hsp_2008_10 = "Percent Low Weight Births 2008-10 (Hispanic)" 
			pctbirths_low_wt_hsp_2009_11 = "Percent Low Weight Births 2009-11 (Hispanic)" 
			pctbirths_low_wt_hsp_2010_12 = "Percent Low Weight Births 2010-12 (Hispanic)" 
			pctbirths_low_wt_hsp_2011_13 = "Percent Low Weight Births 2011-13 (Hispanic)" 
			pctbirths_low_wt_hsp_2012_14 = "Percent Low Weight Births 2012-14 (Hispanic)" 
			pctbirths_low_wt_hsp_2013_15 = "Percent Low Weight Births 2013-15 (Hispanic)" 
			pctbirths_low_wt_hsp_2014_16 = "Percent Low Weight Births 2014-16 (Hispanic)" 
	
			pctbirths_low_wt_oth_2003_05 = "Percent Low Weight Births 2003-05 (Other)" 
			pctbirths_low_wt_oth_2004_06 = "Percent Low Weight Births 2004-06 (Other)" 
			pctbirths_low_wt_oth_2005_07 = "Percent Low Weight Births 2005-07 (Other)"
			pctbirths_low_wt_oth_2006_08 = "Percent Low Weight Births 2006-08 (Other)"
			pctbirths_low_wt_oth_2007_09 = "Percent Low Weight Births 2007-09 (Other)"
			pctbirths_low_wt_oth_2008_10 = "Percent Low Weight Births 2008-10 (Other)"
			pctbirths_low_wt_oth_2009_11 = "Percent Low Weight Births 2009-11 (Other)"
			pctbirths_low_wt_oth_2010_12 = "Percent Low Weight Births 2010-12 (Other)"
			pctbirths_low_wt_oth_2011_13 = "Percent Low Weight Births 2011-13 (Other)"
			pctbirths_low_wt_oth_2012_14 = "Percent Low Weight Births 2012-14 (Other)"
			pctbirths_low_wt_oth_2013_15 = "Percent Low Weight Births 2013-15 (Other)"
			pctbirths_low_wt_oth_2014_16 = "Percent Low Weight Births 2014-16 (Other)"

			pctbirths_low_wt_wht_2003_05 = "Percent Low Weight Births 2003-05 (White)"
			pctbirths_low_wt_wht_2004_06 = "Percent Low Weight Births 2004-06 (White)"
			pctbirths_low_wt_wht_2005_07 = "Percent Low Weight Births 2005-07 (White)"
			pctbirths_low_wt_wht_2006_08 = "Percent Low Weight Births 2006-08 (White)"
			pctbirths_low_wt_wht_2007_09 = "Percent Low Weight Births 2007-09 (White)"
			pctbirths_low_wt_wht_2008_10 = "Percent Low Weight Births 2008-10 (White)"
			pctbirths_low_wt_wht_2009_11 = "Percent Low Weight Births 2009-11 (White)"
			pctbirths_low_wt_wht_2010_12 = "Percent Low Weight Births 2010-12 (White)"
			pctbirths_low_wt_wht_2011_13 = "Percent Low Weight Births 2011-13 (White)"
			pctbirths_low_wt_wht_2012_14 = "Percent Low Weight Births 2012-14 (White)"
			pctbirths_low_wt_wht_2013_15 = "Percent Low Weight Births 2013-15 (White)"
			pctbirths_low_wt_wht_2014_16 = "Percent Low Weight Births 2014-16 (White)"
	
; 

if geography="2" then geography="Ward 2";
if geography="5" then geography="Ward 5";
if geography="6" then geography="Ward 6";

run;

**Transpose from wide to long data where observations are the indicators**;

proc transpose data=compile_mvt_tabs_full out=mvt_tabs(label="MVT Tabulations");
	var geography &acs_vars &ncdbold_vars &ncdb_vars &ncdb_1980a &sales_vars &birth_vars &tanf_vars &fs_vars &unit_vars &price_vars &subs_vars &plan_vars
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
			violent_crime_rate_2017

		/*Household Income*/
			pct_hshldincunder10000_2012_16 
			pct_hshldincunder25000_2012_16 
			pct_hshldinc25000to49999_2012_16 
			pct_hshldinc50000to74999_2012_16 
			pct_hshldinc75000124999_2012_16 
			pct_hshldinc125000plus_2012_16

		/*Low Birth Weight*/
			pctbirths_low_wt_2003
			pctbirths_low_wt_2004 
			pctbirths_low_wt_2005 
			pctbirths_low_wt_2006 
			pctbirths_low_wt_2007 
			pctbirths_low_wt_2008 
			pctbirths_low_wt_2009
			pctbirths_low_wt_2010
			pctbirths_low_wt_2011 
			pctbirths_low_wt_2012
			pctbirths_low_wt_2013
			pctbirths_low_wt_2014
			pctbirths_low_wt_2015
			pctbirths_low_wt_2016

			pctbirths_low_wt_asi_2007_09
			pctbirths_low_wt_asi_2008_10 
			pctbirths_low_wt_asi_2009_11 
			pctbirths_low_wt_asi_2010_12 
			pctbirths_low_wt_asi_2011_13 
			pctbirths_low_wt_asi_2012_14 
			pctbirths_low_wt_asi_2013_15
			pctbirths_low_wt_asi_2014_16
			
			pctbirths_low_wt_blk_2007_09
			pctbirths_low_wt_blk_2008_10
			pctbirths_low_wt_blk_2009_11
			pctbirths_low_wt_blk_2010_12
			pctbirths_low_wt_blk_2011_13
			pctbirths_low_wt_blk_2012_14
			pctbirths_low_wt_blk_2013_15 
			pctbirths_low_wt_blk_2014_16
					
			pctbirths_low_wt_wht_2007_09 
			pctbirths_low_wt_wht_2008_10 
			pctbirths_low_wt_wht_2009_11 
			pctbirths_low_wt_wht_2010_12 
			pctbirths_low_wt_wht_2011_13 
			pctbirths_low_wt_wht_2012_14 
			pctbirths_low_wt_wht_2013_15 
			pctbirths_low_wt_wht_2014_16

			/*prenatal care*/
			pctinad_care_2003
			pctinad_care_2004
			pctinad_care_2005
			pctinad_care_2006
			pctinad_care_2007
			pctinad_care_2008
			pctinad_care_2009
			pctinad_care_2010
			pctinad_care_2011
			pctinad_care_2012
			pctinad_care_2013
			pctinad_care_2014
			pctinad_care_2015
			pctinad_care_2016

			pctbirths_inadcare_asi_2009_11 
			pctbirths_inadcare_asi_2010_12 
			pctbirths_inadcare_asi_2011_13 
			pctbirths_inadcare_asi_2012_14 
			pctbirths_inadcare_asi_2013_15
			pctbirths_inadcare_asi_2014_16
			
			pctbirths_inadcare_blk_2009_11
			pctbirths_inadcare_blk_2010_12
			pctbirths_inadcare_blk_2011_13
			pctbirths_inadcare_blk_2012_14
			pctbirths_inadcare_blk_2013_15 
			pctbirths_inadcare_blk_2014_16
					
			pctbirths_inadcare_wht_2009_11 
			pctbirths_inadcare_wht_2010_12 
			pctbirths_inadcare_wht_2011_13 
			pctbirths_inadcare_wht_2012_14 
			pctbirths_inadcare_wht_2013_15 
			pctbirths_inadcare_wht_2014_16
		
;
id geography; 
run; 

proc sort data = compile_mvt_tabs_full;
	by geography;
run;


ods tagsets.excelxp file="&_dcdata_default_path.\MVT\prog\mvtprofile.xls" 
      options( sheet_interval='' );
ods listing close;

ods tagsets.excelxp options( sheet_name="Population");
proc print data= compile_mvt_tabs_full label noobs;
  var geography totpop_1980 totpop_1990 totpop_2000 totpop_2010 tpop2015 tpop2020 tpop2025 tpop2030 tpop2035 tpop2040 tpop2045
  				pctchange_80_90 pctchange_90_00 pctchange_00_10 ;
run;

ods tagsets.excelxp options( sheet_name="Race Trends");
proc print data= compile_mvt_tabs_full label noobs;
  var geography popwithrace_1980 popwithrace_1990 popwithrace_2000 popwithrace_2010 popblacknonhispbridge_1980
	popblacknonhispbridge_1990 popblacknonhispbridge_2000 popblacknonhispbridge_2010 popasianpinonhispbridge_1990 
	popasianpinonhispbridge_2000 popasianpinonhispbridge_2010 popwhitenonhispbridge_1980 popwhitenonhispbridge_1990 
		popwhitenonhispbridge_2000 popwhitenonhispbridge_2010 pophisp_1980 pophisp_1990 pophisp_2000 pophisp_2010
		popnativeamnonhispbridge_1990 popnativeamnonhispbridge_2000 popnativeamnonhispbridge_2010 popothernonhispbridge_1990 
		   popothernonhispbridge_2000 popothernonhispbridge_2010

		  SHRNHJ8N  shrnhj9n shrnhj0n shrnhj1n
 
		   Pctchange_blk_80_90 Pctchange_blk_90_00 pctchange_blk_00_10 Pctchange_asi_90_00 pctchange_asi_00_10 
			Pctchange_wht_80_90 Pctchange_wht_90_00 pctchange_wht_00_10	Pctchange_hsp_80_90 Pctchange_hsp_90_00	pctchange_hsp_00_10
			Pctchange_oth_90_00 pctchange_oth_00_10 Pctchange_nat_90_00 pctchange_nat_00_10 Pctchange_alloth_80_90 Pctchange_alloth_90_00 Pctchange_alloth_00_10;
run;

ods tagsets.excelxp options( sheet_name="Curr Race");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography
			
			PctBlk&_years.
			PctAsn&_years.
			PctWht&_years. 
			PctHisp&_years.
			PctNat&_years.
			PctMult&_years.
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
  var	geography pctbirths_b: pctbirths_a: pctbirths_w: pctbirths_h: pctbirths_o:;
run;

ods tagsets.excelxp options( sheet_name="Tenure");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography 
PctOwnerOccupiedHU&_years. 	PctRenterOccupiedHU&_years.;
run;

ods tagsets.excelxp options( sheet_name="SF-Condo Median Price");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography 
mprice:;
run;

ods tagsets.excelxp options( sheet_name="Condo Median Price");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography 
mCondoprice:;
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
  var	geography tanf_client: fs_client: pctfs_b: pctfs_a: pctfs_w: pctfs_h: pcttanf_b: pcttanf_a: pcttanf_w:  pcttanf_h:;
run;

ods tagsets.excelxp options( sheet_name="Inadequate Prenatal Care");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography
			pctinad_care_2003
			pctinad_care_2004
			pctinad_care_2005
			pctinad_care_2006
			pctinad_care_2007
			pctinad_care_2008
			pctinad_care_2009
			pctinad_care_2010
			pctinad_care_2011
			pctinad_care_2012
			pctinad_care_2013
			pctinad_care_2014
			pctinad_care_2015
			pctinad_care_2016
	
		   pctbirths_inadcare_asi_2009_11 
			pctbirths_inadcare_asi_2010_12 
			pctbirths_inadcare_asi_2011_13 
			pctbirths_inadcare_asi_2012_14 
			pctbirths_inadcare_asi_2013_15
			pctbirths_inadcare_asi_2014_16
			
			pctbirths_inadcare_blk_2009_11
			pctbirths_inadcare_blk_2010_12
			pctbirths_inadcare_blk_2011_13
			pctbirths_inadcare_blk_2012_14
			pctbirths_inadcare_blk_2013_15 
			pctbirths_inadcare_blk_2014_16
					
			pctbirths_inadcare_wht_2009_11 
			pctbirths_inadcare_wht_2010_12 
			pctbirths_inadcare_wht_2011_13 
			pctbirths_inadcare_wht_2012_14 
			pctbirths_inadcare_wht_2013_15 
			pctbirths_inadcare_wht_2014_16;

run;

ods tagsets.excelxp options( sheet_name="Low Weight Births by Race");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography
			pctbirths_low_wt_2003
			pctbirths_low_wt_2004 
			pctbirths_low_wt_2005 
			pctbirths_low_wt_2006 
			pctbirths_low_wt_2007 
			pctbirths_low_wt_2008 
			pctbirths_low_wt_2009
			pctbirths_low_wt_2010
			pctbirths_low_wt_2011 
			pctbirths_low_wt_2012
			pctbirths_low_wt_2013
			pctbirths_low_wt_2014
			pctbirths_low_wt_2015
			pctbirths_low_wt_2016

			pctbirths_low_wt_asi_2007_09
			pctbirths_low_wt_asi_2008_10 
			pctbirths_low_wt_asi_2009_11 
			pctbirths_low_wt_asi_2010_12 
			pctbirths_low_wt_asi_2011_13 
			pctbirths_low_wt_asi_2012_14 
			pctbirths_low_wt_asi_2013_15
			pctbirths_low_wt_asi_2014_16
			
			pctbirths_low_wt_blk_2007_09
			pctbirths_low_wt_blk_2008_10
			pctbirths_low_wt_blk_2009_11
			pctbirths_low_wt_blk_2010_12
			pctbirths_low_wt_blk_2011_13
			pctbirths_low_wt_blk_2012_14
			pctbirths_low_wt_blk_2013_15 
			pctbirths_low_wt_blk_2014_16
					
			pctbirths_low_wt_wht_2007_09 
			pctbirths_low_wt_wht_2008_10 
			pctbirths_low_wt_wht_2009_11 
			pctbirths_low_wt_wht_2010_12 
			pctbirths_low_wt_wht_2011_13 
			pctbirths_low_wt_wht_2012_14 
			pctbirths_low_wt_wht_2013_15 
			pctbirths_low_wt_wht_2014_16 ;

run;

ods tagsets.excelxp options( sheet_name="Births by Race Inad Prenat Care");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography
			pct_inadcare_b: pct_inadcare_a: pct_inadcare_w: pct_inadcare_h: pct_inadcare_o:;
run;

ods tagsets.excelxp options( sheet_name="Crime Rates");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography
			violent_crime_rate_: property_crime_rate_:;
run;

ods tagsets.excelxp options( sheet_name="Education");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography
			PctHS&_years.
			PctCol&_years.
			PctWoutHS&_years.;
run;


ods tagsets.excelxp options( sheet_name="Age");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography
			pctu18:
			pct18_34:
			pct35_64:
			pcto65:;
run;


ods tagsets.excelxp options( sheet_name="Burden by Income");
proc print data= compile_mvt_tabs_full label noobs;
  var	geography
			grossrentunder500&_years. 
			grossrent500_750&_years. 
			grossrent750_1000&_years. 
			grossrent1000_1250&_years.
			grossrent1250_1500&_years.
			grossrentover1500&_years.;
run;

ods tagsets.excelxp options( sheet_name="Income Categories");
proc print data= compile_mvt_tabs_full label noobs;
var geography 
			pct_hshldincunder10000_2012_16 
			pct_hshldincunder25000_2012_16 
			pct_hshldinc25000to49999_2012_16 
			pct_hshldinc50000to74999_2012_16 
			pct_hshldinc75000124999_2012_16 
			pct_hshldinc125000plus_2012_16; 
run; 


ods tagsets.excelxp close;
ods listing;
run;


proc export data=mvt_tabs
	outfile="&_dcdata_default_path\MVT\Prog\mvt_tabs..csv"
	dbms=csv replace;
	run;*/



