import 'package:backyard_buffet/Data/data.dart';
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

  _safetyInfo(bool safe, String forString) {
    if (safe) {
      return (Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 40.0,
          ),
          Text(
            "Safe for " + forString,
            style: TextStyle(fontSize: 18.0),
          )
        ],
      ));
    } else {
      return (Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.warning,
            color: Colors.red,
            size: 40.0,
          ),
          Text(
            "Toxic to " + forString,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ));
    }
  }

  _infoBody(var plantInfo) {
    List<Widget> body = [
      Container(
        child: Center(
          child: Text(
            plantInfo["title"],
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0),
      )
    ];

    if (plantInfo["safeForHumans"] != null &&
        plantInfo["safeForPets"] != null) {
      body.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _safetyInfo(
                getPlantInfo(widget.pageKey)["safeForHumans"], "Humans"),
            _safetyInfo(getPlantInfo(widget.pageKey)["safeForPets"], "Pets")
          ],
        ),
      );
    }

    if (plantInfo["funFacts"] != null) {
      body.add(
        Container(
          child: Text(
            "Fun Facts:",
            style: TextStyle(fontSize: 18.0),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
      );
      List<String> funFacts = plantInfo["funFacts"];
      funFacts.forEach((value) {
        body.add(Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Icon(Icons.info, color: Colors.blue, size: 30.0),
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              ),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ));
      });
    }

    if (plantInfo["partsSafeToEat"] != null) {
      body.add(
        Container(
          child: Text(
            "Parts of the Plant that are Safe to Eat:",
            style: TextStyle(fontSize: 18.0),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
      );
      List<String> partsSafeToEat = plantInfo["partsSafeToEat"];
      partsSafeToEat.forEach((value) {
        body.add(Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child:
                    Icon(Icons.check_circle, color: Colors.green, size: 30.0),
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              ),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ));
      });
    }

    if (plantInfo["usedAsFood"] != null) {
      body.add(
        Container(
          child: Text(
            "Used as Food:",
            style: TextStyle(fontSize: 18.0),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
      );
      List<String> usedAsFood = plantInfo["usedAsFood"];
      usedAsFood.forEach((value) {
        body.add(Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Icon(Icons.info, color: Colors.blue, size: 30.0),
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              ),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ));
      });
    }

    if (plantInfo["howToEat"] != null) {
      body.add(
        Container(
          child: Text(
            "How to Eat:",
            style: TextStyle(fontSize: 18.0),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
      );
      List<String> howToEat = plantInfo["howToEat"];
      howToEat.forEach((value) {
        body.add(Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child:
                    Icon(Icons.check_circle, color: Colors.green, size: 30.0),
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              ),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ));
      });
    }

    if (plantInfo["vitalNutrients"] != null) {
      body.add(
        Container(
          child: Text(
            "Vital Nutrients:",
            style: TextStyle(fontSize: 18.0),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
      );
      List<String> vitalNutrients = plantInfo["vitalNutrients"];
      vitalNutrients.forEach((value) {
        body.add(Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child:
                    Icon(Icons.check_circle, color: Colors.green, size: 30.0),
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              ),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ));
      });
    }

    if (plantInfo["healthBenefits"] != null) {
      body.add(
        Container(
          child: Text(
            "Possible Health Benefits:",
            style: TextStyle(fontSize: 18.0),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
      );
      List<String> healthBenefits = plantInfo["healthBenefits"];
      healthBenefits.forEach((value) {
        body.add(Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child:
                    Icon(Icons.check_circle, color: Colors.green, size: 30.0),
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              ),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ));
      });
    }

    if (plantInfo["sideEffects"] != null) {
      body.add(
        Container(
          child: Text(
            "Possible Side Effects:",
            style: TextStyle(fontSize: 18.0),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
      );
      List<String> sideEffects = plantInfo["sideEffects"];
      sideEffects.forEach((value) {
        body.add(Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Icon(Icons.error, color: Colors.orange, size: 30.0),
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              ),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ));
      });
    }

    if (plantInfo["recipes"] != null) {
      body.add(
        Container(
          child: Text(
            "Recipes:",
            style: TextStyle(fontSize: 18.0),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
        ),
      );
      List<dynamic> recipes = plantInfo["recipes"];
      recipes.forEach((value) {
        body.add(Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Icon(Icons.info, color: Colors.blue, size: 30.0),
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
              ),
              Expanded(
                child: Text(
                  value["label"],
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 2.0),
        ));
      });
    }

    body.add(Container(
      child: Text(""),
      padding: EdgeInsets.all(4.0),
    ));
    return body;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(getPlantInfo(widget.pageKey)["title"]),
        ),
        body: loading
            ? loadingWheelAndMessage("Analyzing Image...")
            : Container(
                child: ListView(
                  children: _infoBody(getPlantInfo(widget.pageKey)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
      );
}
