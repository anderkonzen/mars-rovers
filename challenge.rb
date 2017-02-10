require './lib/mars_rovers.rb'

# Main script to exercise the MarsRovers experiment.
# The rover data should be made available in a file named 'rover_data'.

expedition = MarsRovers.new
expedition.upload_rover_data('rover_data')
expedition.activate_rovers
mars_data = expedition.collect_data

puts mars_data


