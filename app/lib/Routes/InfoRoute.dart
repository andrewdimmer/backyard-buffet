import 'package:backyard_buffet/Widgets/camera.dart';
import 'package:backyard_buffet/Widgets/loadingWheelAndMessage.dart';
import 'package:flutter/material.dart';

class InfoRoute extends StatefulWidget {
  InfoRoute({Key key, this.pageKey}) : super(key: key);

  final String pageKey;

  @override
  State<StatefulWidget> createState() => _InfoRoute();
}

class _InfoRoute extends State<InfoRoute> {
  bool loading = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.pageKey),
        ),
        body: loading
            ? loadingWheelAndMessage("Analyzing Image...")
            : Container(
                child: Text("Content Goes Here!"),
              ),
      );
}
