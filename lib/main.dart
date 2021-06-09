import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_box_01/screens/base/base_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseFirestore.instance.collection('teste2').add({'teste':'teste'});

  runApp(MyApp());
  
  //Firestore.instance.collection('teste2').add({'teste': 'teste'});

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitBox',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: (settings){
        switch(settings.name){
          case '/base':
          default:
            return MaterialPageRoute(
                builder: (_) => BaseScreen()
            );
        }
      },
    );
  }
}

