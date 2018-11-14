% ======================================================================
%            solving inverse kinematic problem for unique robot
% 
% Made by ElijahOzmegov@gmail.com as a part of the fourth laboratory work
% 
% ======================================================================
clc; clear;
% provided by unique robot
a = 10;
b = 5;
gamma = pi/4;

syms x y z d2 theta3

% stage one
r0 = sqrt(x^2 + y^2);
z0 = z;

% stage two
z1 = -d2*cos(gamma) + a;
r1 =  d2*sin(gamma);
eqn = (z1 - z0)^2 + (r1 - r0)^2 == b^2;

% stage three, finding d2 parameter
% there is no need to solve it manually, because we have computers 
% for that
d2 = solve(eqn, d2);

% stage four, finding theta3 parameter
del_x = r0 - r1;
del_y = z0 - z1;

theta3 = atan2(del_y, del_x);

% stage five, finding theta1 parameter
theta1 = atan2(x, y);
theta1 = [theta1; theta1 - pi];

% final stage, creating numeric functions
theta3 = matlabFunction(theta3,'File','theta3');
d2     = matlabFunction(d2    ,'File','d2');
theta1 = matlabFunction(theta1,'File','theta1');