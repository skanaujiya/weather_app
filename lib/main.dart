import 'package:flutter/material.dart';
import 'package:weather_app/pages/splash_screen.dart';

void main()=> runApp(
    MaterialApp(
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.red,
          scaffoldBackgroundColor: Colors.grey
      ),
      home: SplashScreen(),
    )
);
