***********************************************************;
*  Activity 7.01                                          *;
*    1) What are the similarities and differences in the  *;
*       syntax of the two steps?                          *;
*    2) Run the program. What are the similarities and    *;
*       differences in the results?                       *;
***********************************************************;

%LET outpath= /home/u62603732/EPG1V2/output;

LIBNAME PG1 "/home/u62603732/EPG1V2/data";


title "PROC PRINT Output";
proc print data=pg1.class_birthdate;
	var Name Age Height Birthdate;
	format Birthdate date9.;
run;

title "PROC SQL Output";
proc sql;
select Name, Age, Height*2.54 as HeightCM format=5.1, Birthdate format=date9.
    from pg1.class_birthdate;
quit;

title;


/* 1) Similarity: both of them use pg1.class_birthdate as input data.  */
/* they have similar selected var names and format. */
/*  */
/* 2)Differences: proc SQL use asignation of Height as HeightCM. */
/* The title of each procedure are different. */
/* the syntax are also différent.  */
/*  */
/* After runing the both codes. They have the same result except the different title.  */
/* The obs colum appear in proc print and Heigh appear as  HeightCM in proc SQL result */
