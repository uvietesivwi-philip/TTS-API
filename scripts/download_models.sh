#!/bin/bash

mkdir -p models/capacitron-c50

curl -L https://www.dropbox.com/scl/fi/cs880h51mway2q2bozabu/model_file.pth?rlkey=codrgszadriq8qo35q4spu2ou&st=mpeka2yb&dl=1 -o models/capacitron-c50/model.pth
curl -L https://drive.google.com/uc?export=download&id=1mew-VJ9cfTq09H6Y8aW2FNrxPsCz6E57 -o models/capacitron-c50/config.json