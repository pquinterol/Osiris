from pathlib import Path
import os
import json

path = Path('FlowerDataset')

pathValid = path/'valid'
pathTrain = path/'train'
pathTest = path/'test'
count = 1


with open('cat_to_name.json','r') as f:
    cat_to_name = json.load(f)

for key,value in cat_to_name.items():
    os.rename('{}/{}'.format(pathValid,key),'{}/{}'.format(pathValid,value))

for key,value in cat_to_name.items():
    os.rename('{}/{}'.format(pathTest,key),'{}/{}'.format(pathTest,value))

for key,value in cat_to_name.items():
    os.rename('{}/{}'.format(pathTrain,key),'{}/{}'.format(pathTrain,value))