%%
%==========================================================================
clc;
clear all;
close all;
global NN_Controller1 NN_Controller2 NN_Controller3
NNTEMP=load('NNC1');
NN_Controller1=NNTEMP.net;
NNTEMP=load('NNC2');
NN_Controller2=NNTEMP.net;
NNTEMP=load('NNC3');
NN_Controller3=NNTEMP.net;
%==========================================================================
DPd1=0.3;
DPd2=0;
DPd3=0;
sim('LFC_PID');
sim('LFC_NN');
figure (1)
plot(t_PID,Df1_PID,'b','linewidth',2);hold on;
plot(t_NN,Df1_NN,'r','linewidth',2);grid on;
ylabel('DF1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.002 0.002]);
figure (2)
plot(t_PID,DPtie1_PID,'b','linewidth',2);hold on;
plot(t_NN,DPtie1_NN,'r','linewidth',2);grid on;
ylabel('DPtie1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.5 0.5]);
figure (3)
plot(t_PID,Df2_PID,'b','linewidth',2);hold on;
plot(t_NN,Df2_NN,'r','linewidth',2);grid on;
ylabel('DF1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.002 0.002]);
figure (4)
plot(t_PID,DPtie2_PID,'b','linewidth',2);hold on;
plot(t_NN,DPtie2_NN,'r','linewidth',2);grid on;
ylabel('DPtie1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.5 0.5]);
figure (5)
plot(t_PID,Df3_PID,'b','linewidth',2);hold on;
plot(t_NN,Df3_NN,'r','linewidth',2);grid on;
ylabel('DF1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.002 0.002]);
figure (6)
plot(t_PID,DPtie3_PID,'b','linewidth',2);hold on;
plot(t_NN,DPtie3_NN,'r','linewidth',2);grid on;
ylabel('DPtie1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.5 0.5]);
%==========================================================================
DPd1=0.3;
DPd2=0.1;
DPd3=0.01;
sim('LFC_PID');
sim('LFC_NN');
figure (7)
plot(t_PID,Df1_PID,'b','linewidth',2);hold on;
plot(t_NN,Df1_NN,'r','linewidth',2);grid on;
ylabel('DF1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.002 0.002]);
figure (8)
plot(t_PID,DPtie1_PID,'b','linewidth',2);hold on;
plot(t_NN,DPtie1_NN,'r','linewidth',2);grid on;
ylabel('DPtie1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.5 0.5]);
figure (9)
plot(t_PID,Df2_PID,'b','linewidth',2);hold on;
plot(t_NN,Df2_NN,'r','linewidth',2);grid on;
ylabel('DF1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.002 0.002]);
figure (10)
plot(t_PID,DPtie2_PID,'b','linewidth',2);hold on;
plot(t_NN,DPtie2_NN,'r','linewidth',2);grid on;
ylabel('DPtie1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.5 0.5]);
figure (11)
plot(t_PID,Df3_PID,'b','linewidth',2);hold on;
plot(t_NN,Df3_NN,'r','linewidth',2);grid on;
ylabel('DF1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.002 0.002]);
figure (12)
plot(t_PID,DPtie3_PID,'b','linewidth',2);hold on;
plot(t_NN,DPtie3_NN,'r','linewidth',2);grid on;
ylabel('DPtie1');
xlabel('time[s]');
legend('PID','NN');
axis([0 60 -0.5 0.5]);
%==========================================================================