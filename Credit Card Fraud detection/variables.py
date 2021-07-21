import os
data_path = 'data/creditcard.csv'

# DNN parameters
dense1 = 1024
dense2 = 512
dense3 = 128
dense4 = 64
learning_rate = 0.001
batch_size = 64
num_epoches = 20
validation_split = 0.2
test_split = 0.1
keep_prob = 0.2
num_classes = 1

seed = 1234
negative_to_positive_ratio = 4

model_weights = 'data/weights/fraud_detection.h5'
model_converter = "data/weights/fraud_detection.tflite"
acc_img = "data/visualization/accuracy_comparison.png"
loss_img = "data/visualization/loss_comparison.png"
dot_img_file = "data/visualization/plot_model.png"
confusion_matrix_img = "data/visualization/confusion_matrix.png"
roc_img = "data/visualization/roc.png"
class_dict = {
            0 : "Non fradeulent",
            1 : "fradeulent"
            }
