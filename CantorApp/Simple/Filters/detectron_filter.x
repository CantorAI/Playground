from Galaxy import galaxy
import detectron_predictor deferred

class Detectron_Filter(galaxy.BaseFilter):
	inputPin:Pin = None
	outputPin:Pin = None
	detectron_ready = False
	predictor = None

	def Detectron_Filter():
		this.inputPin = this.NewInputPin()
		this.inputPin.setputcallback(this.OneFrame)
		this.outputPin = this.NewOutputPin()

	def OneFrame(frame):
		cantor = galaxy.cantor
		if not this.detectron_ready:
			gpuIndex = cantor.TakeFirstAvaibleResourceIndex("GPU")
			# gpuIndex =gpuIndex % 2
			print("detectrton filter,gpuIndex:",gpuIndex)
			print("Detectron2 is not ready,Loading")
			detectron_predictor.load()
			print("Detectron2 loaded")
			this.predictor = detectron_predictor.Predict(gpuIndex)
			this.detectron_ready = True
		img = frame.ToNdarray()
		detect_result = this.predictor.Inference(img)
		if detect_result != None:
			# his.predictor.show(img,"Detected")
			result_frame = galaxy.DataFrame()
			# keep same timestamp as input frame
			result_frame.NodeId_High = frame.NodeId_High
			result_frame.NodeId_Low = frame.NodeId_Low
			result_frame.startTime = frame.startTime
			result_frame.type = "Dect"
			result_frame.format1 = frame.format1 # w && h
			result_frame.data = to_bin(detect_result)
			this.outputPin.put(result_frame)
			print("OneFrame called with results")
		else:
			print("OneFrame called with result is None")
		cantor.CantorStatHit("Detectron_Filter_FPS")
