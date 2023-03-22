function dx=AREA1(In)
%--------------------------------------------------------------------------
u1=In(1);
DPd1=In(2);
Df1=In(3);
DPt11=In(4);
DPg11=In(5);
DPt21=In(6);
DPr1=In(7);
DPg21=In(8);
DPtie1=In(9);
Df2=In(10);
Df3=In(11);
x=[Df1;DPt11;DPg11;DPt21;DPr1;DPg21;DPtie1];
%--------------------------------------------------------------------------
D=0.24;Kr=0.3;M=167;
R=0.04;Tt1=0.4;Tg1=0.1;
Tt2=1;Tg2=0.1;Tr=1;
T12=8.4;T13=2.3;
Dr1=0;
Ab11=[-D/M,1/M,0,1/M,0,0,-1/M;
       0,-1/Tt1,1/Tt1,0,0,0,0;
       -1/R/Tg1,0,-1/Tg1,0,0,0,0;
       0,0,0,-1/Tt2,1/Tt2,0,0;
       -Kr/R/Tg2,0,0,0,-1/Tr,-Kr/Tg2+1/Tr,0;
       -1/R/Tg2,0,0,0,0,-1/Tg2,0;
       2*pi*(T12+T13),0,0,0,0,0,0];
Ab12=[0,0,0,0,0,0,0;
      0,0,0,0,0,0,0;
      0,0,0,0,0,0,0;
      0,0,0,0,0,0,0;
      0,0,0,0,0,0,0;
      0,0,0,0,0,0,0;
      -2*pi*T12,0,0,0,0,0,0];
Ab13=[0,0,0,0,0,0,0;
      0,0,0,0,0,0,0;
      0,0,0,0,0,0,0;
      0,0,0,0,0,0,0;
      0,0,0,0,0,0,0;
      0,0,0,0,0,0,0;
      -2*pi*T13,0,0,0,0,0,0];  
Bb1=[0;0;1/Tg1;0;0;0;0];
Fb1=[1/M;0;0;0;0;0;0];
Eb1=[0;0;0;0;0;1;0];
Cb1=[1,0,0,0,0,0,0];
v1=0.1;B1=0.03;
g11=1/M*[v1;0;0;0;0;0;0];
g21=(1/Tt1)*[0;B1;0;0;0;0;0];
%--------------------------------------------------------------------------
dx=Ab11*x+Bb1*u1+Eb1*Dr1+Ab12*[Df2;0;0;0;0;0;0]+Ab13*[Df3;0;0;0;0;0;0]+g11+g21-Fb1*DPd1;