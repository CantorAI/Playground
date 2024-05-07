[
  {
    "ObjectType": "Pipeline",
    "Name": "test1042"
  },
  {
    "ObjectType": "Filter",
    "Type": "Kinect/3D",
    "InstanceName": "Kinect/3D",
    "Description": "3D Camera",
    "Uri": "Azure_Kinect",
    "ImageUri": "images/AzureKinect.png",
    "Frame": {
      "X": 99.95840581844459,
      "Y": -56.65269562484193,
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
    "Type": "RealSense/3D",
    "InstanceName": "RealSense/3D",
    "Description": "3D Camera",
    "Uri": "Azure_Kinect",
    "ImageUri": "images/RealSense.webp",
    "Frame": {
      "X": 83.55697920097717,
      "Y": 93.36034040573632,
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
      "X": 106.53193923475354,
      "Y": 248.89174937904943,
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
    "Type": "Sam",
    "InstanceName": "Sam",
    "Description": "Segment Anything from Facebook",
    "Uri": "Sam",
    "ImageUri": "images/sam.png",
    "Frame": {
      "X": 469.275792922765,
      "Y": -45.40806079394942,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [
      {
        "Name": "Input"
      },
      {
        "Name": "Input"
      },
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
    "Type": "Detectron2",
    "InstanceName": "Detectron2",
    "Description": "Detectron2",
    "Uri": "Detectron_Filter",
    "ImageUri": "images/Detectron2.webp",
    "Frame": {
      "X": 650.4383123308216,
      "Y": 2.1999314843168065,
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
    "Description": "",
    "Uri": "galaxy_forge",
    "ImageUri": "images/tee.png",
    "Frame": {
      "X": 388.82830576631227,
      "Y": 292.29494851598463,
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
    "Type": "player",
    "InstanceName": "player",
    "Description": "Playback module",
    "Uri": "galaxy_forge",
    "ImageUri": "images/LyricPlayer.png",
    "Frame": {
      "X": 773.4932969512652,
      "Y": 154.0628344450817,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [
      {
        "Name": "Input"
      },
      {
        "Name": "Input2"
      }
    ],
    "OutputPins": []
  },
  {
    "ObjectType": "Filter",
    "Type": "Yolo4",
    "InstanceName": "Yolo4",
    "Description": "Yolo4",
    "Uri": "Yolo4",
    "ImageUri": "images/yolo4.jpg",
    "Frame": {
      "X": 612.4399254589822,
      "Y": 308.5631590234289,
      "Width": 150.0,
      "Height": 80.0
    },
    "InputPins": [],
    "OutputPins": []
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Kinect/3D",
    "SourceFilter.X": 99.95840581844459,
    "SourceFilter.Y": -56.65269562484193,
    "SourcePin": "Output",
    "DestinationFilter": "Sam",
    "DestinationFilter.X": 469.275792922765,
    "DestinationFilter.Y": -45.40806079394942,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 1,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Sam",
    "SourceFilter.X": 469.275792922765,
    "SourceFilter.Y": -45.40806079394942,
    "SourcePin": "Output",
    "DestinationFilter": "Detectron2",
    "DestinationFilter.X": 650.4383123308216,
    "DestinationFilter.Y": 2.1999314843168065,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "IPCamera",
    "SourceFilter.X": 106.53193923475354,
    "SourceFilter.Y": 248.89174937904943,
    "SourcePin": "Output",
    "DestinationFilter": "tee",
    "DestinationFilter.X": 388.82830576631227,
    "DestinationFilter.Y": 292.29494851598463,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "Detectron2",
    "SourceFilter.X": 650.4383123308216,
    "SourceFilter.Y": 2.1999314843168065,
    "SourcePin": "Output",
    "DestinationFilter": "player",
    "DestinationFilter.X": 773.4932969512652,
    "DestinationFilter.Y": 154.0628344450817,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 388.82830576631227,
    "SourceFilter.Y": 292.29494851598463,
    "SourcePin": "Output",
    "DestinationFilter": "player",
    "DestinationFilter.X": 773.4932969512652,
    "DestinationFilter.Y": 154.0628344450817,
    "DestinationPin": "Input2",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 0
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "RealSense/3D",
    "SourceFilter.X": 83.55697920097717,
    "SourceFilter.Y": 93.36034040573632,
    "SourcePin": "Output",
    "DestinationFilter": "Sam",
    "DestinationFilter.X": 469.275792922765,
    "DestinationFilter.Y": -45.40806079394942,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  },
  {
    "ObjectType": "Connect",
    "SourceFilter": "tee",
    "SourceFilter.X": 388.82830576631227,
    "SourceFilter.Y": 292.29494851598463,
    "SourcePin": "Output",
    "DestinationFilter": "Sam",
    "DestinationFilter.X": 469.275792922765,
    "DestinationFilter.Y": -45.40806079394942,
    "DestinationPin": "Input",
    "Conditions": "",
    "ConnectAsTask": 0,
    "StrongConnection": 1
  }
]