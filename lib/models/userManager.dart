import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_box_01/helpers/firebase_errors.dart';
import 'package:fit_box_01/models/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class UserManager extends ChangeNotifier{

  UserManager(){
    _loadCurrentUser();
  }

  User currentUser;

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;

  bool get loading => _loading;

  Future<void> signIn({Usuario user, Function onFail, Function onSuccess}) async
  {
    loading = true;
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(
          email: user.email, password: user.password);

      onSuccess();
    }
    on PlatformException catch(e){
      onFail(getErrorString(e.code));
    }

    loading = false;
  }

  set loading(bool value)
  {
    _loading = value;
    notifyListeners();
  }

  void _loadCurrentUser()
  {
    if(auth.currentUser != null){
      currentUser = auth.currentUser;
    }
    notifyListeners();
  }


}