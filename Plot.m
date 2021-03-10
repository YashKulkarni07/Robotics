function []=Plot(base)

x=([base(1,1);base(1,2);base(1,3)]);
y=([base(2,1);base(2,2);base(2,3)]);
z=([base(3,1);base(3,2);base(3,3)]);
d=([base(1,4) base(2,4) base(3,4)]);
I=[1;1;1];

mini_coordinate=line([d(1)*I,d(1)+(x*0.25)]',[d(2)*I,d(2)+(y*0.25)]',[d(3)*I,d(3)+(z*0.25)]','Linewidth',1);
mini_coordinate(1).Color='red';
mini_coordinate(2).Color='green';
mini_coordinate(3).Color='blue';

plot3(d(1),d(2),d(3),'Marker','o','MarkerSize',10,'MarkerFaceColor', 'r','MarkerEdgeColor', 'r');
hold off
end


