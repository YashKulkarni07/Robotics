function [TransH]=Translate(joint,axis,value)

if axis=='z'
    trans=[0 0 value]';
elseif axis=='y'
   trans=[0 value 0]';
else
    trans=[value 0 0]';
end

R=[1 0 0;0 1 0; 0 0 1];
H=[R trans;[0 0 0] 1];
TransH=joint*H;

end

