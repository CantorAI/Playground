[
  {
    "ObjectType": "Pipeline",
    "Name": "test_raspberry_pi"
  },
  {
    "ObjectType": "Filter",
    "Type": "initiator",
    "InstanceName": "initiator",
    "Description": "initiator module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/initiator.png",
    "Frame": {
      "X": 41.0,
      "Y": 110.5,
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
    "InstanceName": "fermat",
    "Description": "",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 241.0,
      "Y": 109.5,
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
    "InstanceName": "player",
    "Description": "Playback module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/LyricPlayer.png",
    "Frame": {
      "X": 441.0,
      "Y": 110.5,
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
    "SourceFilter.X": 41.0,
    "SourceFilter.Y": 110.5,
    "SourcePin": "Output",
    "DestinationFilter": "fermat",
    "DestinationFilter.X": 241.0,
    "DestinationFilter.Y": 109.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "fermat",
    "SourceFilter.X": 241.0,
    "SourceFilter.Y": 109.5,
    "SourcePin": "Output",
    "DestinationFilter": "player",
    "DestinationFilter.X": 441.0,
    "DestinationFilter.Y": 110.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]