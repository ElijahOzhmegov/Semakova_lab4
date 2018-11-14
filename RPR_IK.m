function [q1, q2, q3] = RPR_IK(x,y,z, R03)
% ======================================================================
%                               task 2
% 
% Made by ElijahOzmegov@gmail.com as a part of the fourth laboratory work
% 
% There was a requirement about the parameters of function, R03 is 
% useless. However, I also suppose that I didn't solved the lab as used
% wrong way 
% ======================================================================

q2 = d2(x,y,z);
q2 = q2(imag(q2)==0);
q3 = theta3(q2, x,y,z);

q1 = theta1(q2, x,y);