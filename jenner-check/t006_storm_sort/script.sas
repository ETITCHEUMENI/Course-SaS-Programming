***********************************************************;
*  Activity 3.07                                          *;
*    1) Modify the OUT= option in the PROC SORT statement *;
*       to create a temporary table named STORM_SORT.     *;
*    2) Complete the WHERE and BY statements to answer    *;
*       the following question: Which storm in the North  *;
*       Atlantic basin (NA or na) had the strongest       *;
*       MaxWindMPH?                                       *;
***********************************************************;

/* mock stand-in for PG1.STORM_SUMMARY (course data not shipped in the repo) */
data storm_summary;
	length Basin $2 Name $10 Type $2;
	input Season Name $ Basin $ Type $ MaxWindMPH MinPressure;
	datalines;
1998 Georges NA TS 155 940
1999 Bret na TS 125 951
2001 Iris NI HU 100 972
2005 Katrina NA HU 175 902
2005 Wilma NA HU 185 882
2008 Ike NA HU 145 935
2012 Sandy na TS 115 940
2015 Patricia EP HU 215 872
2017 Irma NA HU 180 914
2017 Maria NA HU 175 908
;
run;

proc sort data=storm_summary out=storm_sort;
	where Basin = 'NA' or Basin = 'na';
	by descending MaxWindMPH;
run;

proc print data=storm_sort;
	var Season Name Basin MaxWindMPH;
run;
