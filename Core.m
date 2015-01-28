function [ core ] = Core( I )
% 找到核区


I=IlluminBalance(I);%光照平衡，图片整体变亮许多，凸显核区的范围
I=double(I);

% 增加对比度
x=2.2;
I=(I/255).^(x);

%转换成灰度
L=rgb2gray(I);

L=L*255;
L=uint8(L);

% %转换为三维灰度矩阵

II(:,:,1)=L;
II(:,:,2)=L;
II(:,:,3)=L;

% %灰度光照平衡
L=IlluminBalance(II);


% %转换成二维灰度矩阵
L=L(:,:,1);

%在免疫组化图片中，在这里L 所有核都可以显示出来，阳性细胞灰度值低 其他细胞灰度值叫高

%选取阈值
level=graythresh(L); % 免疫组化图片中 选取一个较大的灰度值分割即可得到所有核， 选取ostu（这里的graythresh函数）即可得到阳性细胞核
core=im2bw(L,level);

%% 取出核
 core=~core;
 core=imfill(core,'holes'); %填充
 core=bwareaopen(core,15); %去除过小的连通域

end

