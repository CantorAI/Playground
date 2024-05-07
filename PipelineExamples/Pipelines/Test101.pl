[
  {
    "ObjectType": "Pipeline",
    "Name": "Test101"
  },
  {
    "ObjectType": "Filter",
    "Type": "initiator",
    "InstanceName": "initiator",
    "Description": "initiator module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/initiator.png",
    "Frame": {
      "X": 188.5,
      "Y": 176.0,
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
    "Type": "IPCamera",
    "InstanceName": "IPCamera",
    "Description": "IP Camera for Security",
    "Uri": "IP_Camera",
    "ImageUri": "images/IPCamera.webp",
    "Frame": {
      "X": 453.0,
      "Y": 203.5,
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
    "SourceFilter.X": 188.5,
    "SourceFilter.Y": 176.0,
    "SourcePin": "Output",
    "DestinationFilter": "IPCamera",
    "DestinationFilter.X": 453.0,
    "DestinationFilter.Y": 203.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Filter",
    "Type": "Yolo4",
    "InstanceName": "Yolo4",
    "Description": "Yolo4",
    "Uri": "Yolo4",
    "ImageUri": "images/yolo4.jpg",
    "Frame": {
      "X": 969.5,
      "Y": 394.0,
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
    "Type": "tee",
    "InstanceName": "tee",
    "Description": null,
    "Uri": "galaxy_forge",
    "ImageUri": "images/tee.png",
    "Frame": {
      "X": 692.5,
      "Y": 212.0,
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
        "Name": "Output"
      }
    ]
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "IPCamera",
    "SourceFilter.X": 453.0,
    "SourceFilter.Y": 203.5,
    "SourcePin": "Output",
    "DestinationFilter": "tee",
    "DestinationFilter.X": 692.5,
    "DestinationFilter.Y": 212.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 692.5,
    "SourceFilter.Y": 212.0,
    "SourcePin": "Output",
    "DestinationFilter": "Yolo4",
    "DestinationFilter.X": 969.5,
    "DestinationFilter.Y": 394.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Filter",
    "Type": "player",
    "InstanceName": "player",
    "Description": "Playback module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/LyricPlayer.png",
    "Frame": {
      "X": 1226.0,
      "Y": 157.0,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [
      {
        "Name": "Input"
      },
      {
        "Name": "Input"
      }
    ],
    "OutputPins": []
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 692.5,
    "SourceFilter.Y": 212.0,
    "SourcePin": "Output",
    "DestinationFilter": "player",
    "DestinationFilter.X": 1226.0,
    "DestinationFilter.Y": 157.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Yolo4",
    "SourceFilter.X": 969.5,
    "SourceFilter.Y": 394.0,
    "SourcePin": "Output",
    "DestinationFilter": "player",
    "DestinationFilter.X": 1226.0,
    "DestinationFilter.Y": 157.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]