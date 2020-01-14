

from flask import Flask, jsonify, request
from werkzeug.utils import secure_filename
from pymongo import MongoClient
from fastai.vision import*
from bson.json_util import dumps
from pathlib import Path
import json
import base64
import os

client = MongoClient('localhost',27017)
db = client['flowerDB']
flo = db.flowers

pathAI = Path('AI_Model')
learn = load_learner(pathAI)

app = Flask(__name__)
app.config["IMAGE-UPLOADS"] = 'C:/Users/pedro/OneDrive/Documentos/FlutterApps/FlowerApp/uploadedPhotos'

@app.route('/flowers')
def getInfo():
    j = json.loads(dumps(flo.find()))
    return jsonify(dumps(flo.find()))

@app.route('/flowers', methods=['POST'])
def getFlower():
    flower = request.json['name']
    returnList = json.loads(getFlowerData(flower))
    return returnList[0]


@app.route('/identify', methods=['POST'])
def indetifier():
    #print(request.form)
    #print(request.json['image']['$binary'])
    #print(request.form)
    data = request.form
    img = base64.b64decode(data['image'])
    #print(request.form[0])
    filename = secure_filename(data['name']);
    flower = ''
    path = Path(os.path.join(app.config['IMAGE-UPLOADS'], filename))
    with open(path,'wb') as f:
        f.write(img)
    

    f = open_image(path)
    flower = recognize(f)
    print(flower)
    os.remove(path)
    
    #send to the learner for prediction.
    returnList = json.loads(getFlowerData(str(flower)))
    #print(returnList[0])
    return jsonify(returnList[0])
    #return 'Hijueputa'

def getFlowerData(flower):
    flow = flo.find({'name': flower})
    #print(flow)
    return dumps(flow)

def recognize(img):
    pred_class,pred_idx,outputs = learn.predict(img)
    return pred_class


#Save the file in the PC and then use the AI method, after that delete the image.

if __name__ == '__main__':
    app.run(debug=False, port=4000, host='0.0.0.0')