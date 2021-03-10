function[RotH]=Rotate(joint,axis,theta)

if axis=='x'
rot=[1 0 0; 0 cos(theta) -sin(theta) ; 0 sin(theta) cos(theta)];
elseif axis=='y'
rot=[cos(theta) 0 sin(theta); 0 1 0 ;-sin(theta) 0 cos(theta)];
else
rot=[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0 ; 0 0 1 ];
end

d=[0;0;0];
H=[rot d;[0 0 0] 1];
RotH=joint*H;

end