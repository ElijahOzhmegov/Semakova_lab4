% ======================================================================
%                        checking task 1
% 
% Made by ElijahOzmegov@gmail.com as a part of the fourth laboratory work
% 
% It represents checking task 1 in accordance with the request
% ======================================================================

% task 1
% disp('task one');
% disp(DHtransform(5,0,3,pi/2));

% task 2
% disp('task two');

[h1,~] = RPR_FK(0,   5,  0);
[h2,~] = RPR_FK(pi, -10, pi/2);

figure('Name','Three dimensional space', ...
       'Position',[400 500 860 640], ...
       'MenuBar','figure')

axes(   'NextPlot', 'add',...
        'XColor', [231, 76,  60]/255, ...
        'YColor', [52, 152, 219]/255, ...
        'ZColor', [46, 204, 113]/255, ...
        'Box', 'on', ...
        'XGrid', 'on', 'YGrid', 'on', 'ZGrid', 'on');
    
maxL = max(max([h1 h2])*1.1);
axis([-maxL maxL -maxL maxL])
    
xlabel('X Axis','FontSize',12,'FontWeight','bold','Color','k')
ylabel('Y Axis','FontSize',12,'FontWeight','bold','Color','k')
zlabel('Z Axis','FontSize',12,'FontWeight','bold','Color','k')

view(3)

plot3(h1(:,1), h1(:,2), h1(:,3),'o--'), hold on;
plot3(h2(:,1), h2(:,2), h2(:,3),'*-');