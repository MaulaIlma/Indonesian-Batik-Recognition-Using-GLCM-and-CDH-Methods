clear;
clc;
close all;

% Load trained model
svmMdl_Linear = loadCompactModel('SVMModel_1_Linear');
svmMdl_RBF = loadCompactModel('SVMModel_1_RBF');
svmMdl_Polynomial = loadCompactModel('SVMModel_1_Polynomial');
% Testing model
% 1. Load image
load ('Testextracted_feature1.mat')
fitur = Testextracted_feature1(:,1:124);
labeltest = Testextracted_feature1(:,125);
 
% % 3. Predict image
%  predict_Linear = svmMdl_Linear.predict(fitur);
%   predict_RBF = svmMdl_RBF.predict(fitur);
predict_Polynomial = svmMdl_Polynomial.predict(fitur);

%%
%Confusion Matrix
confusionMat = confusionmat(predict_Polynomial, labeltest);

%%
tpn=sum(diag(confusionMat));
tp=diag(confusionMat)';
for i=1:size(confusionMat,1)
        tn(i)=tpn-tp(i);
        tn_sum = sum(tn);
        fn(i)=sum(confusionMat(i,:))-confusionMat(i,i);
        fn_sum = sum(fn);
        fp(i)=sum(confusionMat(:,i))-confusionMat(i,i);
        fp_sum = sum(fp);
end

tn_sum = sum(tn);
fn_sum = sum(fn);
fp_sum = sum(fp);

for i=1:size(confusionMat,1)
    acc(i)=((tp(i)+tn(i))/(tp(i)+fp(i)+fn(i)+tn(i)))*100;
    prec(i)=(tp(i)/(tp(i)+fp(i)))*100;
    recall(i)=(tp(i)/(tp(i)+fn(i)))*100;
    fscor(i)=(recall(i)*prec(i)*2)/(recall(i)+prec(i));
end

av_prec = sum(prec)/size(confusionMat,1);
av_recall = sum (recall)/size(confusionMat,1);
av_fscor =sum(fscor)/size(confusionMat,1);
% disp('Accuracy(%)  Precision(%)   Sensitivity(%)  Specificity(%)   F1-score')
% all=[acc' prec' sen' spec' fscor']

disp('Overall Acc(%)')
acc=tpn/sum(sum(confusionMat))*100
%%
%Menghitung akurasi 
% acc_Linear = numel (find(predict_Linear==labeltest))/length(labeltest);
% disp(['Accuracy_Linear = ',num2str(acc_Linear*100)]);
% % 
% %   acc_RBF = numel (find(predict_RBF==labeltest))/length(labeltest);
% disp(['Accuracy_RBF = ',num2str(acc_RBF*100)]);
% 
acc_Polynomial = numel (find(predict_Polynomial==labeltest))/length(labeltest);
disp(['Accuracy_Polynomial = ',num2str(acc_Polynomial*100)]);