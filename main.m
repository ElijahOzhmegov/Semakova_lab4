% ======================================================================
%                        checking task 1
% 
% Made by ElijahOzmegov@gmail.com as a part of the fourth laboratory work
% 
% It represents checking task 1 in accordance with the request
% ======================================================================

% task 1
[h1,R1] = RPR_FK(0,   5,  0);
[h2,R2] = RPR_FK(pi, -10, pi/2);


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

% task 2 

h = [h1(end,:); h2(end,:)];
h_size = size(h);
for k=1:h_size(1)
    x = h(k,1);
    y = h(k,2);
    z = h(k,3);
    
    [q1, q2, q3] = RPR_IK(x,y,z, R1);
    
    fprintf('pos: \t %f %f %f\n', x, y,z);
    
    h3 = [];
    for i=1:length(q1)
        [h3,~] = RPR_FK(q1(i), q2(i), q3(i));
        plot3(h3(:,1), h3(:,2), h3(:,3));
    end
    fprintf('pos_ik:  %f %f %f\n\n', h3(end,:));
end

clear maxL