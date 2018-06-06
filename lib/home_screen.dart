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
   bool imgFetched = false;
   void getPreferences() async
   {
      pref = await SharedPreferences.getInstance();
      _disName = pref.getString(Constants.DISPLAY_NAME);
      _picUrl = pref.getString(Constants.PHOTO_URL);
      _email = pref.getString(Constants.EMAIL);
      print('Display Name: $_disName');
      print('PicUrl: $_picUrl');
      print('Email: $_email');

      setState(() {
        imgFetched = true;
      });
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
                  getImage(),
                  Padding(padding: const EdgeInsets.only(left: 20.0)),
                  Text(_disName, style: TextStyle(color: Colors.white))
               ],
            ),

          ),
       );
   }

   getImage()
   {
      if(imgFetched)
      {
         return new Container(
            width: 30.0,
            height: 30.0,
            decoration: new BoxDecoration(
               shape: BoxShape.circle,
               image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(_picUrl)
               )
            ));
      }
      else
      {
         return new Icon(Icons.account_circle,
            size: 30.0,
         );
      }
   }
}