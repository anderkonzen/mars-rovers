# This class represents the rover's position, including 2D coordinates in the plateau (x,y) and
# its orientation (north, south, east and west).
#
# Internally the position is represented as an array of two integer elements, and the orientation
# is represented as a char.
class Coordinate

  attr_reader :x, :y, :orientation

  ORIENTATION_LOOKUP_TABLE = {
    'NL' => 'W',
    'NR' => 'E',
    'SL' => 'E',
    'SR' => 'W',
    'EL' => 'N',
    'ER' => 'S',
    'WL' => 'S',
    'WR' => 'N'
  }

  # TODO Check for invalid coordinate argument
  # - coordinate has fewer/more than 3 values
  # - orientation has invalid value (N, S, E, W)
  # - improve initialize to receive array
  def initialize(coordinate)
    ary = coordinate.split
    @x = ary[0].strip.to_i
    @y = ary[1].strip.to_i
    @orientation = ary[2].strip.upcase
  end

  def rotate(direction)
    key = @orientation + direction
    @orientation = ORIENTATION_LOOKUP_TABLE[key]
  end

  def move
    case orientation
    when 'E' then @x = @x + 1
    when 'W' then @x = @x - 1
    when 'N' then @y = @y + 1
    when 'S' then @y = @y - 1
    end
  end

  def ==(other)
    return x == other.x && y == other.y && orientation == other.orientation
  end

  def to_a
    [x, y, orientation]
  end

  def to_s
    to_a.join(" ")
  end

  def to_coordinate
    self
  end

end
