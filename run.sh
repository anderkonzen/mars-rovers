#!/bin/bash

if [[ -z $@ ]] ; then
  echo "No argument supplied."
  exit 1
fi
PARAMS=''

if [ $1 == "test" ] ; then
  PARAMS="rake test"
fi

if [ $1 == "challenge" ] ; then
  PARAMS="ruby challenge.rb"
fi

if [ "$PARAMS" != "" ] ; then
  docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:2.4.0-alpine $PARAMS
else
  echo "Valid arguments: 'test' or 'challenge'"
fi

