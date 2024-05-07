[
  {
    "ObjectType": "Pipeline",
    "Name": "Video-Query"
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Video Input",
    "Description": "",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": -89.80344617740974,
      "Y": 61.651295652099066,
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
    "Type": "IPCamera",
    "InstanceName": "IPCamera",
    "Description": "IP Camera for Security",
    "Uri": "IP_Camera",
    "ImageUri": "images/IPCamera.webp",
    "Frame": {
      "X": -58.09605007529035,
      "Y": 210.43391214366216,
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
    "Type": "VideoToToken",
    "InstanceName": "VideoToToken",
    "Description": "",
    "Uri": "galaxy_llmAgent",
    "ImageUri": "images/yolo4.jpg",
    "Frame": {
      "X": 395.6774338831669,
      "Y": 144.14130824578157,
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
    "OutputPins": [
      {
        "Name": "Output"
      }
    ]
  },
  {
    "ObjectType": "Filter",
    "Type": "llmAgent",
    "InstanceName": "llmAgent",
    "Description": "",
    "Uri": "galaxy_llmAgent",
    "ImageUri": "images/apple.webp",
    "Frame": {
      "X": 574.0261382310678,
      "Y": 147.0699118442225,
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
    "Type": "prompt",
    "InstanceName": "Query",
    "Description": "",
    "Uri": "galaxy_llmAgent",
    "ImageUri": "images/apple.webp",
    "Frame": {
      "X": 526.6674464768494,
      "Y": 360.5561004500204,
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
    "Type": "player",
    "InstanceName": "player",
    "Description": "Playback module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/LyricPlayer.png",
    "Frame": {
      "X": 780.6042104658276,
      "Y": 223.75888306731417,
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
    "Uri": "Detectron_Filter",
    "ImageUri": "images/Detectron2.webp",
    "Frame": {
      "X": 192.5,
      "Y": 44.0,
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
    "Type": "Sam",
    "InstanceName": "Sam",
    "Description": "Segment Anything from Facebook",
    "Uri": "Sam",
    "ImageUri": "images/sam.png",
    "Frame": {
      "X": 140.50764797576937,
      "Y": 187.8202266862849,
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
    "SourceFilter": "VideoToToken",
    "SourceFilter.X": 395.6774338831669,
    "SourceFilter.Y": 144.14130824578157,
    "SourcePin": "Output",
    "DestinationFilter": "llmAgent",
    "DestinationFilter.X": 574.0261382310678,
    "DestinationFilter.Y": 147.0699118442225,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "llmAgent",
    "SourceFilter.X": 574.0261382310678,
    "SourceFilter.Y": 147.0699118442225,
    "SourcePin": "Output",
    "DestinationFilter": "player",
    "DestinationFilter.X": 780.6042104658276,
    "DestinationFilter.Y": 223.75888306731417,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Video Input",
    "SourceFilter.X": -89.80344617740974,
    "SourceFilter.Y": 61.651295652099066,
    "SourcePin": "Output",
    "DestinationFilter": "Detectron2",
    "DestinationFilter.X": 192.5,
    "DestinationFilter.Y": 44.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Detectron2",
    "SourceFilter.X": 192.5,
    "SourceFilter.Y": 44.0,
    "SourcePin": "Output",
    "DestinationFilter": "Detectron2",
    "DestinationFilter.X": 192.5,
    "DestinationFilter.Y": 44.0,
    "DestinationPin": "Output",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Detectron2",
    "SourceFilter.X": 192.5,
    "SourceFilter.Y": 44.0,
    "SourcePin": "Output",
    "DestinationFilter": "VideoToToken",
    "DestinationFilter.X": 395.6774338831669,
    "DestinationFilter.Y": 144.14130824578157,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "IPCamera",
    "SourceFilter.X": -58.09605007529035,
    "SourceFilter.Y": 210.43391214366216,
    "SourcePin": "Output",
    "DestinationFilter": "Sam",
    "DestinationFilter.X": 140.50764797576937,
    "DestinationFilter.Y": 187.8202266862849,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Query",
    "SourceFilter.X": 526.6674464768494,
    "SourceFilter.Y": 360.5561004500204,
    "SourcePin": "Output",
    "DestinationFilter": "player",
    "DestinationFilter.X": 780.6042104658276,
    "DestinationFilter.Y": 223.75888306731417,
    "DestinationPin": "Input2",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Sam",
    "SourceFilter.X": 140.50764797576937,
    "SourceFilter.Y": 187.8202266862849,
    "SourcePin": "Output",
    "DestinationFilter": "VideoToToken",
    "DestinationFilter.X": 395.6774338831669,
    "DestinationFilter.Y": 144.14130824578157,
    "DestinationPin": "Input2",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]