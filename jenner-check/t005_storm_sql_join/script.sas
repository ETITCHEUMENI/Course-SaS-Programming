***********************************************************;
*  Joining Tables with PROC SQL                           *;
***********************************************************;
*  Demo (from p107d02.sas)                                *;
*    1) Open PG1.STORM_SUMMARY and PG1.STORM_BASINCODES   *;
*       and compare the columns. Identify the matching    *;
*       column.                                           *;
*    2) Add PG1.STORM_BASINCODES to the FROM clause to    *;
*       perform an inner join on Basin. Remember to       *;
*       qualify the columns as table-name.col-name in the *;
*       ON expression.                                    *;
*    3) Add the BasinName column to the query after       *;
*       Basin. Highlight the step, run the selected code, *;
*       and examine the log. Why does the program fail?   *;
*    4) Modify the query to qualify the Basin column in   *;
*       the SELECT clause. Highlight the step and run the *;
*       selected code.                                    *;
***********************************************************;

/* mock stand-in for PG1.STORM_SUMMARY (course data not shipped in the repo) */
data storm_summary;
	length Basin $2 Name $10;
	input Season Name $ Basin $ MaxWindMPH;
	datalines;
1998 Georges NA 155
1999 Bret NA 125
2001 Iris NI 100
2005 Katrina NA 175
2005 Wilma NA 185
2008 Ike NA 145
2012 Sandy NA 115
2015 Patricia EP 215
2017 Irma NA 180
2017 Maria NA 175
;
run;

/* mock stand-in for PG1.STORM_BASINCODES (course data not shipped in the repo) */
data storm_basincodes;
	length Basin $2 BasinName $20;
	infile datalines dlm=',';
	input Basin $ BasinName $;
	datalines;
NA,North Atlantic
SA,South Atlantic
WP,West Pacific
EP,East Pacific
SP,South Pacific
NI,North Indian
SI,South Indian
;
run;

proc sql;
select Season, Name, storm_summary.Basin, MaxWindMPH, BasinName
    from storm_summary inner join storm_basincodes
    on  storm_summary.Basin= storm_basincodes.Basin
    order by Season DESC, Name;
quit;
