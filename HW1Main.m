%% Code allows the creation of a 3 link serial manipulator with flexible linkages based on rotation and translation matrices

clc;clear all;clc
%% Start by creating main coordinate system with red marker
figure(1)
Ori_Coord_Planex=quiver3([0;0;0],[0;0;0],[0;0;0],[0;0;0],[1;0;0],[0;0;0],0,'Color','g','linewidth',3,'Marker','o','MarkerSize',10,'MarkerFaceColor', 'r','MarkerEdgeColor', 'r');
hold on
Ori_Coord_Planey=quiver3([0;0;0],[0;0;0],[0;0;0],[1;0;0],[0;0;0],[0;0;0],0,'Color','r','linewidth',3,'Marker','o','MarkerSize',10,'MarkerFaceColor', 'r','MarkerEdgeColor', 'r');
hold on
Ori_Coord_Planez=quiver3([0;0;0],[0;0;0],[0;0;0],[0;0;0],[0;0;0],[1;0;0],0,'Color','b','linewidth',3,'Marker','o','MarkerSize',10,'MarkerFaceColor', 'r','MarkerEdgeColor', 'r');
hold on
%% Plot mini coordinates ( This section of the code takes in the necessary inputs and then rotates them and translates them for final answer)
origin=eye(4);

Joint1=Rotate(origin,'z',pi/4);
joint1=Translate(Joint1,'x',1);
disp(joint1);
Plot(joint1);
hold on

Joint2=Rotate(joint1,'y',-pi/2);
joint2=Translate(Joint2,'y',1);
disp(joint2);
Plot(joint2);
hold on

Joint3=Rotate(joint2,'z',pi/6);
joint3=Translate(Joint3,'x',1);
disp(joint3);
Plot(joint3);
hold on
%% Make Linkages between points
Link1=line([origin(1,4);joint1(1,4)],[origin(2,4);joint1(2,4)],[origin(3,4);joint1(3,4)],'Color','k','linewidth',2);
hold on

Link2=line([joint1(1,4);joint2(1,4)],[joint1(2,4);joint2(2,4)],[joint1(3,4);joint2(3,4)],'Color','k','linewidth',2);
hold on

Link3=line([joint2(1,4);joint3(1,4)],[joint2(2,4);joint3(2,4)],[joint2(3,4);joint3(3,4)],'Color','k','linewidth',2);
hold off
%% Graphing necessities 
grid on
xlabel("x-axis")
ylabel("y-axis")
zlabel("z-axis")
xlim([-0.5 1]); 
ylim([0 2]);
zlim([0 1]);
% view(30,45)
v = [1 -2 3];
[caz,cel] = view(v);
