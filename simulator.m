% Sheepdog Simulator 4M20 Robotics

% Initialise
NSheep = input('How many sheep de ye wante ladde?\n');

% define agents
herd = sheep.empty(NSheep,0);
pack = dog.empty(1,0);
for i=1:NSheep
    herd(i)=sheep(i);
end
pack(1) = dog(1);

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
        for i=1:NSheep
              herd(i).shepherd(pack,dt);
        end
        pack(1).shepherd(herd,dt))
        rectangle('Position',[-100,-100,200,200],'FaceColor',[0.4,1,0.4],'EdgeColor',[0.8,0.8,0.1],'LineWidth',5)
        for i=1:NSheep
            plot(herd(i).position(1),herd(i).position(2),'.w', 'MarkerSize',25)
        end
        plot(pack(1).position(1),pack(1).position(2),'.k', 'MarkerSize',10)
        pause(0.001);
        t=t+1;

        if ~ishghandle(fig) %Kill loop when closing figure
            break
        end
    end