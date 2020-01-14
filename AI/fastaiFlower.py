

#from fastai import *
from fastai.vision import*
from fastai.metrics import error_rate
from pathlib import Path

path = Path('FlowerDataset')

path_valid = path/'valid'
path_train = path/'train'
path_test = path/'test'

bs = 64

data = ImageDataBunch.from_folder(path, ds_tfms= get_transforms(), size = 224, bs = bs, num_workers=0).normalize(imagenet_stats)

learn = cnn_learner(data, models.resnet34, metrics = error_rate)
#learn.lr_find()
#learn.unfreeze()
#learn.fit_one_cycle(2, slice(1e-06, 3e-4))
learn.fit_one_cycle(4)
learn.save('flowerRecog_v1')
learn.export()
defaults.device = torch.device('cpu')


img = open_image(path_test/'rose/image_01191.jpg')
pred_class,pred_idx,outputs = learn.predict(img)
print(pred_class)