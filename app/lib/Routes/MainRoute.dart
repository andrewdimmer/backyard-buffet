import 'package:backyard_buffet/Widgets/camera.dart';
import 'package:backyard_buffet/Widgets/loadingWheelAndMessage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class MainRoute extends StatefulWidget {
  MainRoute({Key key, this.title, this.cameras}) : super(key: key);

  final String title;
  final List<CameraDescription> cameras;

  @override
  State<StatefulWidget> createState() => _MainRoute();
}

class _MainRoute extends State<MainRoute> {
  bool loading = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: loading
            ? loadingWheelAndMessage("Analyzing Image...")
            : Container(
                child: CameraApp(cameras: widget.cameras),
              ),
      );
}
