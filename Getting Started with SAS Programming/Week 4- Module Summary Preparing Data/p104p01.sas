***********************************************************;
*  LESSON 4, PRACTICE 1                                   *;
*    a) Open the pg1.eu_occ table and examine the column  *;
*       names and values.                                 *;
*    b) Modify the code to create a temporary table named *;
*       EU_OCC2016 and read PG1.EU_OCC.                   *;
*    c) Complete the WHERE statement to select only the   *;
*       stays that were reported in 2016. Notice that     *;
*       YearMon is a character column and the first four  *;
*       positions represent the year.                     *;
*    d) Complete the FORMAT statement in the DATA step to *;
*       apply the COMMA17. format to the Hotel,           *;
*       ShortStay, and Camp columns.                      *;
*    e) Complete the DROP statement to exclude Geo from   *;
*       the output table.                                 *;
***********************************************************;


data EU_OCC2016;
	set PG1.EU_OCC ;
	where YearMon LIKE '2016%';
	format Hotel ShortStay Camp COMMA17.;
	drop Geo ;
run;

