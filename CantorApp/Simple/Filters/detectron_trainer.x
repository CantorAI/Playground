# Trainner for detectron2
"""
    json_config needs to include keys:
        output_dir: str
        dataset_location: str
    json_params has same keys in return of GetParameters()
"""
import cantor

def Hook_Callback(evtType,evtData):
    # import cantor
    if evtType == "after_step":
        total_loss = evtData["total_loss"]
        eta_seconds = evtData["eta_seconds"]
        iteration_number = evtData["iteration_number"]
        # cantor.logV("total_loss",total_loss)
        # cantor_metrics = cantor.Metrics()
        # cantor_metrics.SetWordBook("detectron2.trainer","total_loss",total_loss)
        # print("loss:",total_loss,",eta:",eta_seconds,"it:",iteration_number)
    print("Hook_Callback",evtType,evtData)
def GetParameters():
    return """
        {
            "train_coco_json_filepath": "../../annotations/instances_train2017.json",
            "config_file": "configs/COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml",
            "weights": "detectron2://COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x/137849600/model_final_f10217.pkl",
            "num_workers": 2,
            "batch_size": 2,
            "learning_rate": 0.0025,
            "max_iter": 10,
            "roi_batch_size": 128,
            "roi_num_classes": 12
        }
        """
@cantor.Task()
def TrainMain(json_config,json_params):
    metrics_instanceId = "detectron2.trainer"
    print("TrainMain",json_config,json_params)
    from preload import cv2
    print("after import cv2")
    import detectron2Trainer
    print("after import detectron2Trainer, then start TrainMain")
    detectron2Trainer.TrainMain(json_config,json_params,False,Hook_Callback)

def Test():
    json_params = GetParameters()
    train_config ="""
        {
            "output_dir": "D:/Test/output",
            "dataset_location": "D:/ToGithub/CantorAI/Galaxy/train/coco/images/train2017"
        }
    """
    TrainMain.run(train_config,json_params)

# Test()
