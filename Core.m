function [ core ] = Core( I )
% �ҵ�����


I=IlluminBalance(I);%����ƽ�⣬ͼƬ���������࣬͹�Ժ����ķ�Χ
I=double(I);

% ���ӶԱȶ�
x=2.2;
I=(I/255).^(x);

%ת���ɻҶ�
L=rgb2gray(I);

L=L*255;
L=uint8(L);

% %ת��Ϊ��ά�ҶȾ���

II(:,:,1)=L;
II(:,:,2)=L;
II(:,:,3)=L;

% %�Ҷȹ���ƽ��
L=IlluminBalance(II);


% %ת���ɶ�ά�ҶȾ���
L=L(:,:,1);

%�������黯ͼƬ�У�������L ���к˶�������ʾ����������ϸ���Ҷ�ֵ�� ����ϸ���Ҷ�ֵ�и�

%ѡȡ��ֵ
level=graythresh(L); % �����黯ͼƬ�� ѡȡһ���ϴ�ĻҶ�ֵ�ָ�ɵõ����кˣ� ѡȡostu�������graythresh���������ɵõ�����ϸ����
core=im2bw(L,level);

%% ȡ����
 core=~core;
 core=imfill(core,'holes'); %���
 core=bwareaopen(core,15); %ȥ����С����ͨ��

end

