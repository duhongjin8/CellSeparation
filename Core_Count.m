function [ number_core ] = Core_Count(I )
% 计数
% 利用不断腐蚀的方法来分割粘连的细胞
% 下面 Z 用来测试（标记所有的细胞），mark中已去除相关标记代码，不影响运行速率

thresh=21; %设置考虑阈值
Y=I;
[R,C,D]=size(I); %获取图像尺寸

%% 图像预处理
good=Y; %“好的”图像 ——预处理后的图像
Z=zeros(R,C);

sq=[ 1 1 1 ;
     0 1 0 ;
     1 1 1 ];

good=imerode(good, sq); %一次腐蚀 垂直方向

sq=[ 1 0 1 ;
     1 1 1 ;
     1 0 1 ];

good=imerode(good, sq); %二次腐蚀 水平方向
sq = [1 0 1;0 1 0;1 0 1];
good=imdilate(good, sq); %膨胀

%% 初始化计数

cnt=0;

%% 第一次腐蚀

small=bwareaopen(good,thresh); %“取到”面积小于11像素的核区
small=~small; %黑色显示核区域

p=xor(good,small);% 取到面积小于阈值腐蚀后的核区

[Z,cnt]=mark(p,cnt,Z);

%% 腐蚀

while(min(small(:)) ~=1)
    
erode = imerode(~small, sq); %腐蚀
% erode=bwmorph(erode,'hbreak');
small=bwareaopen(erode,thresh); %“取到”面积小于阈值腐蚀后的核区
small=~small; %黑色显示核区域
p=xor(erode,small);% 取到面积小于阈值腐蚀后的核区
[Z,cnt]=mark(p,cnt,Z);
end


number_core=cnt; %累加个数
% imshow(Z)
% imwrite(Z,'Z.png');

end

