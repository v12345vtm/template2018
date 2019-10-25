@Echo off
(for /f "delims=" %%A in (../temp/msoftpartlistsExporteren.txt) do Call :Split %%A) > ../temp/msoftpartlistsExporteren-split.txt

goto :Eof
:Split
Echo(	%1,%2	%3	%4	%5	%6 %7


