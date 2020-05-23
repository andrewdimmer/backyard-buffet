import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraApp extends StatefulWidget {
  CameraApp({Key key, this.cameras}) : super(key: key);

  final List<CameraDescription> cameras;

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Column(
      children: [
        Expanded(
          child: CameraPreview(controller),
        ),
        ButtonBar(alignment: MainAxisAlignment.center, children: [
          RaisedButton.icon(
            autofocus: false,
            color: Theme.of(context).primaryColor,
            onPressed: () => null,
            icon: Icon(Icons.camera_alt),
            label: Text("Take Picture"),
          )
        ])
      ],
    );
  }
}
