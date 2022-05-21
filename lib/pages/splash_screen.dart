import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/pages/home_page.dart';
class SplashScreen extends StatefulWidget{
   const SplashScreen({Key?key}):super(key: key);
  @override
  _SplashScreen createState()=> _SplashScreen();
}
class _SplashScreen extends State<SplashScreen>{

  @override
  void initState(){
    super.initState();
    _navigate();
  }
  _navigate() async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Home()));
  }
  Widget build(context){
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.purple,
            Colors.black,
            Colors.green
          ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/weather.json'),
            const Text('Weather App',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      )
    );
  }
}