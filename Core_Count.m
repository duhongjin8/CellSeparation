function [ number_core ] = Core_Count(I )
% ����
% ���ò��ϸ�ʴ�ķ������ָ�ճ����ϸ��
% ���� Z �������ԣ�������е�ϸ������mark����ȥ����ر�Ǵ��룬��Ӱ����������

thresh=21; %���ÿ�����ֵ
Y=I;
[R,C,D]=size(I); %��ȡͼ��ߴ�

%% ͼ��Ԥ����
good=Y; %���õġ�ͼ�� ����Ԥ������ͼ��
Z=zeros(R,C);

sq=[ 1 1 1 ;
     0 1 0 ;
     1 1 1 ];

good=imerode(good, sq); %һ�θ�ʴ ��ֱ����

sq=[ 1 0 1 ;
     1 1 1 ;
     1 0 1 ];

good=imerode(good, sq); %���θ�ʴ ˮƽ����
sq = [1 0 1;0 1 0;1 0 1];
good=imdilate(good, sq); %����

%% ��ʼ������

cnt=0;

%% ��һ�θ�ʴ

small=bwareaopen(good,thresh); %��ȡ�������С��11���صĺ���
small=~small; %��ɫ��ʾ������

p=xor(good,small);% ȡ�����С����ֵ��ʴ��ĺ���

[Z,cnt]=mark(p,cnt,Z);

%% ��ʴ

while(min(small(:)) ~=1)
    
erode = imerode(~small, sq); %��ʴ
% erode=bwmorph(erode,'hbreak');
small=bwareaopen(erode,thresh); %��ȡ�������С����ֵ��ʴ��ĺ���
small=~small; %��ɫ��ʾ������
p=xor(erode,small);% ȡ�����С����ֵ��ʴ��ĺ���
[Z,cnt]=mark(p,cnt,Z);
end


number_core=cnt; %�ۼӸ���
% imshow(Z)
% imwrite(Z,'Z.png');

end

