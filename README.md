# Mars Rovers Experiment

[![Build Status](https://travis-ci.org/anderkonzen/mars-rovers.svg?branch=master)](https://travis-ci.org/anderkonzen/mars-rovers)

This repository contains an implementation for the [Mars Rovers](https://github.com/BearchInc/code-challenge/blob/master/challenge2.md) challenge.

## How to run

The first step is to clone/download the code from this repository. The program does not use any external gems/libraries other then the core's ones, so I believe a ruby 2.4 installation will have everything to execute the code. But, in order to make it easier to run tests, two gems are used: rake and minitest.

The input data is expected to be in a file named `rover_data`, following the structure defined in the challenge description.

### Running with your local ruby installation

If you want to run the code locally using your ruby installation, you will need to install these two gems:

```shell
$> gem install rake minitest
```

To run the tests, you can execute `rake test` in your terminal just like the example below:

```shell
$> rake test
Run options: -p --seed 13327

# Running:

***************************

Fabulous run in 0.003633s, 7431.8745 runs/s, 9083.4021 assertions/s.

27 runs, 33 assertions, 0 failures, 0 errors, 0 skips
```

The program can be run by executing `ruby challenge.rb`:

```shell
$> ruby challenge.rb
1 3 N
5 1 E
```

### Running with docker

I added a small shell script to trigger the tests and the program using a docker image. This way you do not need to install ruby or other gems in your system. For example, to run the tests:

```shell
$> ./run.sh test
Run options: -p --seed 48808

# Running:

...........................

Fabulous run in 0.014911s, 1810.6908 runs/s, 2213.0665 assertions/s.

27 runs, 33 assertions, 0 failures, 0 errors, 0 skips
```

And to run the program:

```shell
$> ./run.sh challenge
1 3 N
5 1 E
```

You might need to change the file mode to be executable, ie., `chmod +x run.sh`, in order to run the script.

**Note**: The first time you run one of the above, docker will download the image (ruby:2.4.0-alpine) in case you don't have it already.

## Toughts about the problem

The problem is not hard by definition, but it has several points that need to be taken care of.

### Input

The rover data (plateau boundaries, rovers' positions and instructions) has a defined structure (see the description of the problem in the link at the top), but it might be eventually wrong in a production environment. Thus, it is necessary to perform some kind of validation of these data (negative values, invalid instructions, etc).

### Rover collision

Each rover will move in sequence, so it might happen one rover tries to move into a position already occupied by another rover. This would be terrible since it could damage the rovers. The rover must check if the next position is not occupied before trying to move, and stop (or signal an error) otherwise.

### Plateau boundaries

The rovers can only move inside the plateau's boundaries. But a wrong set of  instruction might lead a rover beyond of the boundaries. Thus, it is also necessary to check if the rover stays inside this boundaries while exploring Mars. 

## Implementation Notes

I used a few classes to represent all the entities involved. There is a Rover class, representing the rover itself. This class holds the rover position and instructions. The Coordinate class represents the position/orientation state of the rover, ie., it has the 2D position (x,y) of the rover in the plateau as well as the orientation. This part could be refactored to separate the orientation apart, so the position pair could be also used for the plateau boundary.

There is also a Conversions module to make it easier for entities to accept inputs in multiple formats (in this case I am using it to create a Coordinate from a string or another Coordinate).

I'm not happy with the input validation and parsing, since it is too simple and naive (only a readlines on the file). A parser class bould be handy in this case to perform the validation and deliver the correct objects (positions, etc) and also accept a custom file path.

## Questions about the challenge

The output of the experiment should be the position and orientation of the rovers. But it is not clear how to deal with exceptions that migh happen (invalid input, rovers colliding, etc).

## Production ready?

This first implementation does not have all the validations necessary for a production ready version. It misses a stronger input validation and rover collision detection.

Also, considering all these problems, a failure handling strategy could be added. Maybe using a few custom exceptions for input validation and rover movements.

Considering this program as a simulation tool, it should be enough having a file with input data to be processed. But the input strategy could also be improved, maybe having a web service with a public REST API, or just a web page that accepts different input/output formats.

