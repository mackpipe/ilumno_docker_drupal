#!/bin/bash
# The environment variables found in the .env file are exported
export $(grep -v '^#' ilumno.env | xargs)

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " Start creating the image ${DOCKER_IMAGE}"
echo >&2
echo >&2 "========================================================================"


# Build the Image $ {DOCKER_IMAGE} using the Dockerfile
docker build -t "${DOCKER_IMAGE}" .

# Print the message to console
echo >&2 "========================================================================"
echo >&2
echo >&2 " Raise the Drupal and Mysql containers"
echo >&2
echo >&2 "========================================================================"

# Load the container with the image ${DOCKER_IMAGE} created by docker build
docker-compose -p "${DOCKER_CONTAINER}" --env-file ./ilumno.env up
