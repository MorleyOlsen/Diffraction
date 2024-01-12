clc
clear
lamda=500e-9;            %波长
N=5;                    %缝数 ，可以随意更改变换
a=2e-4;                  %缝宽
f=5;                     %透镜到像面的距离
d=5*a;                   %光栅常数
ym=2*lamda*f/a;          %屏幕上y的范围
xs=ym;
n=1001;
ys=linspace(-ym,ym,n);
for i=1:n
sinphi=ys(i)/f; 
alpha=pi*a*sinphi/lamda;
beta=pi*d*sinphi/lamda;
B(i,:)=(sin(alpha)./alpha).^2.*(sin(N*beta)./sin(beta)).^2;
B1=B/max(B);
end
NC=255;                  %确定灰度的等级
Br=(B/max(B))*NC;
subplot(1,2,1)
image(xs,ys,Br);
colormap(hot(NC));       %色调处理
subplot(1,2,2)
plot(B1,ys,'k');