clear;
clc;
close all;

% original size image
listSubFolder = dir('Test\**\*.jpg');
% cropped size image
% listSubFolder = dir('data\cropped\**\*.JPG');
% mixed size image
% listSubFolder = dir('data\mixed\**\*.JPG');
label = zeros(size(listSubFolder,1),1);
imageData =cell(456,4);
imgResize=cell(456,4);

for i = 1:size(listSubFolder,1)
    imageData{i} = imread(fullfile(listSubFolder(i).folder, listSubFolder(i). name));
    imgResize{i} = imresize(imageData{i}, [128,128]);
    name = strsplit(listSubFolder(i). name, '-');
    
    
    if (isequal(name{1}, 'Bandung'))
        % assign label 1 for Bandung
        label(i,:) = 1;
    elseif (isequal(name{1}, 'Bogor'))
        % assign label 2 for Bogor
        label(i,:) = 2;
    elseif (isequal(name{1}, 'Ciamis'))
        % assign label 3 for Ciamis
        label(i,:) = 3;
    elseif (isequal(name{1}, 'Cimahi'))
        % assign label 4 for Cimahi
        label(i,:) = 4;
    elseif (isequal(name{1}, 'Cirebon'))
        % assign label 5 for Cirebon
        label(i,:) = 5;
    elseif (isequal(name{1}, 'Garut'))
        % assign label 6 for Garut
        label(i,:) = 6;
    elseif (isequal(name{1}, 'Indramayu'))
        % assign label 7 for Indramayu
        label(i,:) = 7;
    elseif (isequal(name{1}, 'KabBandung'))
        % assign label 8 for Kabupaten Bandung
        label(i,:) = 8;
    elseif (isequal(name{1}, 'KabCirebon'))
        % assign label 9 for Kabupaten Cirebon
        label(i,:) = 9;
    elseif (isequal(name{1}, 'KabTasikmalaya'))
        % assign label 10 for Kabupaten Tasikmalaya
        label(i,:) = 10;
    elseif (isequal(name{1}, 'Kuningan'))
        % assign label 11 for Kuningan
        label(i,:) = 11;
    elseif (isequal(name{1}, 'Majalengka'))
        % assign label 12 for Majalengka
        label(i,:) = 12;
    elseif (isequal(name{1}, 'Sumedang'))
        % assign label 13 for Sumedang
        label(i,:) = 13;
    elseif (isequal(name{1}, 'Tasikmalaya'))
        % assign label 14 for Tasikmalaya
        label(i,:) = 14;
    end
    disp([listSubFolder(i).name, ' loaded']);
end

save(fullfile('DataTest.mat'), 'imgResize', 'label');