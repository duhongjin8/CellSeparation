function [ Y ,BW2] = BackGround( I )
% ���ֱ�����ϸ��
% ͨ��ֱ��ͼ��ֵ�ķ�����ѡȡһ���ϵ͵Ĺ�����ֵ���зָ�
% ��������ϸ����ɢ����������Ϊ�׵���Ƭͼ��


%% ��ʼ��
color_origin=I;
origin_gray=rgb2gray(color_origin); %ת��Ϊ�Ҷ�ͼ��

[R,C]=size(origin_gray); %��ȡͼ��ߴ�
z=imhist(origin_gray); % ��ȡ�Ҷ�ֱ��ͼ

max=0;% ��ʼ�����ĻҶ�ֵ
min=256;%��ʼ����С�ĻҶ�ֵ
flag =0;% ���
 max_index=255;


%% �ҵ���ֵ
%�ҵ��Ҷ����ֵ
for  i=256:-1:1
    
    if z(i)>max;
        max=z(i);
        max_index=i;
    end
    
end


%�ҵ����ֵ���ĵ�����������
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


% �ҵ�������
for i=decrease_index:-1:1
    
    flag=0;
    
    %�Ƚϵ�ǰֵ���Ҳ�ֵ
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
    
    %�Ƚϵ�ǰֵ�����
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

%% �������255
%����ͼ��

% [Y,k,t1]=imadjust(origin_gray);
% [Y,k,t1]=equalize(origin_gray);%��ʼ��ͼ��ֱ��ͼ���⻯
% 
% origin_gray=Y;
% 
% level=min;

% level=k*(level-t1);%���⻯��Ĺ�ֵ

level = min;

BW2=im2bw(origin_gray,level/255);%��ֵ��

BW2=~BW2;

BW2=imfill(BW2,'holes');

BW2=~BW2;

% ��ȡ��Ҫ������
for i=1:R
    for j=1:C
        if BW2(i,j) == 1
            I(i,j,1) = 255;
            I(i,j,2) = 255;
            I(i,j,3) = 255;
        end
    end
end


Y=I; %�����ɫ������ͼƬ
end

