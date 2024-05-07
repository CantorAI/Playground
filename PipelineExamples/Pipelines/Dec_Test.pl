[
  {
    "ObjectType": "Pipeline",
    "Name": "Dec_Test"
  },
  {
    "ObjectType": "Filter",
    "Type": "fermat",
    "InstanceName": "Video Decoder",
    "Description": "filesrc location=D:/Data/MV/Test101.mp4 ! decodebin ! videoconvert ! video/x-raw,format=BGR! galaxyrecvfilter id =0 ",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 40.316758757832076,
      "Y": 93.9834058306337,
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
      "X": 299.9900566138873,
      "Y": 72.83858791904987,
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
    "SourceFilter": "Lyric Player",
    "SourceFilter.X": 299.9900566138873,
    "SourceFilter.Y": 72.83858791904987,
    "SourcePin": null,
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 299.9900566138873,
    "DestinationFilter.Y": 72.83858791904987,
    "DestinationPin": null,
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Video Decoder",
    "SourceFilter.X": 40.316758757832076,
    "SourceFilter.Y": 93.9834058306337,
    "SourcePin": "output",
    "DestinationFilter": "Lyric Player",
    "DestinationFilter.X": 299.9900566138873,
    "DestinationFilter.Y": 72.83858791904987,
    "DestinationPin": "input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]