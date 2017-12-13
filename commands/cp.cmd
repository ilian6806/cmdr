if "%1"=="-R" (
    xcopy %2 %3 %4
) else (
    copy %1 %2 %3
)