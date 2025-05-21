#!/bin/bash

# Create model directory
mkdir -p models/blizzard2013

# Download model files (adjust URLs if needed)
wget -O models/blizzard2013/config.json https://drive.google.com/uc?export=download&id=1mew-VJ9cfTq09H6Y8aW2FNrxPsCz6E57
wget -O models/blizzard2013/model.pth  https://www.dropbox.com/scl/fi/cs880h51mway2q2bozabu/model_file.pth?rlkey=codrgszadriq8qo35q4spu2ou&st=mpeka2yb&dl=1
