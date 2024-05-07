[
  {
    "ObjectType": "Pipeline",
    "Name": "Detectron2_Enc_Local"
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Video Decoder",
    "Description": "filesrc location=C:/Store/StoreFromDellNotebook/MV/Test101.mp4 ! decodebin ! videoconvert ! videorate! video/x-raw,framerate=30/1,format=BGR ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 46.0,
      "Y": 48.5,
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
      "X": 679.0,
      "Y": 43.0,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [
      {
        "Name": "input"
      }
    ],
    "OutputPins": []
  },
  {
    "ObjectType": "Filter",
    "Type": "tee",
    "InstanceName": "tee",
    "Description": "",
    "Uri": "galaxy_forge",
    "ImageUri": "images/tee.png",
    "Frame": {
      "X": 82.5,
      "Y": 190.0,
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
    "InstanceName": "FrmEncoder",
    "Description": "galaxysrcfilter name=src1 format='video/x-raw,format=BGR,width=1920,height=1080' ! videoconvert ! jpegenc quality=40 ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 307.0,
      "Y": 211.50000000000003,
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
    "InstanceName": "FrmDecoder",
    "Description": "galaxysrcfilter name=src1 ! jpegdec ! videoconvert ! video/x-raw,format=BGR ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 468.5,
      "Y": 35.0,
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
    "SourceFilter": "Video Decoder",
    "SourceFilter.X": 46.0,
    "SourceFilter.Y": 48.5,
    "SourcePin": "output",
    "DestinationFilter": "tee",
    "DestinationFilter.X": 82.5,
    "DestinationFilter.Y": 190.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 82.5,
    "SourceFilter.Y": 190.0,
    "SourcePin": "Output",
    "DestinationFilter": "FrmEncoder",
    "DestinationFilter.X": 307.0,
    "DestinationFilter.Y": 211.50000000000003,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "FrmEncoder",
    "SourceFilter.X": 307.0,
    "SourceFilter.Y": 211.50000000000003,
    "SourcePin": "Output",
    "DestinationFilter": "FrmDecoder",
    "DestinationFilter.X": 468.5,
    "DestinationFilter.Y": 35.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Lyric Player",
    "SourceFilter.X": 679.0,
    "SourceFilter.Y": 43.0,
    "SourcePin": null,
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 679.0,
    "DestinationFilter.Y": 43.0,
    "DestinationPin": null,
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "FrmDecoder",
    "SourceFilter.X": 468.5,
    "SourceFilter.Y": 35.0,
    "SourcePin": "Output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 679.0,
    "DestinationFilter.Y": 43.0,
    "DestinationPin": "input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]