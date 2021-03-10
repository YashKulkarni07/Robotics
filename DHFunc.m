%% A unified DH matrix that combines both rotation and transformation in one matrix

function [DH]=DHFunc(H,theta,d,a,alpha)

T=[cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha)  a*cos(theta);
   sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);
   0          sin(alpha)             cos(alpha)            d;
   0          0                      0                     1];

DH=H*T;
end

