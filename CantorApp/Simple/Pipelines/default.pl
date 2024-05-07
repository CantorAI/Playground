[
  {
    "ObjectType": "Pipeline",
    "Name": "default"
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Image Decoder",
    "Description": "galaxysrcfilter ! decodebin ! videoconvert ! video/x-raw,format=BGR ! galaxyrecvfilter\r\n",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": -110.2057108856724,
      "Y": 25.086893884492603,
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
    "Type": "Detectron2",
    "InstanceName": "Object  Dectector",
    "Description": "Detectron2",
    "Uri": "Applications/detectron2/detectron_filter.x|Detectron_Filter",
    "ImageUri": "images/Detectron2.webp",
    "Frame": {
      "X": 113.22875920091681,
      "Y": 28.25356204414789,
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
    "InstanceName": "EndPoint",
    "Description": "",
    "Uri": "galaxy_forge",
    "ImageUri": "images/tee.png",
    "Frame": {
      "X": 336.6781307127494,
      "Y": 42.683841688081856,
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
        "Name": "Output"
      }
    ]
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Image Decoder",
    "SourceFilter.X": -110.2057108856724,
    "SourceFilter.Y": 25.086893884492603,
    "SourcePin": "output",
    "DestinationFilter": "Object  Dectector",
    "DestinationFilter.X": 113.22875920091681,
    "DestinationFilter.Y": 28.25356204414789,
    "DestinationPin": "input",
    "Conditions": "GPU = 1 and Detectron2 == 1",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Object  Dectector",
    "SourceFilter.X": 113.22875920091681,
    "SourceFilter.Y": 28.25356204414789,
    "SourcePin": "output",
    "DestinationFilter": "EndPoint",
    "DestinationFilter.X": 336.6781307127494,
    "DestinationFilter.Y": 42.683841688081856,
    "DestinationPin": "input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  }
]