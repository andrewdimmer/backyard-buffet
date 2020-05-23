import 'package:backyard_buffet/Widgets/camera.dart';
import 'package:backyard_buffet/Widgets/loadingWheelAndMessage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'InfoRoute.dart';

class MainRoute extends StatefulWidget {
  MainRoute({Key key, this.title, this.cameras}) : super(key: key);

  final String title;
  final List<CameraDescription> cameras;

  @override
  State<StatefulWidget> createState() => _MainRoute();
}

class _MainRoute extends State<MainRoute> {
  bool _loading = false;

  _setLoading() {
    setState(() {
      _loading = !_loading;
    });
  }

  _openInfo(value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoRoute(
            pageKey: value,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _loading
            ? loadingWheelAndMessage("Analyzing Image...")
            : Container(
                child: CameraApp(
                  cameras: widget.cameras,
                  setLoading: _setLoading,
                  openInfo: _openInfo,
                ),
              ),
      );
}
