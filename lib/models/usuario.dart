import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario{

  Usuario({this.name, this.email, this.password, this.id});

  Usuario.fromDocument(DocumentSnapshot document)
  {
    id = document.id;
    name = document.get('name');
    email = document.get('email');
  }

  String id;
  String name;
  String email;
  String password;

  String confirmPassword;

  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');

  Future<void> saveData() async
  {
    await collectionReference.doc(id).set(toMap());
  }

  Map<String, dynamic> toMap()
  {
    return{
      'name': name,
      'email': email,
    };
  }
}