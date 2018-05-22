import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => HomePage();
}


class HomePage extends State<MyHomeScreen> {
    @override
    Widget build(BuildContext context) {
        return Stack(
           fit: StackFit.expand,
           children: <Widget>[
              Container(
                 decoration: BoxDecoration(color: Colors.indigo[300]),
              ),
              FlatButton(
                 child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                       new Image.asset("assets/google_icon.png",
                          height: 80.0,
                          width: 80.0,
                       ),
                       Padding(
                          padding: EdgeInsets.all(20.0),
                       ),
                       RichText(text: TextSpan(text: "Sign in"),)
                    ],
                 ),
                 onPressed: googleSignIn,
              )
           ],
        );
    }


    void googleSignIn()
    {
       print('Sign in clicked');
    }
}