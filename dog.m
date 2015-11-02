classdef dog < agent
    %   DOG - Class representing the 'sheepdogs' or 'predators'
    
    properties
        type = 0;
        
        % Set weightings for target priorities
        sheep_priority = 1;
        wall_priority = 2;
    end 
    
    methods
        function ele = dog(id)
            % Calls the agent constructor
            ele = ele@agent(id);
            ele.type = 0;
            
            % Assign dog fitness
            ele.fitness = 1;
            
            % Position dog
            ele.position = [0.5 0.5]';
        end
        
        function shepherd(object,herd,timestep)
            bearing = [0 0]';
            
            % Get vectors to herd of agents // CURRENTLY NO OTHER DOGS
            for i = 1:length(herd)
                temp = this.getVector(herd(i));
                bearing = bearing + object.get.sheep_priority*temp*(abs(temp)^-2);
            end
            
            % Get wall properties
            % Currently square box
            locus = object.get.position;
            
            % Check x direction
            if locus(1) < 0.1
                bearing = bearing + object.get.wall_priority*[1 0]';
            elseif locus(1) > 0.9
                bearing = bearing + object.get.wall_priority*[-1 0]';
            end
            
            % Check y direction
            if locus(2) < 0.1
                bearing = bearing + object.get.wall_priority*[0 1]';
            elseif locus(2) > 0.9
                bearing = bearing + object.get.wall_priority*[0 -1]';
            end
            
            % Normalise bearing
            bearing = bearing/abs(bearing);
            
            % Update heading
            object.heading = (object.heading + bearing)/2;
            
            % Step forward
            object.move(timestep);
        end
    end
end