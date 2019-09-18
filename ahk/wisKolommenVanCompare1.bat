@Echo off
(for /f "delims=" %%A in (../logfiles/compare1.txt) do Call :Split %%A) > ../logfiles/compare1-split.txt

goto :Eof
:Split
Echo(	%1,%2	%3	%4	%5	%6 %7 %8)


