%% Forward Kinematics for RRR robot
clc;clear all;clc
%% Graphing Necessites
xlabel("x-axis")
ylabel("y-axis")
grid on
xlim([-3 3]); 
ylim([-3 3]);
%% Initialize Video
myVideoRRR = VideoWriter('myVideoFileRRR.avi');
open(myVideoRRR)
hold on
%% Create the figure you want to plot everything on
figure(1) 
%% Create the mini-coordinate system based on D-H convention
origin=eye(4);
for t=1:180
    
    cla(gca);

    theta=(pi/6)*sin(t*pi/45);
    theta1=(pi/3)*sin(t*pi/45);
    theta2=(pi/2)*sin(t*pi/45);
    
    joint1=DHFunc(origin,theta,0,1,0);
    [H1,mini_coordinate1]=Plot2(joint1);
    hold on
    
    joint2=DHFunc(joint1,theta1,0,1,0);
    [H2,mini_coordinate2]=Plot2(joint2);
    hold on

    joint3=DHFunc(joint2,theta2,0,1,0);
    [H3,mini_coordinate3]=Plot2(joint3);
    hold on
%% Make Linkages between points
    Link1=plot([origin(1,4);joint1(1,4)],[origin(2,4);joint1(2,4)],'Color','k','linewidth',2);
    hold on

    Link2=line([joint1(1,4);joint2(1,4)],[joint1(2,4);joint2(2,4)],'Color','k','linewidth',2);
    hold on

    Link3=line([joint2(1,4);joint3(1,4)],[joint2(2,4);joint3(2,4)],'Color','k','linewidth',2);
    hold on
%% Get Frame
    frame = getframe(gcf);
    writeVideo(myVideoRRR, frame);
end
close(myVideoRRR)

