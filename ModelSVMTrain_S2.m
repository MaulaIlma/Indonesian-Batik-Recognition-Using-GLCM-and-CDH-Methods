%% Load image data
clear;
clc;
close all;


load('extracted_feature_S2.mat');

%% Fit into knn classifier
% membuat partisi kfold cross validation
fitur_S2 = extracted_feature_S2(:,1:106);
labelTrain_S2 = extracted_feature_S2(:,107);
cv = cvpartition(labelTrain_S2, 'KFold', 10);

% train semua data untuk setiap partisi
for i = 1:cv.NumTestSets
    trainPartition = fitur_S2(cv.training(i),:);
    labelTrainPartition = labelTrain_S2(cv.training(i),:);
    testPartition = fitur_S2(cv.test(i),:);
    labelTestPartition = labelTrain_S2(cv.test(i),:);
    
    svmParams1 = templateSVM('KernelFunction','linear', 'KernelScale', 'auto', 'Standardize', 1);
    svmParams2 = templateSVM('KernelFunction','rbf', 'KernelScale', 'auto', 'Standardize', 1);
    svmParams3 = templateSVM('KernelFunction','polynomial', 'KernelScale', 'auto', 'Standardize', 1);
    
    svmMdl_Linear =fitcecoc(trainPartition, labelTrainPartition, 'Learners',svmParams1,'coding','onevsone');
    svmMdl_RBF =fitcecoc(trainPartition, labelTrainPartition, 'Learners',svmParams2,'coding','onevsone');
    svmMdl_Polynomial =fitcecoc(trainPartition, labelTrainPartition, 'Learners',svmParams3,'coding','onevsone');
   
    predict_1 = svmMdl_Linear.predict(testPartition);
    predict_2 = svmMdl_RBF.predict(testPartition);
    predict_3 = svmMdl_Polynomial.predict(testPartition);
    
    correctPredict_1 = predict_1 == labelTestPartition;
    correctPredict_2 = predict_2 == labelTestPartition;
    correctPredict_3 = predict_3 == labelTestPartition;
    
    confusionMat_1{i} = confusionmat(predict_1, labelTestPartition);
    confusionMat_2{i} = confusionmat(predict_2, labelTestPartition);
    confusionMat_3{i} = confusionmat(predict_3, labelTestPartition);
    
    accuracy_1(i) = sum(correctPredict_1) / size(labelTestPartition, 1);
    accuracy_2(i) = sum(correctPredict_2) / size(labelTestPartition, 1);
    accuracy_3(i) = sum(correctPredict_3) / size(labelTestPartition, 1);
end

% jumlah keseluruhan confusion matrix
sumConfusion = zeros(114,114);
for i = 1:size(confusionMat_1,114)
    sumConfusion = sumConfusion + confusionMat_1{i};
 end

% rata-rata akurasi
averageAcc_Linear = mean(accuracy_1);
averageAcc_RBF = mean(accuracy_2);
averageAcc_Polynomial = mean(accuracy_3);

disp(['averageAcc_Linear = ',num2str(averageAcc_Linear*100)]);
disp(['averageAcc_RBF = ',num2str(averageAcc_RBF*100)]);
disp(['averageAcc_Polynomial = ',num2str(averageAcc_Polynomial*100)]);

% save model
saveCompactModel(svmMdl_Linear, 'SVMModel_2_Linear_S2');
saveCompactModel(svmMdl_RBF, 'SVMModel_2_RBF_S2');
saveCompactModel(svmMdl_Polynomial, 'SVMModel_2_Polynomial_S2');