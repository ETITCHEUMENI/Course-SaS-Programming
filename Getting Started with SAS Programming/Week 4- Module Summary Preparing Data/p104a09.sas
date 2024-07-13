***********************************************************;
*  Activity 4.09                                          *;
*    Run the program. Why does the program fail?          *;
***********************************************************;

data front rear;
    set sashelp.cars;
    if DriveTrain="Front" then do;
        DriveTrain="FWD";
        output front;
    else if DriveTrain='Rear' then do;
        DriveTrain="RWD";
        output rear;
run;

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