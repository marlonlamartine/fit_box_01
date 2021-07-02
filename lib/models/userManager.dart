import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_box_01/helpers/firebase_errors.dart';
import 'package:fit_box_01/models/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class UserManager extends ChangeNotifier{

  UserManager(){
    _loadCurrentUser();
  }

  Usuario usuario;

  //User currentUser;

  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  bool _loading = false;

  bool get loading => _loading;

  bool get isLoggedIn => usuario != null;

  ///Método que faz o login no sistema
  Future<void> signIn({Usuario user, Function onFail, Function onSuccess}) async
  {
    loading = true;
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(
          email: user.email, password: user.password);

      await _loadCurrentUser(user: userCredential.user);


      onSuccess();
    }
    on PlatformException catch(e){
      onFail(getErrorString(e.code));
    }

    loading = false;
  }


  ///Método que faz o cadastro no sistema
  Future<void> signUp({Usuario usuario, Function onFail, Function onSuccess}) async
  {
    loading = true;
    try {
      final UserCredential userCredential = await
      auth.createUserWithEmailAndPassword(
          email: usuario.email, password: usuario.password);

     usuario.id = userCredential.user.uid;
     this.usuario = usuario;

     await usuario.saveData();

      onSuccess();
    } on PlatformException catch(e){
      onFail(getErrorString(e.code));
    }
    loading = false;
  }

  ///Fazendo signout do usuario
  void signOut()
  {
    auth.signOut();
    usuario = null;
    notifyListeners();
  }

  set loading(bool value)
  {
    _loading = value;
    notifyListeners();
  }

  Future <void> _loadCurrentUser({User user}) async
  {
    final User currentUser = user ?? auth.currentUser;

    if(currentUser != null){
      final DocumentSnapshot docUser = await firebaseFirestore.collection('users')
          .doc(currentUser.uid).get();
      usuario = Usuario.fromDocument(docUser);

      notifyListeners();
    }
  }


}