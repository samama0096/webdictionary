import 'dart:math';

import 'package:flutter/material.dart';

class animationtest extends StatefulWidget {
  animationtest({Key key}) : super(key: key);

  @override
  _animationtestState createState() => _animationtestState();
}

class _animationtestState extends State<animationtest>
    with SingleTickerProviderStateMixin {
  Tween<double> tw = Tween<double>(begin: 1, end: 20);

  AnimationController _con;
  @override
  void initState() {
    super.initState();
    _con = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 20));
    _con.repeat();
  }

  double h = 100;
  double w = 150;
  bool state = false;
  void update() {
    setState(() {
      h = 200;
      w = 250;
    });
  }

  void dec() {
    setState(() {
      h = 100;
      w = 150;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  state ? dec() : update();
                  setState(() {
                    state != state;
                  });
                },
                child: Text("change me!")),
            SizedBox(
              height: 20,
            ),
            AnimatedBuilder(
              animation: _con.view,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _con.value * 2 * pi,
                  child: child,
                );
              },
              child: Container(
                height: h,
                width: w,
                color: Colors.amberAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
