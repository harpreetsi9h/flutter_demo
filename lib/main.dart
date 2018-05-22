import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'splash_screen.dart';

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
                '/home_screen': (BuildContext context) => MyHomeScreen(),
                '/splash_screen': (BuildContext context) => SplashScreen()
            },
        );
    }
}