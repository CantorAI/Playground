import numpy as np
import multiprocessing as mp
import cv2
import torch
import os
from pathlib import Path
import json

import detectron2
from detectron2.data import MetadataCatalog
from detectron2.engine.defaults import DefaultPredictor
from detectron2.utils.visualizer import ColorMode, Visualizer
from detectron2.config import get_cfg
from detectron2.structures import Boxes, Keypoints,RotatedBoxes
from detectron2.data.detection_utils import read_image
print("after import detectron2")

def setup_cfg(cuda_device_index):
    confidence_threshold =0.5
    detectron_path = Path(os.path.dirname(os.path.realpath(detectron2.__file__)))
    config_path = detectron_path.parent
    config_file = os.path.join(config_path, "configs", "COCO-Keypoints","keypoint_rcnn_R_50_FPN_3x.yaml")
    opts =list(("MODEL.WEIGHTS","detectron2://COCO-Keypoints/keypoint_rcnn_R_50_FPN_3x/137849621/model_final_a6e10b.pkl"))
    cfg = get_cfg()
    #the default inference size is 800, seted by this MIN_SIZE_TEST
    cfg.INPUT.MIN_SIZE_TEST = 1080
    cfg.INPUT.MAX_SIZE_TEST = 2160
    cfg.merge_from_file(config_file)
    cfg.merge_from_list(opts)
    # cuda device set
    cfg.MODEL.DEVICE ='cuda:'+str(cuda_device_index)
    # Set score_threshold for builtin models
    cfg.MODEL.RETINANET.SCORE_THRESH_TEST = confidence_threshold
    cfg.MODEL.ROI_HEADS.SCORE_THRESH_TEST = confidence_threshold
    cfg.MODEL.PANOPTIC_FPN.COMBINE.INSTANCES_CONFIDENCE_THRESH = confidence_threshold
    cfg.freeze()
    return cfg

class Predict(object):
    def __init__(self,cuda_device_index):
        print("Predict Engine using (cuda) GPU:",cuda_device_index)
        cfg = setup_cfg(cuda_device_index)
        self.metadata = MetadataCatalog.get(
            cfg.DATASETS.TEST[0] if len(cfg.DATASETS.TEST) else "__unused"
        )
        self.cpu_device = torch.device("cpu")
        self.predictor = DefaultPredictor(cfg)
        self.predictions = None
    def LoadImage(self,path):
        img = read_image(path, format="BGR")
        return img

    def Inference(self, image):
        # bgr_image = cv2.cvtColor(image, cv2.COLOR_BGRA2BGR)
        # print("Inference:",image)
        res = None
        self.predictions = self.predictor(image)
        if "instances" in self.predictions:
            instances = self.predictions["instances"].to(self.cpu_device)
            res = self.parse_instance_predictions(instances)
        return res
    
    def convert_boxes(self,boxes):
        if isinstance(boxes, Boxes) or isinstance(boxes, RotatedBoxes):
            return boxes.tensor.numpy()
        else:
            return np.asarray(boxes)

    def convert_keypoints(self,keypoints):
        if isinstance(keypoints, Keypoints):
            keypoints = keypoints.tensor
        keypoints = np.asarray(keypoints)
        return keypoints

    def parse_instance_predictions(self,predictions):
        boxes = predictions.pred_boxes if predictions.has("pred_boxes") else None
        scores = predictions.scores if predictions.has("scores") else None
        classes = predictions.pred_classes if predictions.has("pred_classes") else None
        #labels = _create_text_labels(classes, scores, self.metadata.get("thing_classes", None))
        keypoints = predictions.pred_keypoints if predictions.has("pred_keypoints") else None
        boxes = self.convert_boxes(boxes)
        keypoints =self.convert_keypoints(keypoints)
        data ={
            "boxes":boxes.tolist(),
            "keypoints":keypoints.tolist(),
            "scores":np.asarray(scores).tolist(),
            "classes":np.asarray(classes).tolist()
            }
        json_data = json.dumps(data, indent=4)
        return json_data

    def show(self,img1,title):
        vis_output = None
        # Convert image from OpenCV BGR format to Matplotlib RGB format.
        visualizer = Visualizer(img1, self.metadata, instance_mode=ColorMode.IMAGE)
        if "panoptic_seg" in self.predictions:
            panoptic_seg, segments_info = self.predictions["panoptic_seg"]
            vis_output = visualizer.draw_panoptic_seg_predictions(
                panoptic_seg.to(self.cpu_device), segments_info
            )
        else:
            if "sem_seg" in self.predictions:
                vis_output = visualizer.draw_sem_seg(
                    self.predictions["sem_seg"].argmax(dim=0).to(self.cpu_device)
                )
            if "instances" in self.predictions:
                instances = self.predictions["instances"].to(self.cpu_device)
                vis_output = visualizer.draw_instance_predictions(predictions=instances)
        if vis_output != None:
            img_show =vis_output.get_image()[:, :, ::-1]
        else:
            img_show = img1
        cv2.imshow(title,img_show)
        cv2.waitKey(1)


def MakePredict(cuda_device_index):
    print("MakePredict")
    return Predict(cuda_device_index)

def DoPredict(predictor,img_path):
    print("DoPredict")
    img = predictor.LoadImage(img_path)
    data =  predictor.Inference(img)
    # predictor.show(img,"Test")
    print("After DoPredict")