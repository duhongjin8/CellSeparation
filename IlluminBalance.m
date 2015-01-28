function [ B  ] = IlluminBalance( I )

% subplot(1,2,1);
% imshow(I);


I=rgb2ycbcr(I);

L=I(:,:,1);
LL=I(:,:,2);
LLL=I(:,:,3);

%%%%%%%%%%%%%构造高斯核%%%%%%%%%%%%%%%%%%%%%%%
k1=8;
k2=8;
r=161;
alf=1600;
nn=floor((r+1)/2);
for i=1:r
    for j=1:r
        b(i,j) =exp(-((i-nn)^2+(j-nn)^2)/(k1*alf))/(k2*pi*alf*10000);        %高斯函数
   end
end
%%%%%%%%%%%对Y分量的处理%%%%%%%%%%%%%
Img = double(L);
K=imfilter(Img,b);  
G=log(Img+1)-log(K+1);

mi=min(min(G));
ma=max(max(G));
       L=(G-mi)*255/(ma-mi);

%%%%%%%%%%%%对彩色图像的综合处理 %%%%%%
ssr=cat(3,L,LL,LLL);
% subplot(1,2,2);
ssr=ycbcr2rgb(ssr);
% imshow(uint8(ssr));
% imwrite(uint8(ssr),'r1.bmp');
% figure,surf(b);

B=uint8(ssr);

end

