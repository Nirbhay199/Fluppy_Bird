import 'dart:async';
import 'package:fluppy_bird/barrior.dart';
import 'package:fluppy_bird/barrior2.dart';
import 'package:flutter/material.dart';
import 'Mybird.dart';

// ignore: camel_case_types
class getlay_out extends StatefulWidget {
  @override
  _getlay_outState createState() => _getlay_outState();
}

// ignore: camel_case_types
class _getlay_outState extends State<getlay_out> {
  static double birdyaxis = 0;
  double time = 0;
  double height = 0;
  double initialhight = birdyaxis;
  bool gameHasStarted = false;
  int count = 0;
  int count_1 = 0;
  static double speed = 0.9;
  double speed2 = speed + 1.5;
  double s, a;
  double z = 0;
  // double x = 0.0;
  // double y = 0.0;
  void jump() {
    time = 0;
    initialhight = birdyaxis;
  }

  void startgame() {
    count++;
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.9 * time;
      setState(() {
        birdyaxis = initialhight - height;
      });
      if (birdyaxis > 1.2||(birdyaxis<-0.75&&speed>-0.25&&speed<0.3)||(birdyaxis>0.3&&speed>-0.4&&speed<0.4)||(birdyaxis>0.78&&speed2>-0.3&&speed2<0.4)||(birdyaxis<0&&speed2<0.4&&speed2>-0.26)) {
        
         timer.cancel();
        birdyaxis = 0;
        speed = 0.9;
        z = 0;
        speed2 = speed + 1.5;
        gameHasStarted = false;
        if (count > count_1) {
          count_1 = count;
          count = 0;
        } else {
          count = 0;
        }
      }
      setState(() {
        if (speed < -1.62) {
          speed += 3;
        } else {
          speed -= 0.05;
        }
      });

      setState(() {
        if (speed2 < -1.62) {
          speed2 += 3;
        } else {
          speed2 -= 0.05;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (gameHasStarted) {
                  count++;
                  jump();
                } else {
                  startgame();
                  z = -8;
                }
              },
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(0, birdyaxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: Mybird(),
                  ),
                  Center(
                    child: (gameHasStarted)
                        ? Text("")
                        : Text(
                            "T A P   T O   P L A Y",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                height: 5,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(speed, -1.6),
                    duration: Duration(milliseconds: 0),
                    child: barrior(
                      size: 150.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(s = count > 100 ? speed2 : speed, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: barrior2(size: 150.0),
                  ),
                  AnimatedContainer(
                    alignment:
                        Alignment(a = count > 100 ? speed : speed2, -1.6),
                    duration: Duration(milliseconds: 0),
                    child: barrior(
                      size: 250.0,
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(speed2, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: barrior2(size: 90.0),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.green,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Score",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Text("$count",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Best Score",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Text("$count_1",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
