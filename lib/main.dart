import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: NewHomeApp()
    );
  }
}

class NewHomeApp extends StatefulWidget {
  @override
  _NewHomeAppState createState() => new _NewHomeAppState();
}

class _NewHomeAppState extends State<NewHomeApp> {
  double eyesCenterX = 155.0;
  double eyesFarLeft = 145.0;
  double eyesFarRight = 165.0;
  double eyesPosX = 155.0;

  double eyesFarTop = 155.0;
  double eyesFarDown = 165.0;
  double eyesCenterY = 160.0;
  double eyesPosY = 160.0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(

        children: <Widget>[
          _buildEyes(),
          _buildBackground()
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return new GestureDetector(
      onPanStart: (x){
//        print("Pan start");
//        print(x);
      print("Reset to center position");
      setState(() {
        eyesPosX = eyesCenterX;
        eyesPosY = eyesCenterY;
      });
      },
      onPanUpdate: (x){
//        print("Pan update");
//        print(x.delta.dx);
        _updateEyesPos(x.delta.dx, x.delta.dy);
      },
      onPanEnd: (x){
//        print("Pan end");
//        print(x);
      },
      child: Image(
          image: AssetImage("assets/x1_no_eyes.png")
      ),
    );
  }

  Widget _buildEyes(){
    return Positioned(
      left: eyesPosX,
      top: eyesPosY,
      child: Image(
        image: AssetImage("assets/x1_eyes.png"),
        height: 30.0,
      ),
    );
  }

  void _updateEyesPos(dx, dy){
    double newPosX = eyesPosX + (dx / 10.0);
    //print("Current pos x: ${eyesPosX}");
    //print("DX: ${dx}");

    if(newPosX < eyesFarLeft){
      newPosX = eyesFarLeft;
    } else if(newPosX > eyesFarRight){
      newPosX = eyesFarRight;
    }

    double newPosY = eyesPosY + (dy / 10.0);
//    print("Current pos y: ${eyesPosY}");
//    print("DY: ${dy}");
    if(newPosY < eyesFarTop){
      newPosY = eyesFarTop;
    } else if(newPosY > eyesFarDown){
      newPosY = eyesFarDown;
    }

//    print("New pos of eyes: ${newPosX} : ${newPosY}");

    setState(() {
      eyesPosX = newPosX;
      eyesPosY = newPosY;
    });
  }
}
