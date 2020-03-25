echo Hello van  buroblad en runt absolute pathen lokaal


echo van  = C:\Users\vth\Desktop\template2018\logfiles\compare1-split.txt
echo van  = C:\Users\vth\Desktop\template2018\logfiles\compare2-split.txt
echo output   = C:\Users\vth\Desktop\template2018\logfiles\uniek.txt
pause

@Echo off
cd \Users\vth\Desktop\template2018\logfiles\
python uniques.py  compare1-split.txt compare2-split.txt  > uniek.txt