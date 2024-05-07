[
  {
    "ObjectType": "Pipeline",
    "Name": "Detect_Template"
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Image Decoder",
    "Description": "galaxysrcfilter ! decodebin ! videoconvert ! video/x-raw,format=BGR ! galaxyrecvfilter\r\n",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": -137.7057108856724,
      "Y": 13.586893884492603,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [
      {
        "Name": "Input"
      }
    ],
    "OutputPins": [
      {
        "Name": "output"
      }
    ]
  },
  {
    "ObjectType": "Filter",
    "Type": "Detectron2",
    "InstanceName": "Object  Dectector",
    "Description": "Detectron2",
    "Uri": "Applications/detectron2/detectron_filter.x|Detectron_Filter",
    "ImageUri": "images/Detectron2.webp",
    "Frame": {
      "X": 97.72875920091681,
      "Y": 16.25356204414789,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [
      {
        "Name": "input"
      }
    ],
    "OutputPins": [
      {
        "Name": "output"
      }
    ]
  },
  {
    "ObjectType": "Filter",
    "Type": "tee",
    "InstanceName": " EndPoint",
    "Description": "",
    "Uri": "galaxy_forge",
    "ImageUri": "images/tee.png",
    "Frame": {
      "X": 321.1781307127494,
      "Y": 17.683841688081856,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [
      {
        "Name": "Input"
      }
    ],
    "OutputPins": [
      {
        "Name": "Output"
      }
    ]
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Image Decoder",
    "SourceFilter.X": -137.7057108856724,
    "SourceFilter.Y": 13.586893884492603,
    "SourcePin": "output",
    "DestinationFilter": "Object  Dectector",
    "DestinationFilter.X": 97.72875920091681,
    "DestinationFilter.Y": 16.25356204414789,
    "DestinationPin": "input",
    "Conditions": "GPU = 1 and Detectron2 == 1",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Object  Dectector",
    "SourceFilter.X": 97.72875920091681,
    "SourceFilter.Y": 16.25356204414789,
    "SourcePin": "output",
    "DestinationFilter": " EndPoint",
    "DestinationFilter.X": 321.1781307127494,
    "DestinationFilter.Y": 17.683841688081856,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Image Decoder",
    "SourceFilter.X": -137.7057108856724,
    "SourceFilter.Y": 13.586893884492603,
    "SourcePin": "Input",
    "DestinationFilter": "Image Decoder",
    "DestinationFilter.X": -137.7057108856724,
    "DestinationFilter.Y": 13.586893884492603,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]