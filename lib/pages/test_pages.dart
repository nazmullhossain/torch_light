
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[850] : Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: Icon(Icons.android, size: 80, color: darkMode ? Colors.white : Colors.black),
              decoration: BoxDecoration(
                  color: darkMode ? Colors.grey[850] : Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: darkMode ? Colors.black54 : Colors.grey,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: darkMode ? Colors.grey : Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(top: 50, right: 3),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        darkMode = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      color: Colors.white,
                      child: Text('Light', style: TextStyle(color: Colors.black),),

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 3),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        darkMode = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      color: Colors.black,
                      child: Text('Dark', style: TextStyle(color: Colors.white),),

                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}