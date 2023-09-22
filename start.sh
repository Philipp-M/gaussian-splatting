#!/usr/bin/env bash
docker build -t gaussian-splatting-3d .
xhost local:root
docker run --gpus 1 --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/models:/workspace/gaussian-splatting/models \
                      -e "DISPLAY=:0" -e "NVIDIA_DRIVER_CAPABILITIES=compute,utility,graphics" gaussian-splatting-3d:latest bash
