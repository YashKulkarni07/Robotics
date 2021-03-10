%% Forward Kinematics for RRP robot based on DH convention

clc;clear all;clc
%% Graphing necessities 
grid on
xlabel("x-axis")
ylabel("y-axis")
zlabel("z-axis")
xlim([-2 2]); 
ylim([-2 2]);
zlim([0 3]);
v = [1 -1 3];
[caz,cel] = view(v);
%% Initialize Video
myVideoRRP = VideoWriter('myVideoFileRRP.avi');
open(myVideoRRP)
hold on
%% Create the figure you want to plot everything on
figure(1)
%% Create the mini-coordinate system based on D-H convention
origin=eye(4);
for t=1:180

    cla(gca);
    
    theta=(pi/6)*sin(t*pi/45);
    theta1=(pi/6)*sin(t*pi/45)-1;
    tran=1+0.75*sin(t*pi/45);
    
    joint1=DHFunc(origin,theta,1,0,pi/2);
    [H1,mini_coordinate1]=Plot2(joint1);
    hold on
    
    joint2=DHFunc(joint1,theta1,0,0,-pi/2);
    [H2,mini_coordinate2]=Plot2(joint2);
    hold on

    joint3=DHFunc(joint2,0,tran,0,0);
    [H3,mini_coordinate3]=Plot2(joint3);
    hold on
%% Make Linkages between points
    Link1=line([origin(1,4);joint1(1,4)],[origin(2,4);joint1(2,4)],[origin(3,4);joint1(3,4)],'Color','k','linewidth',1.75);    
    hold on

    Link2=line([joint1(1,4);joint2(1,4)],[joint1(2,4);joint2(2,4)],[joint1(3,4);joint2(3,4)],'Color','k','linewidth',1.75);
    hold on

    Link3=line([joint2(1,4);joint3(1,4)],[joint2(2,4);joint3(2,4)],[joint2(3,4);joint3(3,4)],'Color','k','linewidth',1.75);
    hold on
%% Get Frame
    frame = getframe(gcf);
    writeVideo(myVideoRRP, frame);
end
close(myVideoRRP)
