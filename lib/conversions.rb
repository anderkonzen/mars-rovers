module Conversions
  module_function

  def Coordinate(*args)
    case args.first
    when ->(arg){ arg.respond_to?(:to_coordinate) }
      args.first.to_coordinate
    when String then
      Coordinate.new(*args.first)
    else
      raise TypeError, "Cannot convert #{args.inspect} to Coordinate"
    end
  end
end
