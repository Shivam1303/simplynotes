import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simplynotes/Screens/HomeScreen.dart';
import 'package:simplynotes/Screens/gauthenticate.dart';
import 'GoogleAuth.dart';

class LoginPg extends StatelessWidget {
  const LoginPg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  // final geoFence go = new geoFence();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Center(
            child: const Text(
          'Get Started',
          style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.black,
              fontWeight: FontWeight.w600),
        )),
        backgroundColor: Color(0xFFE76C57),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            height: double.infinity,
            color: Color(0xFFF8EEE2),
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('images/logo.png')],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                      width: 265,
                      child: TextButton(
                        onPressed: () async {
                          await GauthFunction.signInWithGoogle(context)
                              .whenComplete(
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            ),
                          );
                          // go.startGeofence();
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) => pop1(),
                          // );
                        },
                        child: const Text(
                          'Sign in with google',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFE76C57),
                          disabledForegroundColor:
                              Colors.grey.withOpacity(0.38),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
