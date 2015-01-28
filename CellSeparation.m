function varargout = untitled2(varargin)
% UNTITLED2 MATLAB code for untitled2.fig
%      UNTITLED2, by itself, creates a new UNTITLED2 or raises the existing
%      singleton*.
%
%      H = UNTITLED2 returns the handle to a new UNTITLED2 or the handle to
%      the existing singleton*.
%
%      UNTITLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED2.M with the given input arguments.
%
%      UNTITLED2('Property','Value',...) creates a new UNTITLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled2

% Last Modified by GUIDE v2.5 08-Aug-2014 17:39:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled2_OutputFcn, ...
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


% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled2 (see VARARGIN)

% Choose default command line output for untitled2
handles.output = hObject;
set(handles.edit1,'String','0');
set(handles.edit4,'String','准备');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled2 wait for user response (see UIRESUME)
% uiwait(handles.counter);


% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function openImage_Callback(hObject, eventdata, handles)
% hObject    handle to openImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname,pathname] = uigetfile({'*.jpg';},'Open an image file for marking');
    if fname == 0
        return
    end
    fname = fullfile(pathname,fname);
    set(hObject,'UserData',fname);
    
    handles.image = imshow(fname,'Parent',handles.display);
    xsize = get(handles.image,'XData');
    ysize = get(handles.image,'YData');
    grid_size = diff(ysize)/10; % 10 ticks
    set(handles.display,'XTick',xsize(1):grid_size:xsize(2),'YTick',ysize(1):grid_size:ysize(2),'XTickLabel',[],'YTickLabel',[],'TickLength',[0 0]);
    grid(handles.display,'on');
    hold(handles.display,'on');
    handles.scatter(1) = scatter (NaN,NaN,100,'ro','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');
    handles.scatter(2) = scatter (NaN,NaN,100,'go','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');
    handles.scatter(3) = scatter (NaN,NaN,100,'bo','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');

    hold(handles.display,'off');
    set(handles.image,'ButtonDownFcn',{@display_ButtonDownFcn,handles});
    handles.current_fname = fname;
    set(handles.counter,'Name',fname);
   
    guidata(hObject, handles);

% --------------------------------------------------------------------
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.counter);

% --------------------------------------------------------------------
function count_Callback(hObject, eventdata, handles)
% hObject    handle to count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function print_Callback(hObject, eventdata, handles)
% hObject    handle to print (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool4_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname,pathname] = uigetfile({'*.jpg';},'Open an image file for marking');
    if fname == 0
        return
    end
    fname = fullfile(pathname,fname);
    set(hObject,'UserData',fname);
    
    handles.image = imshow(fname,'Parent',handles.display);
    xsize = get(handles.image,'XData');
    ysize = get(handles.image,'YData');
    grid_size = diff(ysize)/10; % 10 ticks
    set(handles.display,'XTick',xsize(1):grid_size:xsize(2),'YTick',ysize(1):grid_size:ysize(2),'XTickLabel',[],'YTickLabel',[],'TickLength',[0 0]);
    grid(handles.display,'on');
    hold(handles.display,'on');
    handles.scatter(1) = scatter (NaN,NaN,100,'ro','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');
    handles.scatter(2) = scatter (NaN,NaN,100,'go','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');
    handles.scatter(3) = scatter (NaN,NaN,100,'bo','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');

    hold(handles.display,'off');
    set(handles.image,'ButtonDownFcn',{@display_ButtonDownFcn,handles});
    handles.current_fname = fname;
    set(handles.counter,'Name',fname);
   
    guidata(hObject, handles);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows. 
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function uipushtool6_ClickedCallback(hObject, eventdata, handles,fname)
% hObject    handle to uipushtool6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value=get(handles.openImage,'UserData');
I=imread(value);
[Y,BW2]=BackGround(I); % 背景为0

%所有计数
x=Core_Count(~BW2);
set(handles.edit1,'String',num2str(x));

%取反色
I=double(I); %转换精度
C=~BW2;

C=double(C); %二值 0 1

CC(:,:,1)=C; %扩充成三维
CC(:,:,2)=C;
CC(:,:,3)=C;

CC=255.*CC;
I=CC-I; %相减 取反色
I=abs(I);

imshow(uint8(I));



% --------------------------------------------------------------------
function circle_Callback(hObject, eventdata, handles)
% hObject    handle to circle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function out_Callback(hObject, eventdata, handles)
% hObject    handle to out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when counter is resized.
function counter_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to counter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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






% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname,pathname] = uigetfile({'*.jpg';},'Open an image file for marking');
    if fname == 0
        return
    end
    fname = fullfile(pathname,fname);
    set(hObject,'UserData',fname);
    
    handles.image = imshow(fname,'Parent',handles.display);
    xsize = get(handles.image,'XData');
    ysize = get(handles.image,'YData');
    grid_size = diff(ysize)/10; % 10 ticks
    set(handles.display,'XTick',xsize(1):grid_size:xsize(2),'YTick',ysize(1):grid_size:ysize(2),'XTickLabel',[],'YTickLabel',[],'TickLength',[0 0]);
    grid(handles.display,'on');
    hold(handles.display,'on');
    handles.scatter(1) = scatter (NaN,NaN,100,'ro','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');
    handles.scatter(2) = scatter (NaN,NaN,100,'go','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');
    handles.scatter(3) = scatter (NaN,NaN,100,'bo','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');

    hold(handles.display,'off');
    set(handles.image,'ButtonDownFcn',{@display_ButtonDownFcn,handles});
    handles.current_fname = fname;
    set(handles.counter,'Name',fname);
   
    guidata(hObject, handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit4,'String','正在统计...');
value=get(handles.openImage,'UserData');
I=imread(value);
[Y,BW2]=BackGround(I); % 背景为0

%所有计数
x=Core_Count(~BW2);
set(handles.edit1,'String',num2str(x));

%取反色
I=double(I); %转换精度
C=~BW2;

C=double(C); %二值 0 1

CC(:,:,1)=C; %扩充成三维
CC(:,:,2)=C;
CC(:,:,3)=C;

CC=255.*CC;
I=CC-I; %相减 取反色
I=abs(I);

imshow(uint8(I));

set(handles.edit4,'String','已完成');

% --- Executes on button press in pushbutton9.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton10.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname,pathname] = uigetfile({'*.jpg';},'Open an image file for marking');
    if fname == 0
        return
    end
    fname = fullfile(pathname,fname);
    set(hObject,'UserData',fname);
    
    handles.image = imshow(fname,'Parent',handles.display);
    xsize = get(handles.image,'XData');
    ysize = get(handles.image,'YData');
    grid_size = diff(ysize)/10; % 10 ticks
    set(handles.display,'XTick',xsize(1):grid_size:xsize(2),'YTick',ysize(1):grid_size:ysize(2),'XTickLabel',[],'YTickLabel',[],'TickLength',[0 0]);
    grid(handles.display,'on');
    hold(handles.display,'on');
    handles.scatter(1) = scatter (NaN,NaN,100,'ro','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');
    handles.scatter(2) = scatter (NaN,NaN,100,'go','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');
    handles.scatter(3) = scatter (NaN,NaN,100,'bo','Parent',handles.display,'HitTest','off','XLimInclude','off','YLimInclude','off');

    hold(handles.display,'off');
    set(handles.image,'ButtonDownFcn',{@display_ButtonDownFcn,handles});
    handles.current_fname = fname;
    set(handles.counter,'Name',fname);
   
    guidata(hObject, handles);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open('help.fig');  %result为新窗口名
h = guihandles;

backgroundImage = importdata('help.png');
% 选择坐标系
axes(h.axes1);
% 将图片添加到坐标系中，于是就成了背景了
image(backgroundImage);
% 将坐标系的坐标轴标签去掉
axis off

% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open('about.fig');  %result为新窗口名
h = guihandles;

backgroundImage = importdata('about.png');
% 选择坐标系
axes(h.axes1);
% 将图片添加到坐标系中，于是就成了背景了
image(backgroundImage);
% 将坐标系的坐标轴标签去掉
axis off
