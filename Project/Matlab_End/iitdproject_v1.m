                                                                                                                                                                                                                                                                                           function varargout = iitdproject_v1(varargin)
% IITDPROJECT_V1 M-file for iitdproject_v1.fig
%      IITDPROJECT_V1, by itself, creates a new IITDPROJECT_V1 or raises the existing
%      singleton*.
%
%      H = IITDPROJECT_V1 returns the handle to a new IITDPROJECT_V1 or the handle to
%      the existing singleton*.
%
%      IITDPROJECT_V1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IITDPROJECT_V1.M with the given input arguments.
%
%      IITDPROJECT_V1('Property','Value',...) creates a new IITDPROJECT_V1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before iitdproject_v1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to iitdproject_v1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help iitdproject_v1

% Last Modified by GUIDE v2.5 11-Apr-2014 23:26:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @iitdproject_v1_OpeningFcn, ...
                   'gui_OutputFcn',  @iitdproject_v1_OutputFcn, ...
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


% --- Executes just before iitdproject_v1 is made visible.
function iitdproject_v1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to iitdproject_v1 (see VARARGIN)
%Print Hello world to command window
% Choose default command line output for iitdproject_v1
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes iitdproject_v1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = iitdproject_v1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonIIT D proj1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%obj = imaq.VideoDevice('linuxvideo', 1);
%im2right = step(obj);
im1left = imread('http://192.168.0.102:8080/get_image?webcam=2');
im2right  = imread('http://192.168.0.102:8080/get_image?webcam=1');  %Kindly ensure that either RasPi has this address or you change this address to correct RasPi address. Also start the server on RasPi

im2right = imcrop(im2right, [0 0 640 470]);
im1left = imcrop(im1left, [0 10 640 480]);
axes(handles.axes1);
imshow(im2right);
imwrite(im2right, 'im2.jpg','jpg');
imshow(im1left);
imwrite(im1left, 'im1.jpg','jpg');
info = imfinfo('im1.jpg');
axes(handles.axes2);
imshow(im2right);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
complete_steps
axes(handles.axes3);
%figure,imshow(finalimage);
%imshow(finalimage);   %Show processed image here, this line should come after calling 'complete_steps'. But temporarily kept here since the 'complete_steps' is giving error at the step6_interpolation.
%imgray = rgb2gray(im1);
%imgray2 = rgb2gray(im2);
%figure, imshow(imgray);
%figure, imshow(imgray2);