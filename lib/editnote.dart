import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplynotes/addnote.dart';
import 'package:simplynotes/style/app_style.dart';

class EditNote extends StatefulWidget {
  late DocumentSnapshot docToEdit;
  EditNote({required this.docToEdit});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  @override
  void initState() {
    title = TextEditingController(text: widget.docToEdit['title']);
    content = TextEditingController(text: widget.docToEdit['content']);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int cid1 = Random().nextInt(AppStyle.cardColor.length);
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                widget.docToEdit.reference.update({
                  'title': title.text,
                  'content': content.text,
                }).whenComplete(() => Navigator.pop(context));
                // notes.add({
                //   'title': title.text,
                //   'content': content.text,
                // }).whenComplete(() => Navigator.pop(context));
              },
              child: Text('Save')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.docToEdit.reference
              .delete()
              .whenComplete(() => Navigator.pop(context));
        },
        child: Icon(Icons.delete),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(),
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
                  decoration: BoxDecoration(),
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
