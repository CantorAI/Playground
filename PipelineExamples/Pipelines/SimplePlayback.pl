[
  {
    "ObjectType": "Pipeline",
    "Name": "SimplePlayback"
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Video Decoder",
    "Description": "filesrc location=C:/Store/StoreFromDellNotebook/MV/1980.mkv ! decodebin ! videoconvert ! videorate! video/x-raw,framerate=240/1,format=ABGR ! galaxyrecvfilter id =0",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 108.5,
      "Y": 59.5,
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
      "X": 410.0,
      "Y": 59.0,
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
    "ObjectType": "Connect",
    "SourceFilter": "Video Decoder",
    "SourceFilter.X": 108.5,
    "SourceFilter.Y": 59.5,
    "SourcePin": "output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 410.0,
    "DestinationFilter.Y": 59.0,
    "DestinationPin": "input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  }
]