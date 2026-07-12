***********************************************************;
*  Processing Multiple Statements with IF-THEN/DO         *;
***********************************************************;
*  Demo (from p104d07.sas)                                *;
*       Modify the IF-THEN statements to use IF-THEN/DO   *;
*       syntax to write rows to either the indian,        *;
*       atlantic, or pacific table based on the value of  *;
*       Ocean. Highlight the DATA step and run the        *;
*       selected code.                                    *;
***********************************************************;

/* mock stand-in for PG1.STORM_SUMMARY (course data not shipped in the repo) */
data storm_summary;
	length Basin $2 Name $10;
	input Season Name $ Basin $ MaxWindMPH;
	datalines;
1998 Georges na 155
1999 Bret NA 125
2001 Iris ni 100
2005 Katrina NA 175
2005 Wilma sa 185
2008 Ike na 145
2012 Sandy NA 115
2015 Patricia ep 215
2017 Irma wp 180
2017 Maria si 175
;
run;

/* corrected IF-THEN/DO syntax per the activity's own instruction --
   the demo file's one-liner ("...and output indian;") chains an
   assignment with a statement using AND, which is not valid SAS */
data indian atlantic pacific;
	set storm_summary;
	length Ocean $ 8;
	keep Basin Season Name MaxWindMPH Ocean;
	Basin=upcase(Basin);
	OceanCode=substr(Basin,2,1);
	if OceanCode="I" then do;
		Ocean="Indian";
		output indian;
	end;
	else if OceanCode="A" then do;
		Ocean="Atlantic";
		output atlantic;
	end;
	else do;
		Ocean="Pacific";
		output pacific;
	end;
run;

proc print data=indian;
run;
proc print data=atlantic;
run;
proc print data=pacific;
run;
