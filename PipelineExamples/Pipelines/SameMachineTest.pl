[
  {
    "ObjectType": "Pipeline",
    "Name": "SameMachineTest"
  },
  {
    "ObjectType": "Filter",
    "Type": "initiator",
    "InstanceName": "initiator",
    "Description": "initiator module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/initiator.png",
    "Frame": {
      "X": 15.5,
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
      "X": 209.0,
      "Y": 31.0,
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
      "X": 242.5,
      "Y": 227.5,
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
      "X": 449.5,
      "Y": 71.5,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [
      {
        "Name": "Input"
      }
    ],
    "OutputPins": []
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "initiator",
    "SourceFilter.X": 15.5,
    "SourceFilter.Y": 88.5,
    "SourcePin": "Output",
    "DestinationFilter": "WinCapture",
    "DestinationFilter.X": 209.0,
    "DestinationFilter.Y": 31.0,
    "DestinationPin": "Input",
    "Conditions": "CaptureFromWindows == 1",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "WinCapture",
    "SourceFilter.X": 209.0,
    "SourceFilter.Y": 31.0,
    "SourcePin": "Output",
    "DestinationFilter": "Decoder",
    "DestinationFilter.X": 242.5,
    "DestinationFilter.Y": 227.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Decoder",
    "SourceFilter.X": 242.5,
    "SourceFilter.Y": 227.5,
    "SourcePin": "Output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 449.5,
    "DestinationFilter.Y": 71.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]