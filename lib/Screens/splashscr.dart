import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simplynotes/Screens/HomeScreen.dart';
import 'Login.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    super.initState();

    if (FirebaseAuth.instance.currentUser != null) {
      Timer(Duration(milliseconds: 4500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    } else {
      Timer(Duration(milliseconds: 4500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginpage()),
        );
      });
    }
  }

  // startTimer() {
  //   var duration = Duration(milliseconds: 6300);
  //   return Timer(duration, route);
  // }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Loginpage()),
    );
  }
//   @override
//   void initState(){
//     super.initState();
//     // _navigatetohome();
//   }

//  _navigatetohome() async {
//     await Future.delayed(Duration(milliseconds: 1000),(() {
//      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => firstpage() ),);
//     }));
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Lottie.network(
                'https://lottie.host/5c779313-2d8f-469d-9429-cca2e5461f2c/qeAERyVdjz.json'),
          ),
        ],
      )),
    );
  }
}
