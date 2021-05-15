import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'auth.dart';
import 'AddComment.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Unable to initialize Firebase');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'NASA Application App',
              routes: {
                Auth.id: (context) => Auth(),
                AddComment.id: (context) => AddComment(),
              },
              initialRoute: Auth.id,
            );
          }

          return CircularProgressIndicator();
        }
    );

  }
}
