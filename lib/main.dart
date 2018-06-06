import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'splash_screen.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                accentColor: Colors.teal),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            routes: <String, WidgetBuilder>{
                '/login_screen': (BuildContext context) => MyLoginScreen(),
                '/splash_screen': (BuildContext context) => SplashScreen(),
                '/home_screen': (BuildContext context) => MyHomeScreen()
            },
        );
    }
}