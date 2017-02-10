require 'minitest/autorun'
require 'rover.rb'

class TestRover < Minitest::Test

  def setup
    @coordinate = Coordinate.new('1 2 N')
    @instructions = 'LMLMLMLMM'
    @rover = Rover.new(@coordinate, @instructions)
  end

  def test_respond_to_explore
    assert_respond_to(@rover, :explore) 
  end

  def test_current_coordinate
    assert_equal(@coordinate, @rover.current_coordinate)
  end

  def test_explore_with_no_instructions
    coordinate = '0 0 N'
    rover = Rover.new(coordinate, '')
    rover.explore
    assert_equal(coordinate, rover.current_coordinate.to_s)
  end

  def test_explore_move_right
    coordinate = '0 0 N'
    rover = Rover.new(coordinate, 'RM')
    rover.explore
    assert_equal('1 0 E', rover.current_coordinate.to_s)
  end

  def test_explore_move_left
    coordinate = '1 0 N'
    rover = Rover.new(coordinate, 'LM')
    rover.explore
    assert_equal('0 0 W', rover.current_coordinate.to_s)
  end

end
