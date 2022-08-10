# The robot factory manufactures robots that have three possible
# movements:
# turn right
# turn left
# advance
# Robots are placed on a hypothetical infinite grid, facing a particular
# direction (north, east, south, or west) at a set of {x,y} coordinates,
# e.g., {3,8}.
# Robots can pivot left and right.
# The floor of the room is a grid, each square of which measures 1 square
# RU (Robot Unit).
# The robot receives a number of instructions, at which point the
# testing facility verifies the robot's new position, and in which
# direction it is pointing.
# The robot factory's test facility has a simulator which can take a
# string of letters and feed this into a robot as instructions.

class Robot
    # set robot's initial position
    def initialize
        @x = 0
        @y = 0
        @direction = "north"
    end
    # method to advance robot
    def advance
        if @direction == "north" then
            @y -= 1
        elsif @direction == "south" then
            @y += 1
        elsif @direction == "west" then
            @x -= 1
        elsif @direction == "east" then
            @x += 1
        end
    end
    # method to turn robot
    def turn instruction
        # make robot turn according to its current direction
        if @direction == "north" then
            if instruction == 'L' then
                @direction = "west"
            elsif instruction == 'R' then
                @direction = "east"
            end
        elsif @direction == "south" then
            if instruction == 'L' then
                @direction = "east"
            elsif instruction == 'R' then
                @direction = "west"
            end
        elsif @direction == "west" then
            if instruction == 'L' then
                @direction = "south"
            elsif instruction == 'R' then
                @direction = "north"
            end
        elsif @direction == "east" then
            if instruction == 'L' then
                @direction = "north"
            elsif instruction == 'R' then
                @direction = "south"
            end
        end
    end
end


def my_robot_simulator instructions
    # create Robot object
    robot = Robot.new

    # iterate through instructions, parse each letter
    (0..instructions.length-1).each do |i|
        if instructions[i] == 'A' then
            robot.advance()
            # puts "adv"
        elsif instructions[i] == 'L' || instructions[i] == 'R' then
            robot.turn(instructions[i])
            # puts robot.instance_variable_get("@direction")
        end
    end
    
    return "{x: #{robot.instance_variable_get("@x")}, y: #{robot.instance_variable_get("@y")}, bearing: '#{robot.instance_variable_get("@direction")}'}"
end

puts my_robot_simulator("RAARA")
