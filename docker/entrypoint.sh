#!/usr/bin/env bash

export MOUNT_PATH=$NOTEBOOK_HOME/$RUNNING_USER
mkdir -p $MOUNT_PATH/notebooks/

export JUPYTERLAB_S3_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export JUPYTERLAB_S3_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

export PATH=$PATH:/home/root/.local/bin:/home/jupyter/.local/bin
jupyter-lab --ip=0.0.0.0 --no-browser --allow-root --notebook-dir=$MOUNT_PATH/notebooks/