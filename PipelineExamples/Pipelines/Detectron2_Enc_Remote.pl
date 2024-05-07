[
  {
    "ObjectType": "Pipeline",
    "Name": "Detectron2_Enc_Remote"
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Video Decoder",
    "Description": "filesrc location=C:/Store/StoreFromDellNotebook/MV/Test101.mp4 ! decodebin ! videoconvert ! videorate! video/x-raw,framerate=240/1,format=BGR ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": -95.43169701602852,
      "Y": 36.75711645876105,
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
      "X": 557.7056193537934,
      "Y": 287.97375934474513,
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
      "X": 335.7881955854476,
      "Y": 153.10075407011365,
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
      "X": -16.162334323292782,
      "Y": 246.55212525107802,
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
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "FrmEncoder",
    "Description": "galaxysrcfilter name=src1 format='video/x-raw,format=RGB,width=1920,height=1080' ! videoconvert ! jpegenc ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 155.4584751623469,
      "Y": -1.1528760087606003,
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
      "X": 497.8905282378071,
      "Y": 4.658478461956378,
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
    "SourceFilter": "Detectron2",
    "SourceFilter.X": 335.7881955854476,
    "SourceFilter.Y": 153.10075407011365,
    "SourcePin": "output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 557.7056193537934,
    "DestinationFilter.Y": 287.97375934474513,
    "DestinationPin": "input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Video Decoder",
    "SourceFilter.X": -95.43169701602852,
    "SourceFilter.Y": 36.75711645876105,
    "SourcePin": "output",
    "DestinationFilter": "tee",
    "DestinationFilter.X": -16.162334323292782,
    "DestinationFilter.Y": 246.55212525107802,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": -16.162334323292782,
    "SourceFilter.Y": 246.55212525107802,
    "SourcePin": "Output2",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 557.7056193537934,
    "DestinationFilter.Y": 287.97375934474513,
    "DestinationPin": "Input2",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": -16.162334323292782,
    "SourceFilter.Y": 246.55212525107802,
    "SourcePin": "Output",
    "DestinationFilter": "FrmEncoder",
    "DestinationFilter.X": 155.4584751623469,
    "DestinationFilter.Y": -1.1528760087606003,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "FrmEncoder",
    "SourceFilter.X": 155.4584751623469,
    "SourceFilter.Y": -1.1528760087606003,
    "SourcePin": "Output",
    "DestinationFilter": "FrmDecoder",
    "DestinationFilter.X": 497.8905282378071,
    "DestinationFilter.Y": 4.658478461956378,
    "DestinationPin": "Input",
    "Conditions": "GPU = 1 and Detectron2 == 1",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "FrmDecoder",
    "SourceFilter.X": 497.8905282378071,
    "SourceFilter.Y": 4.658478461956378,
    "SourcePin": "Output",
    "DestinationFilter": "Detectron2",
    "DestinationFilter.X": 335.7881955854476,
    "DestinationFilter.Y": 153.10075407011365,
    "DestinationPin": "input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]