import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constants.dart';

class MyHomeScreen extends StatefulWidget {
   @override
   State<StatefulWidget> createState() => new HomePage();
}

SharedPreferences pref;


class HomePage extends State<MyHomeScreen>
{

   String _disName, _picUrl, _email;
   void getPreferences() async
   {
      pref = await SharedPreferences.getInstance();
      _disName = pref.getString(Constants.DISPLAY_NAME);
      _picUrl = pref.getString(Constants.PHOTO_URL);
      print('PicUrl: $_picUrl');
      _email = pref.getString(Constants.EMAIL);
   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPreferences();
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          appBar: AppBar(
             backgroundColor: Colors.blueGrey,
            title: Row(
               children: <Widget>[
                  new Image.network(_picUrl,
                     width: 30.0,
                     height: 30.0,
                  ),
                  new Padding(padding: const EdgeInsets.only(left: 20.0)),
                  new Text(_email, style: TextStyle(color: Colors.white),)
               ],
            ),

          ),
       );
   }

}