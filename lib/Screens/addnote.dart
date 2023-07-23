import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simplynotes/style/app_style.dart';

// class AddNote extends StatelessWidget {
//   // AddNote({super.key});
//   TextEditingController title = TextEditingController();
//   TextEditingController content = TextEditingController();

//   CollectionReference notes = FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('unotes');

//   @override
//   Widget build(BuildContext context) {
//     int cid1 = Random().nextInt(AppStyle.cardColor.length);
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppStyle.bgColor, // Background color
//               ),
//               onPressed: () {
//                 notes.add({
//                   'title': title.text,
//                   'content': content.text,
//                 }).whenComplete(() => Navigator.pop(context));
//               },
//               child: Text(
//                 'Save',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                 ),
//               )),
//         ],
//         backgroundColor: AppStyle.bgColor,
//       ),
//       body: SafeArea(
//         child: Container(
//           color: Colors.white,
//           padding: EdgeInsets.all(10),
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: TextField(
//                   controller: title,
//                   decoration: InputDecoration(
//                     hintText: 'Title',
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: TextField(
//                     controller: content,
//                     decoration: InputDecoration(
//                       hintText: 'Content',
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class Addnote extends StatefulWidget {
  // const Addnote({super.key});

  @override
  State<Addnote> createState() => _AddnoteState();
}

class _AddnoteState extends State<Addnote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference notes = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('unotes');

  @override
  Widget build(BuildContext context) {
    int cid1 = Random().nextInt(AppStyle.cardColor.length);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyle.bgColor, // Background color
              ),
              onPressed: () {
                notes.add({
                  'title': title.text,
                  'content': content.text,
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )),
        ],
        backgroundColor: AppStyle.bgColor,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    controller: content,
                    decoration: InputDecoration(
                      hintText: 'Content',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
