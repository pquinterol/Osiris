from fastai.vision import*
from pathlib import Path

pathAI = Path('AI_Model')
pathPhoto = Path('C:/Users/pedro/OneDrive/Documentos/FlutterApps/FlowerApp/osirisAI/FlowerDataset/20190902_152125.jpg')

learn = load_learner(pathAI)

img = open_image(pathPhoto)

pred_class,pred_idx,outputs = learn.predict(img)

print(pred_class)
