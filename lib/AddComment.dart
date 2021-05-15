import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddComment extends StatefulWidget {
  static String id = "addComment";
  @override
  _AddCommentState createState() => _AddCommentState();
}


class _AddCommentState extends State<AddComment> {
  static FirebaseAuth auth = FirebaseAuth.instance;
  final String uid = auth.currentUser.uid;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference notes = firestore.collection("Applicants Answers");
  String noteTitle, noteBody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AddMessage')),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          children: <Widget>[
            Text(
              'AddMessage',
              style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Title'
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Main Message'
              ),
              maxLines: 9,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                    child: Text('Add Message'),
                    onPressed: () {}
                ),
                SizedBox(width: 12.0),
              ],
            )
          ],
        ),
      ),
    );
  }
}