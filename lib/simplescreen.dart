import 'package:flutter/material.dart';
import 'dart:math';
import 'homescreen.dart';
import 'contactus.dart';

class SimpleScreen extends StatefulWidget {
  @override
  _SimpleScreenState createState() => _SimpleScreenState();
}

class _SimpleScreenState extends State<SimpleScreen>
    with SingleTickerProviderStateMixin {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  AnimationController controller;
  CurvedAnimation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    var animation =
        CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    controller.forward();
    animation.addListener(() {
      setState(() {});
      print(controller.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
        });
        print('completed');
        controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void roll() {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Dicee'),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            IconButton(
              icon: Icon(Icons.contact_page),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUs()));
              },
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                return Future.value(false);
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: roll,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Image(
                        height: 200 - (animation.value) * 200,
                        image: AssetImage(
                            'assets/images/dice-png-$leftDiceNumber.png'),
                      ),
                    ),
                  )),
                  Expanded(
                    child: GestureDetector(
                        onTap: roll,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Image(
                            height: 100 - (animation.value) * 100,
                            image: AssetImage(
                                'assets/images/dice-png-$rightDiceNumber.png'),
                          ),
                        )),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: null,
                child: Text(
                  'Check Winner',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
