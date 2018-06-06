import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constants.dart';


class MyLoginScreen extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => LoginPage();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();


class LoginPage extends State<MyLoginScreen> {

   bool isProgress = false;

   Future<FirebaseUser> _signIn() async
   {

      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
      
      FirebaseUser user = await _auth.signInWithGoogle(
         idToken: gSA.idToken, accessToken: gSA.accessToken
      );

      setState(() {
         isProgress = true;
      });

      print("User Name: ${user.displayName}");

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(Constants.UID, user.uid);
      preferences.setString(Constants.DISPLAY_NAME, user.displayName);
      preferences.setString(Constants.PHOTO_URL, user.photoUrl);
      preferences.setString(Constants.EMAIL, user.email);

      return user;
   }

   getProgress() {
      if(isProgress)
      {
         return Center(
            child: Container(
               decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(10.0)
               ),
               width: 300.0,
               height: 200.0,
               alignment: AlignmentDirectional.center,
               child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Center(
                        child: SizedBox(
                           height: 50.0,
                           width: 50.0,
                           child: CircularProgressIndicator(
                              value: null,
                              strokeWidth: 7.0,
                           ),
                        ),
                     ),
                     Container(
                        margin: EdgeInsets.only(top: 25.0),
                        child: Center(
                           child: RichText(
                              text: TextSpan(
                                 text: "Please wait...",
                                 style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0
                                 )
                              ),
                           ),
                        ),
                     ),
                  ],
               ),
            ),
         );
      }
      else
      {
         return Container();
      }
   }
   
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
                 onPressed: ()=> _signIn().then((FirebaseUser user)=> _navigateToHome())
                    .catchError((e)=>print(e)),
              ),
               getProgress()
           ],
        );
    }

    void _navigateToHome()
    {
       setState(() {
          isProgress = false;
       });

       Navigator.pushNamed(context, "/home_screen");
    }
}