%This code works for the hourly basis, if you want to predict by the hour. 
%all other codes are the same, but only have the data used changed. for
%comments, please refer to this file and adapt it to other codes 

Table = readtable('Electricity.csv');
Table = Table(:,2);
Electric_consumption = table2array(Table)';
Electric_consumption = Electric_consumption(1:300);

figure
plot(Electric_consumption)
xlabel("Hours")
ylabel("Consumption")
title("Electric Consumption Every Hour in a Year")
%%
%determining the training timestep 
Training_timestep = floor(0.9*numel(Electric_consumption));
%sizing the training and testing data. I have done the training data to end
%after the timestep by 1, because lstm testing has to begin with the last training point. 
Training_data = Electric_consumption(1:Training_timestep+1);
Testing_data = Electric_consumption(Training_timestep+1:end);
%%
%standardizing the training and testing data 
mu = mean(Training_data);
sigma = std(Training_data);
Standardized_Training_data = (Training_data - mu) / sigma;

figure 
plot(Standardized_Training_data)
xlabel("Hours")
ylabel("Standardized Consumption")
title("Monthly Consumption")

%%
%defining standardized predictors and responses 
Training_Predictors = Standardized_Training_data(1:end-1);
Training_Responses = Standardized_Training_data(2:end);
Standardized_Testing_data = (Testing_data - mu) / sigma;

figure 
plot(Standardized_Testing_data)
xlabel("Hours")
ylabel("Consumption")
title("Monthly Consumption")

Testing_Predictors = Standardized_Testing_data(1:end-1);
Testing_Responses = Testing_data(2:end);
%%
%you can change the featurs of the lstm layer from here, or you define the
%layer as in the commented section below
numFeatures = 1;
numResponses = 1;
numHiddenUnits = 200;

% layer = lstmLayer(numHiddenUnits, 'OutputMode', 'sequence','InputWeightsInitializer','ones',...
%     'BiasInitializer','ones') %defining the lstm layer if you want to
%     initialize the weights and biases as the same values everytime, or
%     want other options for the layer. If you define the layer, change
%     'lstmLayer' to 'layer' in the following layers array. 
%defining the layers for the lstm net
layers = [ ...
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits)
    fullyConnectedLayer(numResponses)
    regressionLayer];
%%
%as it says, this is the defining of the training options you would like to
%new training options are set, such as minibatchsize, validation frequency
%and patience
options = trainingOptions('adam', ...
    'MaxEpochs',250, ...
    'GradientThreshold',1, ...
    'InitialLearnRate',0.005, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',125, ...
    'LearnRateDropFactor',0.2, ...
    'Verbose',0, ...
    'Plots','training-progress',...
    'MiniBatchSize',64,...
    'ValidationFrequency',50,...
    'ValidationPatience',Inf);
%%
%defining what you want the network to do
net = trainNetwork(Training_Predictors,Training_Responses,layers,options);%training the network

net = predictAndUpdateState(net,Training_Predictors);%initializing the network by predicting the training predictors
[net,Predicted_Responses] = predictAndUpdateState(net,Training_Responses(end));%making the first prediction using the last time step of training predictors

numTimeStepsTest = numel(Testing_Predictors);%looping over the remaining predictions and inputing the previous prediction into predict and update
for i = 2:numTimeStepsTest
    [net,Predicted_Responses(:,i)] = predictAndUpdateState(net,Predicted_Responses(:,i-1),'ExecutionEnvironment','cpu');
end

Predicted_Responses = sigma*Predicted_Responses + mu;%returning the standardized back to normal


rmse = sqrt(mean((Predicted_Responses-Testing_Responses).^2))%calculating the root mean square error

figure
plot(Training_data(1:end-1))
hold on
idx = Training_timestep:(Training_timestep+numTimeStepsTest);
plot(idx,[Electric_consumption(Training_timestep) Predicted_Responses],'.-')
hold off
xlabel("Hours")
ylabel("Consumption")
title("Forecast")
legend(["Observed" "Forecast"])

figure
subplot(2,1,1)
plot(Testing_Responses)
hold on
plot(Predicted_Responses,'.-')
hold off
legend(["Observed" "Forecast"])
ylabel("Consumption")
title("Forecast")

subplot(2,1,2)
stem(Predicted_Responses - Testing_Responses)
xlabel("Hours")
ylabel("Error")
title("RMSE = " + rmse)

%saving training info as a struct, to extract rmse, and plot it. 
[net,info] = trainNetwork(Training_Predictors,Training_Responses,layers,options);
RMSE = info.TrainingRMSE;
plot(RMSE);

