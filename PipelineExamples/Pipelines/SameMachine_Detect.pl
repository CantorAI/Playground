[
  {
    "ObjectType": "Pipeline",
    "Name": "SameMachine_Detect"
  },
  {
    "ObjectType": "Filter",
    "Type": "initiator",
    "InstanceName": "initiator",
    "Description": "initiator module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/initiator.png",
    "Frame": {
      "X": -0.5,
      "Y": 95.5,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [],
    "OutputPins": [
      {
        "Name": "Output"
      }
    ]
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "WinCapture",
    "Description": "ksvideosrc ! videoconvert ! jpegenc ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 51.0498412896938,
      "Y": 244.883252998487,
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
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Decoder",
    "Description": "galaxysrcfilter name=src1 ! jpegdec ! videoconvert ! video/x-raw,format=BGR ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 206.0,
      "Y": 37.5,
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
    "ObjectType": "Filter",
    "Type": "player",
    "InstanceName": "Lyric Player",
    "Description": "Playback module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/LyricPlayer.png",
    "Frame": {
      "X": 621.5,
      "Y": 213.0,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [
      {
        "Name": "Input"
      },
      {
        "Name": "Input2"
      }
    ],
    "OutputPins": []
  },
  {
    "ObjectType": "Filter",
    "Type": "Detectron2",
    "InstanceName": "Detectron2",
    "Description": "Detectron2",
    "Uri": "Applications/detectron2/detectron_filter.x|Detectron_Filter",
    "ImageUri": "images/Detectron2.webp",
    "Frame": {
      "X": 467.0,
      "Y": 28.5,
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
    "ObjectType": "Filter",
    "Type": "tee",
    "InstanceName": "tee",
    "Description": "",
    "Uri": "galaxy_forge",
    "ImageUri": "images/tee.png",
    "Frame": {
      "X": 319.8831942168921,
      "Y": 251.1165706567283,
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
      },
      {
        "Name": "Output2"
      }
    ]
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "initiator",
    "SourceFilter.X": -0.5,
    "SourceFilter.Y": 95.5,
    "SourcePin": "Output",
    "DestinationFilter": "WinCapture",
    "DestinationFilter.X": 51.0498412896938,
    "DestinationFilter.Y": 244.883252998487,
    "DestinationPin": "Input",
    "Conditions": "CaptureFromWindows == 1",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "WinCapture",
    "SourceFilter.X": 51.0498412896938,
    "SourceFilter.Y": 244.883252998487,
    "SourcePin": "Output",
    "DestinationFilter": "Decoder",
    "DestinationFilter.X": 206.0,
    "DestinationFilter.Y": 37.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Decoder",
    "SourceFilter.X": 206.0,
    "SourceFilter.Y": 37.5,
    "SourcePin": "Output",
    "DestinationFilter": "tee",
    "DestinationFilter.X": 319.8831942168921,
    "DestinationFilter.Y": 251.1165706567283,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 319.8831942168921,
    "SourceFilter.Y": 251.1165706567283,
    "SourcePin": "Output",
    "DestinationFilter": "tee",
    "DestinationFilter.X": 319.8831942168921,
    "DestinationFilter.Y": 251.1165706567283,
    "DestinationPin": "Output",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 319.8831942168921,
    "SourceFilter.Y": 251.1165706567283,
    "SourcePin": "Output",
    "DestinationFilter": "Detectron2",
    "DestinationFilter.X": 467.0,
    "DestinationFilter.Y": 28.5,
    "DestinationPin": "Input",
    "Conditions": "GPU = 1 and Detectron2 == 1",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Detectron2",
    "SourceFilter.X": 467.0,
    "SourceFilter.Y": 28.5,
    "SourcePin": "Output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 621.5,
    "DestinationFilter.Y": 213.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 319.8831942168921,
    "SourceFilter.Y": 251.1165706567283,
    "SourcePin": "Output2",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 621.5,
    "DestinationFilter.Y": 213.0,
    "DestinationPin": "Input2",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]