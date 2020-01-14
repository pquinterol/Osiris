from pymongo import MongoClient
import os
from pathlib import Path

client = MongoClient('localhost',27017)
db = client['flowerDB']
fs = db.flowers

x = fs.delete_many({})

print(x.deleted_count, 'documents deleted')