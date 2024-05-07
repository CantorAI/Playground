[
  {
    "ObjectType": "Pipeline",
    "Name": "test"
  },
  {
    "ObjectType": "Filter",
    "Type": "initiator",
    "InstanceName": "A",
    "Description": "initiator module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/initiator.png",
    "Frame": {
      "X": 32.0,
      "Y": 111.5,
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
    "Type": "dataset",
    "InstanceName": "B",
    "Description": "dataset module",
    "Uri": "galaxy_dataset",
    "ImageUri": "images/dataset.png",
    "Frame": {
      "X": 244.5,
      "Y": 48.5,
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
    "InstanceName": "C",
    "Description": "",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 96.5,
      "Y": 271.0,
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
    "InstanceName": "D",
    "Description": "",
    "Uri": "galaxy_fermat",
    "ImageUri": "images/fermat.png",
    "Frame": {
      "X": 469.5,
      "Y": 55.5,
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
    "InstanceName": "E",
    "Description": "",
    "Uri": "galaxy_forge",
    "ImageUri": "images/tee.png",
    "Frame": {
      "X": 316.5,
      "Y": 305.5,
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
    "ObjectType": "Filter",
    "Type": "dataset",
    "InstanceName": "K",
    "Description": "dataset module",
    "Uri": "galaxy_dataset",
    "ImageUri": "images/dataset.png",
    "Frame": {
      "X": 537.5,
      "Y": 209.5,
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
    "SourceFilter": "A",
    "SourceFilter.X": 32.0,
    "SourceFilter.Y": 111.5,
    "SourcePin": "Output",
    "DestinationFilter": "B",
    "DestinationFilter.X": 244.5,
    "DestinationFilter.Y": 48.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "A",
    "SourceFilter.X": 32.0,
    "SourceFilter.Y": 111.5,
    "SourcePin": "Output",
    "DestinationFilter": "C",
    "DestinationFilter.X": 96.5,
    "DestinationFilter.Y": 271.0,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "C",
    "SourceFilter.X": 96.5,
    "SourceFilter.Y": 271.0,
    "SourcePin": "Output",
    "DestinationFilter": "D",
    "DestinationFilter.X": 469.5,
    "DestinationFilter.Y": 55.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "B",
    "SourceFilter.X": 244.5,
    "SourceFilter.Y": 48.5,
    "SourcePin": "Output",
    "DestinationFilter": "D",
    "DestinationFilter.X": 469.5,
    "DestinationFilter.Y": 55.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "C",
    "SourceFilter.X": 96.5,
    "SourceFilter.Y": 271.0,
    "SourcePin": "Output",
    "DestinationFilter": "E",
    "DestinationFilter.X": 316.5,
    "DestinationFilter.Y": 305.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "E",
    "SourceFilter.X": 316.5,
    "SourceFilter.Y": 305.5,
    "SourcePin": "Output",
    "DestinationFilter": "K",
    "DestinationFilter.X": 537.5,
    "DestinationFilter.Y": 209.5,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]