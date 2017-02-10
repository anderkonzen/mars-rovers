require 'helper.rb'
require './lib/coordinate.rb'

class TestCoordinate < Minitest::Test

  def setup
    @coordinate = Coordinate.new('1 2 N')
  end

  def test_to_a
    assert_equal([1, 2, 'N'], @coordinate.to_a)
  end

  def test_to_s
    assert_equal('1 2 N', @coordinate.to_s)
  end

  def test_to_coordinate
    other = @coordinate.to_coordinate
    assert_same(other, @coordinate)
  end

  def test_equality_ok
    assert_equal(Coordinate.new('4 7 S'), Coordinate.new('4 7 S'))
  end

  def test_equality_nok_x
    refute_equal(Coordinate.new('1 2 E'), Coordinate.new('5 2 E')) 
  end
  
  def test_equality_nok_y
    refute_equal(Coordinate.new('1 2 E'), Coordinate.new('1 9 E')) 
  end

  def test_equality_nok_orientation
    refute_equal(Coordinate.new('1 2 E'), Coordinate.new('1 2 S')) 
  end

  def test_rotate_NR
    coordinate = Coordinate.new('1 2 N')
    coordinate.rotate('R')
    assert_equal('E', coordinate.orientation)
  end

  def test_rotate_NL
    coordinate = Coordinate.new('1 2 N')
    coordinate.rotate('L')
    assert_equal('W', coordinate.orientation)
  end

  def test_rotate_SR
    coordinate = Coordinate.new('1 2 S')
    coordinate.rotate('R')
    assert_equal('W', coordinate.orientation)
  end

  def test_rotate_SL
    coordinate = Coordinate.new('1 2 S')
    coordinate.rotate('L')
    assert_equal('E', coordinate.orientation)
  end
  
  def test_rotate_ER
    coordinate = Coordinate.new('1 2 E')
    coordinate.rotate('R')
    assert_equal('S', coordinate.orientation)
  end

  def test_rotate_EL
    coordinate = Coordinate.new('1 2 E')
    coordinate.rotate('L')
    assert_equal('N', coordinate.orientation)
  end

  def test_rotate_WR
    coordinate = Coordinate.new('1 2 W')
    coordinate.rotate('R')
    assert_equal('N', coordinate.orientation)
  end
  
  def test_rotate_WL
    coordinate = Coordinate.new('1 2 W')
    coordinate.rotate('L')
    assert_equal('S', coordinate.orientation)
  end

  def test_move_N
    coordinate = Coordinate.new('1 1 N')
    coordinate.move
    assert_equal(1, coordinate.x)
    assert_equal(2, coordinate.y)
  end

  def test_move_S
    coordinate = Coordinate.new('1 1 S')
    coordinate.move
    assert_equal(1, coordinate.x)
    assert_equal(0, coordinate.y)
  end
 
  def test_move_E
    coordinate = Coordinate.new('1 1 E')
    coordinate.move
    assert_equal(2, coordinate.x)
    assert_equal(1, coordinate.y)
  end

  def test_move_W
    coordinate = Coordinate.new('1 1 W')
    coordinate.move
    assert_equal(0, coordinate.x)
    assert_equal(1, coordinate.y)
  end

end
