[
  {
    "ObjectType": "Pipeline",
    "Name": "Detectron2_DC"
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Video Decoder",
    "Description": "filesrc location=C:/Store/StoreFromDellNotebook/MV/Test101.mp4 ! decodebin ! videoconvert ! videorate! video/x-raw,framerate=240/1,format=BGR ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 2.0,
      "Y": 67.5,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [],
    "OutputPins": [
      {
        "Name": "output"
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
      "X": 430.5,
      "Y": 181.0,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [
      {
        "Name": "input"
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
      "X": 267.5,
      "Y": 37.0,
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
    "InstanceName": "tee",
    "Description": "",
    "Uri": "galaxy_forge",
    "ImageUri": "images/tee.png",
    "Frame": {
      "X": 100.5,
      "Y": 223.0,
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
    "SourceFilter": "Detectron2",
    "SourceFilter.X": 267.5,
    "SourceFilter.Y": 37.0,
    "SourcePin": "output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 430.5,
    "DestinationFilter.Y": 181.0,
    "DestinationPin": "input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Video Decoder",
    "SourceFilter.X": 2.0,
    "SourceFilter.Y": 67.5,
    "SourcePin": "output",
    "DestinationFilter": "tee",
    "DestinationFilter.X": 100.5,
    "DestinationFilter.Y": 223.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 100.5,
    "SourceFilter.Y": 223.0,
    "SourcePin": "Output",
    "DestinationFilter": "Detectron2",
    "DestinationFilter.X": 267.5,
    "DestinationFilter.Y": 37.0,
    "DestinationPin": "input",
    "Conditions": "GPU = 1 and Detectron2 == 2",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 100.5,
    "SourceFilter.Y": 223.0,
    "SourcePin": "Output2",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 430.5,
    "DestinationFilter.Y": 181.0,
    "DestinationPin": "Input2",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]