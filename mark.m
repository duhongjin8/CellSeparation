function [ Z,cnt] = mark( I ,cnt, Z)  
% I�ǲ��ϸ�ʴ�ĺ���
% Y��ԭʼ���ĺ���
% Z�����ս������ʾ��ɫ�����Լ������ĵ�

[R,C,~]=size(I);

%% ��ȡ��ͨ�������
I=~I;
CC = bwconncomp(I); %���ú��� ���ٻ�ȡ����
cnt=cnt+ CC.NumObjects; %�ۼ�

% for i=1:R
%     for j=1:C
% 
%         if I(i,j)==0     %��ɫ
%          
%             cnt=cnt+1; %����
%             I=imfill(I,[i j],8); %��ʴ��ĺ��� ���
%             
%             a=1/2; 
%             % ��� 
%             Z(i,j)=a;
%             if i+1<=R
%                 Z(i+1,j)=a;end
%             if i-1>=1
%                 Z(i-1,j)=a;end
%             if j+1<=C
%                 Z(i,j+1)=a;end
%             if j-1>=1
%                 Z(i,j-1)=a;end%���,��������
%         end
%         
%     end
%     
% end
end

