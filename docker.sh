#!/bin/bash
arg_1="$1"
arg_2="$2"
arg_3="$3"

# should add a start prod

if [ "$arg_1" == "start" ] ; then

  # build web server container
  if [ "$arg_2" == "dev" ] || [ "$arg_2" == "test" ] || [ "$arg_2" == "prod" ] ; then
    echo "Build web server container"
    docker build -t livingmarkup -f docker/Dockerfile .
  else
    echo "Deployment environment required (dev, test, prod):"
    echo "sudo ./docker.sh start dev"
    exit
  fi

  # run web server for environment
  if [ "$arg_2" == "prod" ] ; then
    echo "Run web server for production environment"
  	docker run \
  	-p 80:80 \
  	-p 443:443 \
  	--name livingmarkup \
  	--env-file docker/env/prod.conf \
  	--volume $(pwd):/var/www \
  	--detach livingmarkup
  elif [ "$arg_2" == "test" ] ; then
    echo "Run web server for test environment"
  	docker run \
  	-p 80:80 \
  	-p 443:443 \
  	--name livingmarkup \
  	--env-file docker/env/test.conf \
  	--volume $(pwd):/var/www \
  	--detach livingmarkup
  elif [ "$arg_2" == "dev" ] ; then
    # mount local volume for rapid development
    echo "Run web server for development environment"
  	docker run \
  	-p 80:80 \
  	-p 443:443 \
  	--name livingmarkup \
  	--env-file docker/env/dev.conf \
  	--volume $(pwd):/var/www \
  	--detach livingmarkup
  fi

elif [ "$arg_1" == "stop" ] ; then

  echo "Stop web server container"
  docker stop livingmarkup
  echo "Remove web server container"
  docker rm livingmarkup

elif [ "$arg_1" == "shell" ]; then

  echo "Exec into web server"
  docker exec -it livingmarkup bash,

else

  echo "Pass argument 'stop' or 'start'"

fi