clc
clear
lambda=632.8e-9;               %波长，eg：1e-3
r=input('please input r:\n');  %圆孔半径
f=1;                           %焦距
def=1e-5;
xm=6000*lambda*f;
[x,y]=meshgrid(-xm:def:xm);
s=2*pi*r*sqrt(x.^2+y.^2)./(lambda*f);
I=4*(besselj(1,s)./(s+eps)).^2;
figure
plot(-s,I,s,I);
xlabel('s');
ylabel('光强');
figure
imshow(I*255)                  %二维图
xlabel('x');
ylabel('y');
figure
mesh(x,y,I)                    %三维图
xlabel('x');
ylabel('y');
zlabel('光强')