[
  {
    "ObjectType": "Pipeline",
    "Name": "PiCaptureTest"
  },
  {
    "ObjectType": "Filter",
    "Type": "initiator",
    "InstanceName": "initiator",
    "Description": "initiator module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/initiator.png",
    "Frame": {
      "X": 2.0,
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
    "InstanceName": "Capture",
    "Description": "v4l2src ! jpegenc ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 205.0,
      "Y": 115.0,
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
      "X": 627.0,
      "Y": 124.0,
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
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Decoder",
    "Description": "galaxysrcfilter name=src1 ! jpegdec ! videoconvert ! video/x-raw,format=BGR ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 415.0,
      "Y": 97.5,
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
    "SourceFilter": "initiator",
    "SourceFilter.X": 2.0,
    "SourceFilter.Y": 88.5,
    "SourcePin": "Output",
    "DestinationFilter": "Capture",
    "DestinationFilter.X": 205.0,
    "DestinationFilter.Y": 115.0,
    "DestinationPin": "Input",
    "Conditions": "RaspberryPi == 1",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Capture",
    "SourceFilter.X": 205.0,
    "SourceFilter.Y": 115.0,
    "SourcePin": "Output",
    "DestinationFilter": "Decoder",
    "DestinationFilter.X": 415.0,
    "DestinationFilter.Y": 97.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Decoder",
    "SourceFilter.X": 415.0,
    "SourceFilter.Y": 97.5,
    "SourcePin": "Output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 627.0,
    "DestinationFilter.Y": 124.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]