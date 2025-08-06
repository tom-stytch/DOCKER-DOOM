#!/bin/bash -e
aws-vault exec prod-admin -- aws ecr get-login-password | docker login --username AWS --password-stdin 928657068455.dkr.ecr.us-west-2.amazonaws.com
docker run -p 8080:8080 928657068455.dkr.ecr.us-west-2.amazonaws.com/tommydeleteme:latest
