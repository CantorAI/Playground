[
  {
    "ObjectType": "Pipeline",
    "Name": "Win-Win2"
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "WinCapture",
    "Description": "ksvideosrc ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 52.5,
      "Y": 92.0,
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
    "InstanceName": "Decoder",
    "Description": "galaxysrcfilter name=src1 ! jpegdec ! videoconvert ! video/x-raw,format=BGR ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 274.0,
      "Y": 41.0,
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
      "X": 465.0,
      "Y": 125.5,
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
    "SourceFilter": "WinCapture",
    "SourceFilter.X": 52.5,
    "SourceFilter.Y": 92.0,
    "SourcePin": "Output",
    "DestinationFilter": "Decoder",
    "DestinationFilter.X": 274.0,
    "DestinationFilter.Y": 41.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Decoder",
    "SourceFilter.X": 274.0,
    "SourceFilter.Y": 41.0,
    "SourcePin": "Output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 465.0,
    "DestinationFilter.Y": 125.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]