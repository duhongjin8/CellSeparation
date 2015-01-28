function [ Z,cnt] = mark( I ,cnt, Z)  
% I是不断腐蚀的核区
% Y是原始填充的核区
% Z是最终结果，显示白色核区以及核中心点

[R,C,~]=size(I);

%% 获取连通区域个数
I=~I;
CC = bwconncomp(I); %内置函数 快速获取个数
cnt=cnt+ CC.NumObjects; %累加

% for i=1:R
%     for j=1:C
% 
%         if I(i,j)==0     %黑色
%          
%             cnt=cnt+1; %计数
%             I=imfill(I,[i j],8); %腐蚀后的核区 填充
%             
%             a=1/2; 
%             % 标记 
%             Z(i,j)=a;
%             if i+1<=R
%                 Z(i+1,j)=a;end
%             if i-1>=1
%                 Z(i-1,j)=a;end
%             if j+1<=C
%                 Z(i,j+1)=a;end
%             if j-1>=1
%                 Z(i,j-1)=a;end%结果,四领域标记
%         end
%         
%     end
%     
% end
end

