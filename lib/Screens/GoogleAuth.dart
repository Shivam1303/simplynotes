import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simplynotes/Screens/HomeScreen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final CollectionReference users =
    FirebaseFirestore.instance.collection('users');
final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class GService {
  // String uid = '';
  static Future<User?> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleSignIn!.authentication;
    // Create a new credential
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);

    final User? user = authResult.user;

    var userData = {
      'name': googleSignIn.displayName,
      'email': googleSignIn.email,
    };
    users.doc(user?.uid).get().then((doc) => {
          if (!doc.exists)
            //exsisting user
            {
              users.doc(user?.uid).update(userData),
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen())),
            }
          else
            //new user
            {
              users.doc(user?.uid).set(userData),
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen())),
            }
        });

    // Once signed in, return the UserCredential
    return (await _auth.signInWithCredential(credential)).user;
  }
}

// class snout {
//   static Future<void> signout() async {
//     await _auth.signOut();
//   }

