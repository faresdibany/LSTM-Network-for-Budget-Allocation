%this code extracts all weeks from the year. It extracts them and calls
%them years and saves them to mat files. 
Table = readtable('Electricity.csv');
Table1 = Table(:,2);
Electric_consumption = table2array(Table1)';
Year = Electric_consumption(1:8736);
n = 168;
 for i=1:floor(numel(Year)/n),
    eval(sprintf('Year%d=Year(%d:%d);',i,(i-1)*n+1,i*n));
 end
 
 %To obtain weeks and months on a daily basis if needed, instead of an
 %hourly basis
 w1_Sunday = sum(Year1(:,1:24));
 w1_Monday = sum(Year1(:,25:48));
 w1_Tuesday = sum(Year1(:,49:72));
 w1_Wednesday = sum(Year1(:,73:96));
 w1_Thursday = sum(Year1(:,96:119));
 w1_Friday = sum(Year1(:,120:143));
 w1_Saturday = sum(Year1(:,144:168));
 
 w1_daily_basis = [w1_Sunday w1_Monday w1_Tuesday w1_Wednesday w1_Thursday w1_Friday w1_Saturday];
 
  w1_Sunday = sum(Year1(:,1:24));
 w1_Monday = sum(Year1(:,25:48));
 w1_Tuesday = sum(Year1(:,49:72));
 w1_Wednesday = sum(Year1(:,73:96));
 w1_Thursday = sum(Year1(:,96:119));
 w1_Friday = sum(Year1(:,120:143));
 w1_Saturday = sum(Year1(:,144:168));
 
 w1_daily_basis = [w1_Sunday w1_Monday w1_Tuesday w1_Wednesday w1_Thursday w1_Friday w1_Saturday];
 
  w1_Sunday = sum(Year1(:,1:24));
 w1_Monday = sum(Year1(:,25:48));
 w1_Tuesday = sum(Year1(:,49:72));
 w1_Wednesday = sum(Year1(:,73:96));
 w1_Thursday = sum(Year1(:,96:119));
 w1_Friday = sum(Year1(:,120:143));
 w1_Saturday = sum(Year1(:,144:168));
 
 w1_daily_basis = [w1_Sunday w1_Monday w1_Tuesday w1_Wednesday w1_Thursday w1_Friday w1_Saturday];
 
 w2_Sunday = sum(Year2(:,1:24));
 w2_Monday = sum(Year2(:,25:48));
 w2_Tuesday = sum(Year2(:,49:72));
 w2_Wednesday = sum(Year2(:,73:96));
 w2_Thursday = sum(Year2(:,96:119));
 w2_Friday = sum(Year2(:,120:143));
 w2_Saturday = sum(Year2(:,144:168));
 
 w2_daily_basis = [w2_Sunday w2_Monday w2_Tuesday w2_Wednesday w2_Thursday w2_Friday w2_Saturday];
 
 w3_Sunday = sum(Year3(:,1:24));
 w3_Monday = sum(Year3(:,25:48));
 w3_Tuesday = sum(Year3(:,49:72));
 w3_Wednesday = sum(Year3(:,73:96));
 w3_Thursday = sum(Year3(:,96:119));
 w3_Friday = sum(Year3(:,120:143));
 w3_Saturday = sum(Year3(:,144:168));
 
 w3_daily_basis = [w3_Sunday w3_Monday w3_Tuesday w3_Wednesday w3_Thursday w3_Friday w3_Saturday];
 
 w4_Sunday = sum(Year4(:,1:24));
 w4_Monday = sum(Year4(:,25:48));
 w4_Tuesday = sum(Year4(:,49:72));
 w4_Wednesday = sum(Year4(:,73:96));
 w4_Thursday = sum(Year4(:,96:119));
 w4_Friday = sum(Year4(:,120:143));
 w4_Saturday = sum(Year4(:,144:168));
 
 w4_daily_basis = [w4_Sunday w4_Monday w4_Tuesday w4_Wednesday w4_Thursday w4_Friday w4_Saturday];
 
 January_daily_basis = [w1_daily_basis w2_daily_basis w3_daily_basis w4_daily_basis];%repeat the process for all weeks and months if necessary