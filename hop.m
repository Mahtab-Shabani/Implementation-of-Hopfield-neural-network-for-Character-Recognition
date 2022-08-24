function varargout = hop(varargin)
% hopfield M-file for hopfield.fig
%      hopfield, by itself, creates a new hopfield or raises the existing
%      singleton*.
%
%      H = hopfield returns the handle to a new hopfield or the handle to
%      the existing singleton*.
%
%      hopfield('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in hopfield.M with the given input arguments.
%
%      hopfield('Property','Value',...) creates a new hopfield or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hopfield_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hopfield_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hopfield

% Last Modified by GUIDE v2.5 29-May-2015 00:23:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hop_OpeningFcn, ...
                   'gui_OutputFcn',  @hop_OutputFcn, ...
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

% --- Executes just before hopfield is made visible.
function hop_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hopfield (see VARARGIN)

% Choose default command line output for hopfield
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes hopfield wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hop_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in network_btn.
function network_btn_Callback(hObject, eventdata, handles)
% hObject    handle to network_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.X handles.T]=prprob();
handles.Letters='ABCDEFZ';
% handles.Letters='ABCDEFGH';
handles.LettersIndex=double(handles.Letters)-64;
handles.P=handles.X(:,handles.LettersIndex);
handles.net=newhop(handles.P);
% Guidata(hObject,handles);  % MATLAB 2009
guidata(hObject,handles);    % MATLAB 2014a
msgbox ('network is created. and training data: ABCDEFZ','message');

% --- Executes on button press in noise_btn.
function noise_btn_Callback(hObject, eventdata, handles)
% hObject    handle to noise_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

TestLetter=get(handles.test_editbox,'String');
if isempty(TestLetter)
    errordlg 'text box is empty!';
else
%     handles.a=handles.a+0.3*randn(size(handles.a));
    handles.a=handles.a+0.1*randn(size(handles.a));
%     Guidata(hObject,handles);
    guidata(hObject,handles);
    plotchar(handles.a);
end

function test_editbox_Callback(hObject, eventdata, handles)
% hObject    handle to test_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of test_editbox as text
%        str2double(get(hObject,'String')) returns contents of test_editbox as a double
handles.TestLetter=get(handles.test_editbox,'String');
handles.TestLetterIndex=double(handles.TestLetter)-64;
handles.a=handles.X(:,handles.TestLetterIndex);
% Guidata(hObject,handles);
guidata(hObject,handles);
plotchar(handles.a);


% --- Executes during object creation, after setting all properties.
function test_editbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to test_editbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TestLetter=get(handles.test_editbox,'String');
if isempty(TestLetter)
    errordlg 'text box is empty!';
else
    %handles.y = handles.net({1 23},[],{handles.a});
    handles.y = sim(handles.net,{1 18},[],{handles.a});
%     handles.y = sim(handles.net,{1 25},[],{handles.a});
    handles.y=cell2mat(handles.y);
    handles.y(:,end)=mean(handles.y(:,end-10:end),2);
%     Guidata(hObject,handles);
    guidata(hObject,handles);
    N=size(handles.y,2);
    figure;
    for i=1:N
        subplot(3,6,i);
%         subplot(4,6,i);
        plotchar(handles.y(:,i));
        title(['Step ' num2str(i-1)]);
    end
end
% Guidata(hObject,handles);
guidata(hObject,handles);
