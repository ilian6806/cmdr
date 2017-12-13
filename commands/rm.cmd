if "%1"=="-R" (
    call %~dp0/deltree %2
) else (
    del %1 %2 %3 %4 %5 %6 %7 %8 %9
)