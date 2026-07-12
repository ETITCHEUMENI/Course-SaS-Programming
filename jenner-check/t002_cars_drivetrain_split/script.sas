***********************************************************;
*  Activity 4.09                                          *;
*    Run the program. Why does the program fail?          *;
***********************************************************;

/* correct */
data front rear;
    set sashelp.cars;
    if DriveTrain="Front" then do
        DriveTrain="FWD";
        output front;
        end;
    else if DriveTrain='Rear' then do
        DriveTrain="RWD";
        output rear;
        end;
run;

proc print data=front(obs=5);
    var Make Model DriveTrain;
run;

proc print data=rear(obs=5);
    var Make Model DriveTrain;
run;
