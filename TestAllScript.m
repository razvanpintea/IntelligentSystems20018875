clc;
clear;
load('BoostedTrees.mat') %loads the trained Rational Quadratic Gausian Process Regression model
load('dermatology.train.txt') %loads the training set(not used in code but for informational matters)
MatrixTestAll=load('dermatology.test.TXT'); % loads the testing set
actual=1:1:100; %creates array for expected values
for a=1:100
actual(a)=MatrixTestAll(a,35);%fills each element of the "actual" array with the expected response value
end
MatrixTestAll(:,35)=[];%deletes the response variable from the Matrix in order to make it usable for predictions

predict=1:1:100; %creates array for predicted values
for c=1:100 %itterate through each row of the matrix containing the testing partition
predict(c)=round(BoostedTrees.predictFcn(MatrixTestAll(c,:))); %predicts response value, rounds it to closest integer and fills the "predict" array with it
end
accuracy=0; %initialises the accuracy of the model
for b=1:100
    if actual(b)==predict(b)
        accuracy=accuracy+1;
    end
end %if the element in the "actual" array is equal to the corresponding element in the "predict" array, 1 is added to the accuracy
accuracy %prints the accuracy obtained