classdef sheep < agent
    %   sheep - Class representing the 'sheep' or 'prey'
    
    properties
        type = 1;
        
        % Set weightings for target priorities
        dog_priority = 1;
        wall_priority = 2;
    end 
    
    methods
        function ele = sheep(id)
            % Calls the agent constructor
            ele = ele@agent(id);
            ele.type = 0;
            
            % Assign sheep fitness, including randomness
            stochast = normrnd(0.5,0.25);
            ele.fitness = stochast;
            
            % Position sheep, including randomness
            ele.position = rand(2,1);
        end
        
        function shepherd(object,pack,timestep)
            bearing = [0 0]';
            
            % Get vectors to herd of agents // CURRENTLY NO OTHER DOGS
            for i = 1:length(pack)
                temp = this.getVector(pack(i));
                bearing = bearing + object.get.dog_priority*temp*(abs(temp)^-2);
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

