clear; close all; clc;
%%definizione  robot
circleC=@(x,y,r,c)(plot(x+r*cos(linspace(0,2*pi)),y+r*sin(linspace(0,2*pi)),'color',c,'LineWidth',2));
%%definizione inizio, goal, ostacoli
X0=[1;2];
G=[10;5];

O=[
    3 2;
    5 4;
    7 3;
    10 3;
    %%rect(12,6,1,2); 
    %%rect(8.5,4.5,0.5,0.5); 
    %%rect(5,3,2,1); 
    %%rect(12,1,2,1)
    %%rect(4.5,7.5,2.5,1.5)
  ];
%%
rotations =ones(size(O,1),1);
dmin=1;
%%potenziale attrattivo scegliendo un paraboloide e repulsivo
Ja=@(x,y,Gx,Gy)((1/2)*((x-Gx).^2+(y-Gy).^2));
Jr=@(x,y,Ox,Oy)(1./((x-Ox).^2+(y-Oy).^2));
% Jr=@(x,y,Ox,Oy)(atan2(Oy-y,Ox-x)+pi);
%%gradiente attrattivo
nablaJaX=@(x,y,Gx,Gy)(x-Gx);
nablaJaY=@(x,y,Gx,Gy)(y-Gy);
%%gradiente repulsivo
nablaJrX=@(x,y,Ox, Oy)(2*(Ox-x)./(((x-Ox).^2+(y-Oy).^2).^2));
nablaJrY=@(x,y,Ox, Oy)(2*(Oy-y)./(((x-Ox).^2+(y-Oy).^2).^2));
%%calcolo intorno ostacolo
rho=@(x,y,Ox,Oy)((x-Ox).^2+(y-Oy).^2<=dmin^2); %vale 1 quando sono in un raggio dmin dall'ostacolo Ox,Oy; vale 0 altrimenti 
%%peso attrattivo e associato agli ostacoli
wa=2;
wo=5;
%%passo
deltaXY=0.2;
%%
xm=min(X0(1),G(1));xm=min(xm,min(O(:,1)));
xM=max(X0(1),G(1));xM=max(xM,max(O(:,1)));
ym=min(X0(2),G(2));ym=min(ym,min(O(:,2)));
yM=max(X0(2),G(2));yM=max(yM,max(O(:,2)));
%%plot punti
figure();
hold on;
grid on;
plot(X0(1),X0(2),'xm','LineWidth',2);
plot(G(1),G(2),'xr','LineWidth',2);
plot(O(:,1),O(:,2),'ok','LineWidth',2);
axis([xm xM ym yM]);
axis('equal');

%%potenziale attrattivo
xx=xm-2:deltaXY:xM+2;%%mi calcolo gli assi, valore massimo e minimo della x e della y con spaziatura
yy=ym-2:deltaXY:yM+2;
[XX,YY]=meshgrid(xx,yy); 
%meshgrid restituisce una matrice in cui l'elemento XX (i,j) è un valore
%della x, l'elemento YY(i,j) è un valore della y. 

%%per graficare in 3D
Za=Ja(XX,YY,G(1),G(2));
nablaJaXX=nablaJaX(XX,YY,G(1),G(2));
nablaJaYY=nablaJaY(XX,YY,G(1),G(2));

figure();
subplot(121); hold on; grid on; surf(XX,YY,Za);
subplot(122);hold on;grid on;quiver(XX,YY, -nablaJaXX,-nablaJaYY);

%%potenziale repulsivo
Zr=zeros(size(Za));
nablaJrXX=zeros(size(nablaJaXX));
nablaJrYY=zeros(size(nablaJaXX));

for i=1:size(O,1)
    oi=O(i,:);
    Zr=Zr+Jr(XX,YY,oi(1),oi(2)).*rho(XX,YY,oi(1),oi(2));
    nablaJrXX=nablaJrXX+nablaJrX(XX,YY,oi(1),oi(2)).*rho(XX,YY,oi(1),oi(2))*rotations;
    nablaJrYY=nablaJrYY+nablaJrY(XX,YY,oi(1),oi(2)).*rho(XX,YY,oi(1),oi(2))*rotations;
end

figure();
subplot(121); hold on; grid on; surf(XX,YY,Zr);
subplot(122);hold on;grid on;quiver(XX,YY, -nablaJrXX,-nablaJrYY);

J=wa*Za+wo*Zr;
nablaJx=wa*nablaJaXX+wo*nablaJrXX;
nablaJy=wa*nablaJaYY+wo*nablaJrYY;

nablaJxn=nablaJx./sqrt(nablaJx.^2+nablaJy.^2);
nablaJyn=nablaJy./sqrt(nablaJx.^2+nablaJy.^2);

figure();
subplot(2,2,[1 3]);hold on;grid on;surf(XX,YY,J);
subplot(222); hold on;grid on; quiver (XX,YY,-nablaJx,-nablaJy);
subplot(224); hold on;grid on; quiver (XX,YY,-nablaJxn,-nablaJyn);

%%cammino dal punto iniziale al goal
figure();
hold on; grid on;
quiver(XX,YY,-nablaJxn,-nablaJyn);
plot(X0(1),X0(2),'xm','LineWidth',2);
plot(G(1),G(2),'xr','LineWidth',2);
plot(O(:,1),O(:,2),'ok','LineWidth',2);

%%APF
alpha=0.02;
TH=0.2;
nIter=100;
X=zeros(2,nIter);
X(:,1)=X0;
for k=2:nIter
    Xcur=X(:,k-1);
    nablaA=[
            nablaJaX(Xcur(1),Xcur(2),G(1),G(2));
            nablaJaY(Xcur(1),Xcur(2),G(1),G(2))
            ];
    nablaR=[0;0];
    for i=1:size(0,1)
        oi=O(i,:);
        nablaR=nablaR+[
            nablaJrX(Xcur(1),Xcur(2),oi(1),oi(2)*rho(Xcur(1),Xcur(2),oi(1),oi(2)));
            nablaJrY(Xcur(1),Xcur(2),oi(1),oi(2)*rho(Xcur(1),Xcur(2),oi(1),oi(2)));
        ];
    end
    nablaJ=wa*nablaA+wo*nablaR;
    Xsucc=Xcur-alpha*nablaJ;
    X(:,k)=Xsucc;
    if norm(Xsucc-G)<=TH
        break;
    end
end
if k<nIter
    X(:,k+1:end)=[];
end

for i=1:size(X,2)
    plot(X(1,i),X(2,i),'xk','LineWidth',2);
end