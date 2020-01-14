from tensorflow.python.keras import models, layers, optimizers
from tensorflow.python.keras.applications.resnet50 import ResNet50, preprocess_input, decode_predictions
from tensorflow.python.keras.preprocessing import image
import tensorflow as tf
#from pathlib import Path

#path = Path('FlowerDataset')

#TRAIN_DIR = path/'train'
#TEST_DIR = path/'test'
#VALID_DIR =path/'valid'

TRAIN_DIR = 'FlowerDataset/train/'
TEST_DIR = 'FlowerDataset/test/'
VALID_DIR = 'FlowerDataset/valid/'

T_BATCH_SIZE = 64
V_BATCH_SIZE = 64

model = ResNet50(weights = "imagenet", input_shape=(224,224,3))

for layer in model.layers[:-1]:
    layer.trainable = False

new_model = models.Sequential()
new_model.add(model)
#new_model.add(layers.Flatten())
new_model.add(layers.Dense(2,activation= 'softmax'))

new_model.summary()

train_datagen = image.ImageDataGenerator()
val_datagen = image.ImageDataGenerator()

train_generator = train_datagen.flow_from_directory(
    TRAIN_DIR,
    target_size= (224,224),
    batch_size=T_BATCH_SIZE
)

valid_generator = val_datagen.flow_from_directory(
    VALID_DIR,
    target_size=(224,224),
    batch_size=V_BATCH_SIZE
)

opt = optimizers.Adagrad()

new_model.compile(
    loss= 'sparse_categorical_crossentropy',
    optimizer=opt,
    metrics= ['accuracy']
)

new_model.fit_generator(
    train_generator,
    steps_per_epoch= train_generator.samples/train_generator.batch_size,
    epochs= 30,
    validation_data= valid_generator,
    validation_steps= valid_generator.samples/valid_generator.batch_size,
    verbose= 1,
)

new_model.save('trained_models/resnet50{}v1.h5'.format(opt))

