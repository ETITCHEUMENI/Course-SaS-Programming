***********************************************************;
*  Activity 4.04                                          *;
*    1) Add an assignment statement to create StormLength *;
*       that represents the number of days between        *;
*       StartDate and EndDate.                            *;
*    2) Run the program. In 1980, how long did the storm  *;
*       named Agatha last?                                *;
***********************************************************;
LIBNAME PG1 "/home/u62603732/EPG1V2/data";

data storm_length;
	set pg1.storm_summary;
	drop Hem_EW Hem_NS Lat Lon;
	*Add assignment statement;
	StormLength= EndDate-StartDate+1;	
run;
