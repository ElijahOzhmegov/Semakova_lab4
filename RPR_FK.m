function [pos, R03] = RPR_FK(th1, d2, th3)
% ======================================================================
%                                task 2
% 
% Made by ElijahOzmegov@gmail.com as a part of the fourth laboratory work
% 
% It represents getting 4 special points of existing robot
%
% -------------------------- Developer's notes -------------------------
% Dear future Ilia,
% 
% When you read this text, memrise that at first we rotate around  Z axis,
% but not X axis. It will solve all your problem.
%
% In the case, If you forget about this essential rule, hit yourslelf on
% your face (gently please).
% 
% Best regards,
% Your Irritation
% ----------------------------------------------------------------------
% How to use Denavit?Hartenberg transform function:
%
% theta -- around Z
% alpha -- around X
% 
% a - distance between Z axis
% d - distance between X axis
%
% DHtransform(a, alpha, d, theta)
% ======================================================================


a = 10;
b = 5;
gamma = pi/4;

R = [0; 0; 0; 1];

pos = zeros(4,4); % the coordinate space under number 0 cannot move

A01  = DHtransform(0,  pi + gamma,  a,   th1);
A12  = DHtransform(0, -pi/2,        d2, -pi/2);
A23h = DHtransform(b, -pi/2,        0,   th3 - gamma);
A3h3 = DHtransform(0, -pi/2,        0,  -pi/2); % I had to use this long way


A02 = round(A01*A12, 4);
A03 = round(A02*A23h*A3h3, 4);


pos(:,2) = A01*R;
pos(:,3) = A02*R;
pos(:,4) = A03*R;


R03 = A03;
pos = pos(1:3,:).';