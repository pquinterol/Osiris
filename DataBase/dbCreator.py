
from pymongo import MongoClient
import os
from pathlib import Path
import base64

client = MongoClient('localhost',27017)
db = client['flowerDB']
fs = db.flowers

path = Path('C:/Users/pedro/OneDrive/Documentos/FlutterApps/FlowerApp/osirisAI/FlowerDataset/test')

for dr in os.listdir(path):
    for fl in os.listdir(path/dr):

        #print(path/dr/fl,'\n')

        with open(path/dr/fl, 'rb')as fi:
          img = base64.b64encode(fi.read())

        print(img)

        f = {
            'image': img,
            'name': str(dr)
        }
        fs.insert_one(f)
        break



