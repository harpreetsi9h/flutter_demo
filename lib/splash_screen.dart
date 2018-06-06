import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';

class SplashScreen extends StatefulWidget {
   @override
   State<StatefulWidget> createState() => _SplashState();

}

class _SplashState extends State<SplashScreen> {

   @override
  void initState() {
   // TODO: implement initState
   super.initState();

   Timer(Duration(seconds: 5),() {
      Navigator.pushNamed(context, "/login_screen");
   });
  }
   @override
   Widget build(BuildContext context) {
      return Scaffold(
         body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
               Container(
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
               ),
               Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                     Expanded(
                        flex: 2,
                        child: Container(
                           child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                 CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 50.0,
                                    child: Icon(
                                       Icons.beach_access,
                                       color: Colors.teal,
                                       size: 50.0,
                                    )
                                 ),
                                 Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                 ),
                                 Text(
                                    "Flutkart", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
//                                    fontFamily: 'Architects Daughter'
                                 ),
                                 )
                              ],
                           ),
                        ),
                     ),
                     Expanded(flex: 1,
                        child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                              CircularProgressIndicator(),
                              Padding(
                                 padding: EdgeInsets.only(top: 20.0)
                              ),
                              Text(
                                 " Onlie Store\nFor Everyone",
                                 style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
//                                    fontFamily: 'PT Sand Web'
                                 ),
                              )
                           ],
                        ),
                     )
                  ],
               )
            ],
         ),
      );
   }
}