***********************************************************;
*  LESSON 4, PRACTICE 4                                   *;
*    a) Create a new column named SqMiles by multiplying  *;
*       Acres by .0015625.                                *;
*    b) Create a new column named Camping as the sum of   *;
*       OtherCamping, TentCampers, RVCampers, and         *;
*       BackcountryCampers.                               *;
*    c) Format SqMiles and Camping to include commas and  *;
*       zero decimal places.                              *;
*    d) Modify the KEEP statement to include the new      *;
*       columns. Run the program.                         *;
***********************************************************;
	

data np_summary_update;
	set pg1.np_summary;
	keep Reg ParkName DayVisits OtherLodging Acres SqMiles Camping;
	*Add assignment statements;
	SqMiles=Acres*.0015625;
	Camping= sum(OtherCamping, TentCampers ,RVCampers ,BackcountryCampers);	
	FORMAT SqMiles comma6. Camping comma 10.;
run;


data np_summary_update;
    set pg1.np_summary;
    keep Reg ParkName DayVisits OtherLodging Acres 
         SqMiles Camping;
    SqMiles=Acres*.0015625;
    Camping=sum(OtherCamping,TentCampers,
                RVCampers,BackcountryCampers);
    format SqMiles comma6. Camping comma10.;  
run;



data np_summary_update;
set pg1.np_summary;
keep Reg ParkName DayVisits OtherLodging Acres; 
WHERE ParkName like "CA%";
run;