require 'helper.rb'
require 'coordinate.rb'
require 'conversions.rb'

class TestConversions < Minitest::Test

  def test_convert_string_to_coordinate
    coordinate = Conversions.Coordinate('1 2 N')
    assert_kind_of(Coordinate, coordinate) 
  end

  def test_convert_coordinate_to_coordinate
    coordinate = Coordinate.new('1 2 N')
    same = Conversions.Coordinate(coordinate)
    assert_same(same, coordinate)
  end

  def test_coordinate_raise_type_error
    assert_raises(TypeError) { Conversions.Coordinate(1) }
    assert_raises(TypeError) { Conversions.Coordinate(nil) }
    assert_raises(TypeError) { Conversions.Coordinate([]) }
  end

end 

