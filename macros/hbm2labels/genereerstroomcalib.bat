rem "dit programma komt van pablo , en extract vanuit excel alles naar txt voor clipproject , in cipproject import nr32 stroomcandela voor je labels te zien"
rem  \\file01.letdeinze.lan\company\Letdata\data\06\0011_00\D1\060011_00-D1N32F.xlsx
set  excel=\\file01.letdeinze.lan\company\Letdata\data\06\0011_00\D1\060011_00-D1N32G.xlsx
echo %excel%
 

pause


hbm2labels.exe %excel% -o "stroomcalib.txt"

rem open excelbestand
%excel%  