function varargout = BINGO(varargin)
% BINGO MATLAB code for BINGO.fig
%      BINGO, by itself, creates a new BINGO or raises the existing
%      singleton*.
%
%      H = BINGO returns the handle to a new BINGO or the handle to
%      the existing singleton*.
%
%      BINGO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BINGO.M with the given input arguments.
%
%      BINGO('Property','Value',...) creates a new BINGO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BINGO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BINGO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BINGO

% Last Modified by GUIDE v2.5 26-Oct-2018 11:26:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BINGO_OpeningFcn, ...
                   'gui_OutputFcn',  @BINGO_OutputFcn, ...
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


% --- Executes just before BINGO is made visible.
function BINGO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BINGO (see VARARGIN)

% Choose default command line output for BINGO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BINGO wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global btn memory memory2 

    set(handles.chanceNo, 'Visible', 'off'); 
    set(handles.exist, 'Visible', 'off'); 
    set(handles.Num1, 'Visible', 'off');     
    set(handles.Num2, 'Visible', 'off'); 
    set(handles.Num3, 'Visible', 'off');     
    set(handles.Num4, 'Visible', 'off');         
    btn = 0;
    memory = 0;
    rng('shuffle'); %ìØÇ∂êîéöÇ™åJÇËï‘Ç≥Ç»Ç¢ÇÊÇ§Ç…Ç∑ÇÈ
    
     r2 = randperm(75,75); % 1Å`75Ç≈åJÇËï‘Ç≥Ç»Ç¢óêêîê∂ê¨
     memory2 = r2'; % 75ÇÃÉâÉìÉ_ÉÄêîéöóÒÇópà”ÇµÅA1å¬Ç∏Ç¬âÊñ Ç…ï\é¶ÇÃÇΩÇﬂ
     assignin('base', 'memory2', memory2);  
    
    Img = imread('pic2.jpg');
    axes(handles.axes1);
    imshow(Img);
    axis off   
    Img2 = imread('pic1.jpg');
    axes(handles.axes2);
    imshow(Img2);
    axis off 


% --- Outputs from this function are returned to the command line.
function varargout = BINGO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count btn memory memory2 clr_btn

if clr_btn==1
    btn = 0;
    memory = 0;
    clr_btn = 0;
end
    btn = btn + 1;

if btn > 75
    warndlg('The total number exceeds 75ÅI','!! Warning !!')
    btn = 75;
end

count  = 0;
X = zeros();
set(handles.exist, 'Visible', 'off'); 

load('sound.mat'); % = y2
Fs = 44100;

while count < 15
  sound(y2,Fs); % play sound
  
  for ii = 1:75  
   X(ii) = randi(75,[1,1]);
 
  set(handles.chanceNo, 'String', X(ii));  % Ç±ÇÍÇÕå©ÇΩñ⁄Ç≈ìÆÇ≠ÇΩÇﬂÅGé¿ç€Ç…égÇ§ÇÃÇÕmemory2
  set(handles.chanceNo, 'Visible', 'on'); 
  end
  
 count = count + 1;
 pause(0.1)
end
 
  set(handles.chanceNo, 'String', memory2(btn));
  set(handles.chanceNo, 'Visible', 'on'); 


memory(btn,1) = X(1,end); % Ç±ÇÍÇÕå©ÇΩñ⁄Ç≈ìÆÇ≠ÇΩÇﬂÅGé¿ç€Ç…égÇ§ÇÃÇÕmemory2

    if length(memory)< 21
 %     set(handles.Num1, 'String', memory);
      set(handles.Num1, 'String', memory2(1:btn));
      set(handles.Num1, 'Visible', 'on'); 
    elseif length(memory)> 20 && length(memory)< 41
 %     set(handles.Num2, 'String', memory(21:end));
      set(handles.Num2, 'String', memory2(21:btn));    
      set(handles.Num2, 'Visible', 'on'); 
    elseif length(memory)> 40 && length(memory)< 61
   %   set(handles.Num3, 'String', memory(41:end));
      set(handles.Num3, 'String', memory2(41:btn));     
      set(handles.Num3, 'Visible', 'on');  
    elseif length(memory)> 60 
      set(handles.Num4, 'String', memory2(61:btn));     
      set(handles.Num4, 'Visible', 'on');  
    end  

%assignin('base', 'memory', memory);   

%u = unique(memory(~isnan(memory)));
u = unique(memory2);
n = histc(memory2,u);

%[N,edges] = histcounts(memory,u)
% d = u(n>1);
% [aa,ii] = ismember(X,u);

Msg = "Already exist! Run again"; 
if memory2(memory2(btn+1:end)==memory2(btn))      
   set(handles.exist, 'String', Msg);
   set(handles.exist, 'Visible', 'on');  
end

%assignin('base', 'memory', memory);  


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count 
count = 100;


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global clr_btn memory2
    clc
    set(handles.chanceNo, 'Visible', 'off'); 
    set(handles.exist, 'Visible', 'off'); 
    set(handles.Num1, 'Visible', 'off');     
    set(handles.Num2, 'Visible', 'off'); 
    set(handles.Num3, 'Visible', 'off');     
    set(handles.Num4, 'Visible', 'off');  
clr_btn = 1
rng('shuffle'); 
r2 = randperm(75,75); 
memory2 = r2';
assignin('base', 'memory2', memory2);  
