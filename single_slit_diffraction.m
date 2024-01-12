clc
clear
lambda=500e-9;             %波长（可修改）
a=1e-3;                    %缝宽（可修改）
f=1;                       %透镜到像面的距离（焦距）
ym=6*lambda*f/a;           %屏幕上y的范围（取观察范围为两暗纹间线宽度的6倍）
n=51;                      %设定观察点的数目
ys=linspace(-ym,ym,n);     %划定取样数组
yp=linspace(0,a,n);        %将缝宽也划定数组
for i=1:n
sinphi=ys(i)/f;
u=pi*yp*sinphi/lambda;
sumcos=sum(cos(u));
sumsin=sum(sin(u));
B(i,:)=(sumcos^2+sumsin^2)/n^2;    %光强
end
N=255;                             %图像颜色数 
Br=(B/max(B))*N;
subplot(1,2,1)                     %建立坐标系
image(ym,ys,Br);
colormap(hot(N)); 
subplot(1,2,2)                     %建立坐标系
plot(B,ys,'k');