import 'package:flutter/material.dart';
import 'hardscreen.dart';
import 'simplescreen.dart';
import 'contactus.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Dicee'),
          ),
          actions: [
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
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Select Difficulty',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SimpleScreen()));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Simple',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                  ),
                  color: Colors.black12,
                  margin: EdgeInsets.only(top: 50.0),
                  width: double.infinity,
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HardScreen()));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'Hard',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                  ),
                  color: Colors.black12,
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: 100,
                ),
              ),
            ],
          ),
        ));
  }
}
