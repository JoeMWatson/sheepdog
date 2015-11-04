classdef agent < matlab.mixin.SetGet
    %   Agent - Parent class of all active parts
    %   
    %   Dog and sheep both inherit from this class
    
    properties
        id;
        % Position expressed as a column vector in x and y
        position;
        % Heading is a 2x2 rotation matrix, must always be unit magnitude
        heading;
        % Fitness reflects the physical capabilities of an agent, value
        % between 0 and 1
        fitness;
    end
    
    properties(Abstract)
        type;
    end
    
    methods
        function ele = agent(id);
            ele.id=id;
            ele.position = [0 0]';
            ele.heading = [1 0]';
            ele.fitness = 0;
        end
        
        % Get position
        function locus = getPosition(object)
            locus = object.position;
        end
        
        % Set new position
        function setPosition(object,new_position)
            object.position = new_position;
        end
        
        % Rotate
        function rotate(object,rotation)
            new_heading = rotation*object.heading;
            object.heading = new_heading
        end
        
        % Move object forward
        function move(object,dt)
            new_position = object.position + object.heading*object.fitness*dt;
            object.setPosition(new_position);
        end
        
        % Get vector between two objects
        function separation = getVector(agent1,agent2)
            position1 = agent1.getPosition();
            position2 = agent2.getPosition();
            separation = position2 - position1;
        end
    end
    
end

