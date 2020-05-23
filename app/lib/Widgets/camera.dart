import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

class CameraApp extends StatefulWidget {
  CameraApp({Key key, this.cameras, this.setLoading, this.openInfo})
      : super(key: key);

  final List<CameraDescription> cameras;
  final Function setLoading;
  final Function openInfo;

  final Future<String> results = Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/dict.txt",
      numThreads: 1 // defaults to 1
      );

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController _controller;
  bool _processNextFrame = false;

  _startStream() {
    _controller?.startImageStream((cameraImage) {
      if (_processNextFrame) {
        _processNextFrame = false;
        print("Frame Sent to TensorFlow");
        /* Tflite.runModelOnFrame(
                bytesList: cameraImage.planes.map((plane) {
                  return plane.bytes;
                }).toList(), // required
                imageHeight: cameraImage.height,
                imageWidth: cameraImage.width,
                asynch: true // defaults to true
                )
            .then((results) => print(results))
            .catchError((err) {
          print(err);
          print("This is totally the result...");
        }); */
        widget.setLoading();
        Future.delayed(
          Duration(seconds: 2),
          () => "Hosta",
        ).then((value) {
          widget.openInfo(value);
          widget.setLoading();
          _controller.stopImageStream();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Column(
      children: [
        Expanded(
          child: CameraPreview(_controller),
        ),
        ButtonBar(alignment: MainAxisAlignment.center, children: [
          RaisedButton.icon(
            autofocus: false,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              _processNextFrame = true;
              _startStream();
            },
            icon: Icon(Icons.camera_alt),
            label: Text("Take Picture"),
          )
        ])
      ],
    );
  }
}
