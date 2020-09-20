function varargout = cobaMaul(varargin)
% COBAMAUL MATLAB code for cobaMaul.fig
%      COBAMAUL, by itself, creates a new COBAMAUL or raises the existing
%      singleton*.
%
%      H = COBAMAUL returns the handle to a new COBAMAUL or the handle to
%      the existing singleton*.
%
%      COBAMAUL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COBAMAUL.M with the given input arguments.
%
%      COBAMAUL('Property','Value',...) creates a new COBAMAUL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cobaMaul_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cobaMaul_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cobaMaul

% Last Modified by GUIDE v2.5 14-Jul-2019 00:24:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cobaMaul_OpeningFcn, ...
                   'gui_OutputFcn',  @cobaMaul_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before cobaMaul is made visible.
function cobaMaul_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cobaMaul (see VARARGIN)

% Choose default command line output for cobaMaul
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cobaMaul wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cobaMaul_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in openBatik.
function openBatik_Callback(hObject, eventdata, handles)
% hObject    handle to openBatik (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% global img;
% 
% [filename,path] = uigetfile({'*.*'},'Pilih file citra ');
% inputCitra = [path,filename];
% img = imread(inputCitra);
% axes(handles.axes1);
% imshow(img);

handles.input = hObject;
handles.output = hObject;
[filename pathname] = uigetfile('*.jpg', 'Pilih citra');
global image;
image = imread([pathname, filename]);
guidata(hObject, handles);
axes(handles.axes1);
imshow(image);

% --- Executes on button press in kenalan.
function kenalan_Callback(hObject, eventdata, handles)
% hObject    handle to kenalan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global image;

% Load trained model

% svmMdl_RBF = loadCompactModel('SVMModel_2_RBF');
svmMdl_Polynomial = loadCompactModel('SVMModel_1_Polynomial');


% Testing model
% 1. Load image
% image = imread(img);
imgResize = imresize(image,[128,128]);

    LABImage = EF_LabConv(imgResize);
    
    %% Quantitize Edge Detection
    interval_number = 18; %kuantisasi interval number menjadi 18 bin
    EdgeBin= EF_EdgeDetectionLab(LABImage, interval_number);
    %% Color Quantitation
    
    % parameter kuantisasi bin warna pada image L*a*b
    L_bin = 10;
    a_bin = 3;
    b_bin = 3;
    
    ColorBin = EF_ColorQuantization(LABImage, L_bin, a_bin, b_bin);
    
    %% Color Difference Histogram
    param_L = L_bin;
    param_A = a_bin;
    param_B = b_bin;
    
    param_edge = interval_number;
    
    CDH = EF_ComputeCDH(LABImage, ColorBin, EdgeBin, 1,...
        param_L* param_A* param_B,param_edge);
    EkstrasiCDH1(:)=CDH;
    

%%
offsets=[0 1; -1 1;-1 0;-1 -1];

    grayImage = rgb2gray(imgResize);
    %     glcmfeature2{i,:} = glcm2(grayImage);
    [glcms,SI] = graycomatrix(grayImage,'Offset',offsets);
    stats=graycoprops(glcms,{'All'});
    glcmfeatureeks1{:}=stats;
    %imshow(rescale(SI))
    listGLCM{:} =SI;

featuresGLCM1 = cell2mat(glcmfeatureeks1);


%%
concatGLCMCDH1=EkstrasiCDH1;
for i=1:size(concatGLCMCDH1,1)
    k=109;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH1(i,k)=featuresGLCM1(i,1).Contrast(1,j);
        k=k+1;
    end
    
    k=113;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH1(i,k)=featuresGLCM1(i,1).Correlation(1,j);
        k=k+1;
    end
    
    k=117;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH1(i,k)=featuresGLCM1(i,1).Energy(1,j);
        k=k+1;
    end
    
    k=121;
    for j=1:size(featuresGLCM1(i,1).Contrast,2)
        concatGLCMCDH1(i,k)=featuresGLCM1(i,1).Homogeneity(1,j);
        k=k+1;
    end
end
    

%  Testextracted_feature1 = [concatGLCMCDH1 label];
%%
% % 2. Extract CDH dan GLCM Features
fitur = concatGLCMCDH1;
% 
% % 3. Predict image
% predict_Linear = svmMdl_Linear.predict(fitur);
%predict_RBF = svmMdl_RBF.predict(fitur);
svmMdl_Polynomial = svmMdl_Polynomial.predict(fitur);


if (svmMdl_Polynomial == 1)
    label = 'Bandung';
elseif (svmMdl_Polynomial == 2)
    label = 'Bogor';
elseif (svmMdl_Polynomial == 3)
    label = 'Ciamis';
elseif (svmMdl_Polynomial == 4)
    label = 'Cimahi';
elseif (svmMdl_Polynomial == 5)
    label = 'Cirebon';
elseif (svmMdl_Polynomial == 6)
    label = 'Garut';    
elseif (svmMdl_Polynomial == 7)
    label = 'Indramayu'; 
elseif (svmMdl_Polynomial == 8)
    label = 'KabBandung';
elseif (svmMdl_Polynomial == 9)
    label = 'KabCirebon';
elseif (svmMdl_Polynomial == 10)
    label = 'KabTasikmalaya';
elseif (svmMdl_Polynomial == 11)
    label = 'Kuningan';
elseif (svmMdl_Polynomial == 12)
    label = 'Majalengka';
elseif (svmMdl_Polynomial == 13)
    label = 'Sumedang';    
elseif (svmMdl_Polynomial == 14)
    label = 'Tasikmalaya';
end
axes(handles.axes1);
imshow(image);

set(handles.textHasil,'String',label);


% --- Executes on button press in deleteButton.
function deleteButton_Callback(hObject, eventdata, handles)
% hObject    handle to deleteButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);
cla(handles.axes2);
set(handles.textHasil,'String','');
set(handles.teksHasilASAL,'String','');


% --- Executes on button press in KenaliASAL.
function KenaliASAL_Callback(hObject, eventdata, handles)
% hObject    handle to KenaliASAL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in KenaliMotif.
function KenaliMotif_Callback(hObject, eventdata, handles)
% hObject    handle to KenaliMotif (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image2;

svmMdl_RBF = loadCompactModel('SVMModel_2_RBF');
% svmMdl_Polynomial = loadCompactModel('SVMModel_2_Polynomial');


% Testing model
% 1. Load image
% image = imread(img);
imgResize = imresize(image2,[128,128]);

    LABImage = EF_LabConv(imgResize);
    
    %% Quantitize Edge Detection
    interval_number = 18; %kuantisasi interval number menjadi 18 bin
    EdgeBin= EF_EdgeDetectionLab(LABImage, interval_number);
    %% Color Quantitation
    
    % parameter kuantisasi bin warna pada image L*a*b
    L_bin = 10;
    a_bin = 3;
    b_bin = 3;
    
    ColorBin = EF_ColorQuantization(LABImage, L_bin, a_bin, b_bin);
    
    %% Color Difference Histogram
    param_L = L_bin;
    param_A = a_bin;
    param_B = b_bin;
    
    param_edge = interval_number;
    
    CDH = EF_ComputeCDH(LABImage, ColorBin, EdgeBin, 1,...
        param_L* param_A* param_B,param_edge);
    EkstrasiCDH2(:)=CDH;
    

%%
offsets=[0 1; -1 1;-1 0;-1 -1];

    grayImage = rgb2gray(imgResize);
    %     glcmfeature2{i,:} = glcm2(grayImage);
    [glcms,SI] = graycomatrix(grayImage,'Offset',offsets);
    stats=graycoprops(glcms,{'All'});
    glcmfeatureeks2{:}=stats;
    %imshow(rescale(SI))
    listGLCM{:} =SI;

featuresGLCM2 = cell2mat(glcmfeatureeks2);


%%
concatGLCMCDH2=EkstrasiCDH2;
for i=1:size(concatGLCMCDH2,1)
    k=109;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH2(i,k)=featuresGLCM2(i,1).Contrast(1,j);
        k=k+1;
    end
    
    k=113;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH2(i,k)=featuresGLCM2(i,1).Correlation(1,j);
        k=k+1;
    end
    
    k=117;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH2(i,k)=featuresGLCM2(i,1).Energy(1,j);
        k=k+1;
    end
    
    k=121;
    for j=1:size(featuresGLCM2(i,1).Contrast,2)
        concatGLCMCDH2(i,k)=featuresGLCM2(i,1).Homogeneity(1,j);
        k=k+1;
    end
end
    

%  Testextracted_feature1 = [concatGLCMCDH1 label];
%%
% % 2. Extract CDH dan GLCM Features
fitur2 = concatGLCMCDH2;
% 
% % 3. Predict image
% predict_Linear = svmMdl_Linear.predict(fitur);
predict_RBF = svmMdl_RBF.predict(fitur2);
% predict_Polynomial = svmMdl_Polynomial.predict(fitur);

if (predict_RBF == 1)
    label2 = 'Anyaman Bambu';
elseif (predict_RBF == 2)
    label2 = 'Ayam Alas';
elseif (predict_RBF == 3)
    label2 = 'Balimbing Seling Ombak Banyu';
elseif (predict_RBF == 4)
    label2 = 'Bango Rawa';
elseif (predict_RBF == 5)
    label2 = 'Banji Tepak';
elseif (predict_RBF == 6)
    label2 = 'Banyak Ngantrang';    
elseif (predict_RBF == 7)
    label2 = 'Binari Kawung'; 
elseif (predict_RBF == 8)
    label2 = 'Bouroq';
    elseif (predict_RBF == 9)
    label2 = 'Buah Maja';
elseif (predict_RBF == 10)
    label2 = 'Buket Teratai';
elseif (predict_RBF == 11)
    label2 = 'Buku_Tiwu';
elseif (predict_RBF == 12)
    label2 = 'Ciawi Tali';
elseif (predict_RBF == 13)
    label2 = 'Ciung Wanara';    
elseif (predict_RBF == 14)
    label2 = 'Cupat Manggu'; 
elseif (predict_RBF == 15)
    label2 = 'Cupat_Manggu_Kuning';
    elseif (predict_RBF == 16)
    label2 = 'Cupat Manggu Putih';
elseif (predict_RBF == 17)
    label2 = 'Curug_Kerikil';
elseif (predict_RBF == 18)
    label2 = 'Curug Penganten';
elseif (predict_RBF == 19)
    label2 = 'Daun Sampeu Pinuh';
elseif (predict_RBF == 20)
    label2 = 'Daun Taleus';    
elseif (predict_RBF == 21)
    label2 = 'Daun Taleus Hitam'; 
elseif (predict_RBF == 22)
    label2 = 'Doblang';
    elseif (predict_RBF == 23)
    label2 = 'Drintin';
elseif (predict_RBF == 24)
    label2 = 'Gaganjar';
elseif (predict_RBF == 25)
    label2 = 'Gaganjar_Merah';
elseif (predict_RBF == 26)
    label2 = 'Gajah Payung';
elseif (predict_RBF == 27)
    label2 = 'Gambir Saketi';    
elseif (predict_RBF == 28)
    label2 = 'Gambir Saketi Daun'; 
elseif (predict_RBF == 29)
    label2 = 'Ganggengan';
elseif (predict_RBF == 46)
    label2 = 'Keris Apel';
elseif (predict_RBF == 52)
    label2 = 'Kujang Kijang Merah Biru';
elseif (predict_RBF == 61)
    label2 = 'Lereng Pakis(1)';
elseif (predict_RBF == 73)
    label2 = 'Parang Sontak';   
elseif (predict_RBF == 74)
    label2 = 'Patran Kangkung';

end
axes(handles.axes2);
imshow(image2);

set(handles.teksHasilASAL,'String',label2);

% --- Executes on button press in LoadMotif.
function LoadMotif_Callback(hObject, eventdata, handles)
% hObject    handle to LoadMotif (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.input = hObject;
handles.output = hObject;
[filename pathname2] = uigetfile('*.jpg', 'Pilih citra');
global image2;
image2 = imread([pathname2, filename]);
guidata(hObject, handles);
axes(handles.axes2);
imshow(image2);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
