# !/bin/bash

exec docker-compose kill & \
sleep 5 && \
yes | docker container prune
yes | docker system prune
yes | docker volume prune
