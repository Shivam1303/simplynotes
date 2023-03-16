import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final CollectionReference users =
    FirebaseFirestore.instance.collection('users');
final GoogleSignIn googleSignIn = GoogleSignIn();

class GService {
  // String uid = '';
  static Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential authResult =
        await _auth.signInWithCredential(credential);

    final User? user = authResult.user;

    var userData = {
      'name': googleSignIn.currentUser!.displayName,
      'email': googleSignIn.currentUser!.email,
    };
    users.doc(user?.uid).get().then((doc) => {
          if (!doc.exists)
            //exsisting user
            {users.doc(user?.uid).update(userData)}
          else
            //new user
            {users.doc(user?.uid).set(userData)}
        });

    // Once signed in, return the UserCredential
    return (await _auth.signInWithCredential(credential)).user;
  }

  //begin
  // final GoogleSignInAccount? guser = await GoogleSignIn().signIn();
  // final GoogleSignInAuthentication gauth = await guser!.authentication;
  // //create credentials
  // final OAuthCredential credential = GoogleAuthProvider.credential(
  //   accessToken: gauth.accessToken,
  //   idToken: gauth.idToken,
  // );
  // //signin now
  // final UserCredential user = await _auth.signInWithCredential(credential);
  // final User? currentUser = _auth.currentUser;
  // assert(user.user!.uid == currentUser!.uid);
  // print('signed in ' + user.user!.displayName!);
  // //end
  // static Future<void> signOut() async {
  //   await _auth.signOut();
  // }
}

// class snout {
//   static Future<void> signout() async {
//     await _auth.signOut();
//   }

