require './lib/rover.rb'

# This is the entry point class for the experiment. Rovers can receive data and be activated
# to start the exploration. Mars data from the rovers can be retrieved after all rovers
# perform their exploratory movements.
class MarsRovers

  attr_reader :output_data, :rovers 

  def initialize
    @output_data = []
    @rovers = []
  end

  def upload_rover_data(data_path)
    input_data = File.readlines(data_path)
    boundary = input_data[0].strip.split.map { |x| x.to_i }
    i = 1
    while i < input_data.count do
      rovers << Rover.new(input_data[i], input_data[i+1], boundary)
      i = i + 2
    end
  end

  def activate_rovers
    rovers.each do |rover|
      rover.explore
      @output_data << rover.current_coordinate
    end
  end

  def collect_data
    output_data
  end
end
