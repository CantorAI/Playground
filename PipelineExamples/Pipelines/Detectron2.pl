[
  {
    "ObjectType": "Pipeline",
    "Name": "Detectron2"
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Video Decoder",
    "Description": "filesrc location=D:/Data/MV/Test101.mp4 ! decodebin ! videoconvert ! videorate! video/x-raw,framerate=240/1,format=BGR ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 35.22667185868144,
      "Y": 101.40249126993825,
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
      "X": 632.2863444495613,
      "Y": 251.04234776415285,
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
      "X": 512.253538284482,
      "Y": 39.95977380861112,
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
      "X": 266.12342002957877,
      "Y": 167.06273553477067,
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
    "SourceFilter.X": 512.253538284482,
    "SourceFilter.Y": 39.95977380861112,
    "SourcePin": "output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 632.2863444495613,
    "DestinationFilter.Y": 251.04234776415285,
    "DestinationPin": "input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Video Decoder",
    "SourceFilter.X": 35.22667185868144,
    "SourceFilter.Y": 101.40249126993825,
    "SourcePin": "output",
    "DestinationFilter": "tee",
    "DestinationFilter.X": 266.12342002957877,
    "DestinationFilter.Y": 167.06273553477067,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 266.12342002957877,
    "SourceFilter.Y": 167.06273553477067,
    "SourcePin": "Output",
    "DestinationFilter": "Detectron2",
    "DestinationFilter.X": 512.253538284482,
    "DestinationFilter.Y": 39.95977380861112,
    "DestinationPin": "input",
    "Conditions": "GPU = 1 and Detectron2 == 1",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 266.12342002957877,
    "SourceFilter.Y": 167.06273553477067,
    "SourcePin": "Output2",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 632.2863444495613,
    "DestinationFilter.Y": 251.04234776415285,
    "DestinationPin": "Input2",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]