#!/bin/bash

echo Preparing content for user home...

# create symlink to /mnt
if [ ! -e /home/jovyan/mnt ]; then
  ln -s /mnt /home/jovyan/
fi

# create symlink to /media
if [ ! -e /home/jovyan/media ]; then
  ln -s /media /home/jovyan/
fi

# Start jupyter service
jupyter notebook --notebook-dir=/home/jovyan \
                 --ip 0.0.0.0 \
                 --no-browser \
                 --allow-root \
                 --NotebookApp.password="$NOTEBOOK_PASSW_SHA1" \
                 --NotebookApp.token="$NOTEBOOK_TOKEN" \
                 --NotebookApp.allow_password_change=True \
                 --NotebookApp.default_url="/lab"
