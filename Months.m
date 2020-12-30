load('week1.mat'); load('week2.mat'); load('week3.mat');load('week4.mat');
load('week5.mat');load('week6.mat');load('week7.mat');load('week8.mat');
load('week52.mat');load('week31.mat');load('week30.mat');load('week9.mat');
load('week51.mat');load('week32.mat');load('week29.mat');load('week10.mat');
load('week50.mat');load('week33.mat');load('week28.mat');load('week11.mat');
load('week49.mat');load('week34.mat');load('week27.mat');load('week12.mat');
load('week48.mat');load('week35.mat');load('week26.mat');load('week13.mat');
load('week47.mat');load('week36.mat');load('week25.mat');load('week14.mat');
load('week46.mat');load('week37.mat');load('week24.mat');load('week15.mat');
load('week45.mat');load('week38.mat');load('week23.mat');load('week16.mat');
load('week44.mat');load('week39.mat');load('week22.mat');load('week17.mat');
load('week43.mat');load('week40.mat');load('week21.mat');load('week18.mat');
load('week42.mat');load('week41.mat');load('week20.mat');load('week19.mat');

Extra = Year49(1:56); %extra two days and a few hours to account for the 29th and 30th day of the month, assuming all months are about 30 days here.

%combinations of the weeks to form the months. They are just called years
%here, because the loop to extract weeks from the data saves them as mat
%files named years, but you can rename them. 
January = [Year1 Extra Year2  Year3  Year4];
Jan_avg = mean(January); %getting the monthly average consumption, in case you want to predict the average of a month
February = [Year5 Extra Year6 Year7 Year8];
Feb_avg = mean(February);
March = [Year9 Year10 Extra Year11 Year12];
Mar_avg = mean(March);
April = [Year13 Year14 Extra Year15 Year16];
Apr_avg = mean(April);
May = [Year17 Year18 Year19 Extra Year20];
May_avg = mean(May);
June = [Year21 Year22 Year23 Extra Year24];
Jun_avg = mean(June);
July = [Year25 Year26 Year27 Extra Year28];
Jul_avg = mean(July);
August = [Year29 Year30 Year31 Extra Year32];
Aug_avg = mean(August);
September = [Year33 Year34 Year35 Extra Year36];
Sep_avg = mean(September);
October = [Year37 Year38 Year39 Extra Year40];
Oct_avg = mean(October);
November = [Year41 Year42 Year43 Extra Year44];
Nov_avg = mean(November);
December = [Year45 Year46 Year47 Extra Year48];
Dec_avg = mean(December);

