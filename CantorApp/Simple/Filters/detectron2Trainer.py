import argparse,os,torch,json
import cv2
import detectron2
from detectron2.data.datasets import register_coco_instances
from detectron2.engine import DefaultTrainer, HookBase
from detectron2.config import get_cfg
from detectron2.utils.logger import setup_logger
from detectron2.utils.events import get_event_storage

torch.cuda.empty_cache()

setup_logger()

os.environ['CUDA_LAUNCH_BLOCKING']='1'

def to_int(value):
    try:
        return int(value)
    except ValueError:
        return value

def to_float(value):
    try:
        return float(value)
    except ValueError:
        return value
    
def BuildCfg(paras):
    cfg = get_cfg()
    cfg.merge_from_file(
        paras.get('config-file')
    )
    cfg.DATASETS.TRAIN = (paras.get('dataset'),)
    cfg.DATASETS.TEST = ()  # no metrics implemented for this dataset
    cfg.DATALOADER.NUM_WORKERS = paras.get('num_workers')
    cfg.MODEL.WEIGHTS = paras.get('weights')
    cfg.OUTPUT_DIR = paras.get('output_dir')
    cfg.SOLVER.IMS_PER_BATCH = to_int(paras.get('batch_size'))
    cfg.SOLVER.BASE_LR = to_float(paras.get('learning_rate'))
    cfg.SOLVER.MAX_ITER = to_int(paras.get('max_iter'))
    cfg.MODEL.ROI_HEADS.BATCH_SIZE_PER_IMAGE = to_int(paras.get('roi_batch_size'))
    cfg.MODEL.ROI_HEADS.NUM_CLASSES = to_int(paras.get('roi_num_classes')) 

    os.makedirs(cfg.OUTPUT_DIR, exist_ok=True)
    return cfg

def ExtractMetrics(metric_full):
    keys_to_extract = ['eta_seconds', 'time', 'total_loss', 'lr']
    selected_metrics = {}
    iteration_number = None
    for key in keys_to_extract:
        if key in metric_full:
            value, iteration = metric_full[key]
            selected_metrics[key] = value
            if iteration_number is None:  # Assign once
                iteration_number = iteration
    if iteration_number is not None:
        selected_metrics['iteration_number'] = iteration_number
    return selected_metrics

class TrainHook(HookBase):
    def __init__(self,callback=None):
        self.callback = callback
        pass

    def before_train(self):
        ev=get_event_storage()
        latest_metric = ev.latest()
        select_metrics = ExtractMetrics(latest_metric)
        self.callback('before_train',select_metrics)
        pass

    def after_train(self):
        ev=get_event_storage()
        latest_metric = ev.latest()
        select_metrics = ExtractMetrics(latest_metric)
        self.callback('after_train',select_metrics)
        pass

    def before_step(self):
        ev=get_event_storage()
        latest_metric = ev.latest()
        select_metrics = ExtractMetrics(latest_metric)
        self.callback('before_step',select_metrics)
        pass

    def after_step(self):
        ev=get_event_storage()
        latest_metric = ev.latest()
        select_metrics = ExtractMetrics(latest_metric)        
        self.callback('after_step',select_metrics)
        pass

def TrainMain(train_config,jsonParameters,resume,callback=None):
    # get detectron2 root path for config file
    init_file_path = detectron2.__file__
    init_dir_path = os.path.dirname(init_file_path)
    detectron2_root = os.path.dirname(init_dir_path)
    print("Training Start,detectron2 root:",detectron2_root)

    config_params = json.loads(train_config)
    dataset_location = "./"
    output_dir = "./"
    if 'dataset_location' in config_params:
        dataset_location = config_params['dataset_location']
    if 'output_dir' in config_params:
        output_dir = config_params['output_dir']
        
    parser = argparse.ArgumentParser(description="Train")
    
    paras = json.loads(jsonParameters)
    config_file = "configs/COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml"
    if 'config_file' in paras:
        config_file = paras['config_file']
    train_coco_json_filepath = ""
    if 'train_coco_json_filepath' in paras:
        train_coco_json_filepath = paras['train_coco_json_filepath']

    config_file_path = os.path.join(detectron2_root, config_file)
    parser.add_argument("--config_file",default=config_file_path)
    args = parser.parse_args()

    # config dataset
    dataset_name ="default"    
    paras['dataset'] =  dataset_name
    paras['output_dir'] = output_dir
    paras['config-file'] = args.config_file
    train_coco_json_filefullpath = os.path.join(dataset_location,train_coco_json_filepath)
    register_coco_instances(dataset_name, {}, train_coco_json_filefullpath, dataset_location)
    
    cfg = BuildCfg(paras)
    trainer = DefaultTrainer(cfg)
    trainer.register_hooks([ TrainHook(callback),])
    trainer.resume_or_load(resume=resume)
    trainer.train()

if __name__ == "__main__":
    def callback(event,msg):
        print("callback:",event,msg)
    json_params ="""
        {
            "train_coco_json_filepath": "../../annotations/instances_train2017.json",
            "config_file": "configs/COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml",
            "weights": "detectron2://COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x/137849600/model_final_f10217.pkl",
            "num_workers": 2,
            "batch_size": 2,
            "learning_rate": 0.0025,
            "max_iter": 2500,
            "roi_batch_size": 128,
            "roi_num_classes": 12
        }
    """
    train_config ="""
        {
            "output_dir": "D:/Test/output",
            "dataset_location": "D:/ToGithub/CantorAI/Galaxy/train/coco/images/train2017"
        }
    """
    TrainMain(train_config,json_params,False,callback)
    pass