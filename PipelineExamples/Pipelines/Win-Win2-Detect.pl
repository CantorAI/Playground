[
  {
    "ObjectType": "Pipeline",
    "Name": "Win-Win2-Detect"
  },
  {
    "ObjectType": "Filter",
    "Type": "initiator",
    "InstanceName": "initiator",
    "Description": "initiator module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/initiator.png",
    "Frame": {
      "X": -19.0,
      "Y": 88.5,
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
      "X": 137.29458635833504,
      "Y": -20.250083261401016,
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
      "X": 354.39737644056856,
      "Y": 92.9910327714924,
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
      "X": 681.5,
      "Y": 382.0,
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
      "X": 595.0,
      "Y": 97.0,
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
      "X": 187.0,
      "Y": 237.0,
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
    "SourceFilter.X": -19.0,
    "SourceFilter.Y": 88.5,
    "SourcePin": "Output",
    "DestinationFilter": "WinCapture",
    "DestinationFilter.X": 137.29458635833504,
    "DestinationFilter.Y": -20.250083261401016,
    "DestinationPin": "Input",
    "Conditions": "Detectron2 == 1",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "WinCapture",
    "SourceFilter.X": 137.29458635833504,
    "SourceFilter.Y": -20.250083261401016,
    "SourcePin": "Output",
    "DestinationFilter": "Decoder",
    "DestinationFilter.X": 354.39737644056856,
    "DestinationFilter.Y": 92.9910327714924,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Decoder",
    "SourceFilter.X": 354.39737644056856,
    "SourceFilter.Y": 92.9910327714924,
    "SourcePin": "Output",
    "DestinationFilter": "tee",
    "DestinationFilter.X": 187.0,
    "DestinationFilter.Y": 237.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 187.0,
    "SourceFilter.Y": 237.0,
    "SourcePin": "Output",
    "DestinationFilter": "Detectron2",
    "DestinationFilter.X": 595.0,
    "DestinationFilter.Y": 97.0,
    "DestinationPin": "Input",
    "Conditions": "GPU = 1 and Detectron2 == 1",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Detectron2",
    "SourceFilter.X": 595.0,
    "SourceFilter.Y": 97.0,
    "SourcePin": "Output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 681.5,
    "DestinationFilter.Y": 382.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 187.0,
    "SourceFilter.Y": 237.0,
    "SourcePin": "Output2",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 681.5,
    "DestinationFilter.Y": 382.0,
    "DestinationPin": "Input2",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]