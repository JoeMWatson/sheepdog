% Sheepdog Simulator 4M20 Robotics

% Initialise
% N = input('How many sheep de ye wante ladde?\n');

% define agents
s = sheep(1);
d = dog(1);

% Index and timestep
t=1;
dt=0.1;

%Figure
fig=figure('Name','Simulator');
    hold on
    % Hide and set axis
    axis([-50,50,-50,50])
    set(findobj(gcf, 'type','axes'), 'Visible','off')
    % Background colour
    set(gcf, 'Color', [0.4,1,0.4]);
    
    % Plot
    while(1)
        s.move(dt)
        d.move(dt)
        rectangle('Position',[-100,-100,200,200],'FaceColor',[0.4,1,0.4],'EdgeColor',[0.4,1,0.4])
        plot(s.position(1),s.position(2),'.w', 'MarkerSize',10)
        plot(d.position(1),d.position(2),'.k', 'MarkerSize',20)
        pause(0.001);
        t=t+1;

        if ~ishghandle(fig) %Kill loop when closing figure
            break
        end
    end