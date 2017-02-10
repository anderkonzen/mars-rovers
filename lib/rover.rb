require './lib/coordinate.rb'
require './lib/conversions.rb'

# The rover has a coordinate, which represents its current position in the plateau, and
# instructions, which will define the rovers's trajectory when activated.
class Rover
  include Conversions

  attr_reader :coordinate, :instructions, :plateau

  # TODO Check if the instructions contain valid letters
  def initialize(coordinate, instructions, plateau=nil)
    @coordinate = Coordinate(coordinate)
    @instructions = instructions.strip
    @plateau = plateau 
  end

  # TODO Improve comparison (maybe a set of valid values for movement?)
  # TODO Rover might try to move to a position already occupied by another rover
  def explore
    instructions.chars.each do |movement|
      coordinate.rotate(movement) if movement != 'M'
      coordinate.move if movement == 'M'
      check_plateau_boundary
    end
  end

  def current_coordinate
    coordinate
  end

  private

  def check_plateau_boundary
    return if @plateau == nil
    
    if coordinate.x > @plateau[0] || coordinate.y > @plateau[1]
      raise RuntimeError, "Rovers trying to go beyond plateau's boudary"
    end
  end
end

