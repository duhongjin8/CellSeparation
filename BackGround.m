function [ Y ,BW2] = BackGround( I )
% Separate cell from the backround 区分背景与细胞
% Via histogram thresholding method to find a value to segment通过直方图阈值的方法，选取一个较低的谷区域值进行分割
% Limitation: performed not well on overlapped cells and dark backgound  局限在于细胞分散，背景明显为白的切片图像


%% Initialization 初始化
color_origin=I;
origin_gray=rgb2gray(color_origin); % Convert original picture to gray level 转换为灰度图像

[R,C]=size(origin_gray); %Get the size of picture 获取图像尺寸
z=imhist(origin_gray); % get the histogram 获取灰度直方图

max=0;% Initailize the max gray level 初始化最大的灰度值
min=256;%Initailize the min gray level初始化最小的灰度值
flag =0;% 标记
max_index=255;


%% Find the threshold找到阈值
%Find the max gray level 找到灰度最大值
for  i=256:-1:1
    
    if z(i)>max;
        max=z(i);
        max_index=i;
    end
    
end


% find the monotonic increasing interval to the left of the maximum 找到最大值左侧的单调上升区域
for i=max_index:-1:1
    
    flag =0;
    current = i;
    
    for j=1:5
        if z(current) > z(current-1)
            current=current-1;
        else flag =1; break;
        end
    end
    
    if flag ==0
        break;
    end
end


decrease_index=i;


% Find the valley interval 找到谷区域
for i=decrease_index:-1:1
    
    flag=0;
    
    % Compare current value with the value to the right 比较当前值和右侧值
    cnt=0;
    for j=1:5
        if z(i+j) >= z(i)
            cnt=cnt+1;
        end
    end
    
    if cnt >=2
        flag=1;
    else flag =0;
    end
    
    %ompare current value with the value to the left 比较当前值和左侧
    cnt=0;
    for j=-1:-1:-5
         if z(i+j) >= z(i)
            cnt=cnt+1; 
         end
    end
    
    if cnt >=2
        flag=1;
    else flag =0;
    end
    
    
    if flag == 1;
        min=i;
        break;
    end
    
end

%% 背景变白255
%处理图像

% [Y,k,t1]=imadjust(origin_gray);
% [Y,k,t1]=equalize(origin_gray);%初始化图像，直方图均衡化
% 
% origin_gray=Y;
% 
% level=min;

% level=k*(level-t1);%均衡化后的谷值

level = min;

BW2=im2bw(origin_gray,level/255);%二值化

BW2=~BW2;

BW2=imfill(BW2,'holes');

BW2=~BW2;

% 提取需要的区域
for i=1:R
    for j=1:C
        if BW2(i,j) == 1
            I(i,j,1) = 255;
            I(i,j,2) = 255;
            I(i,j,3) = 255;
        end
    end
end


Y=I; %输出白色背景的图片
end

