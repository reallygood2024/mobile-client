import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_client/Auth/auth.dart';
import 'package:sprintf/sprintf.dart';

const debug = true;

class EmailSignInHelper {
  static String email = "";
  static String password = "";

  static SignInWithEmail() async {
    if(debug){
      AuthState.Skip();
    }else{
      AuthState.SetCred(await FirebaseAuth.instance.signInWithEmailAndPassword(email: sprintf('%s@example.com', [email]), password: password));
    }
  }
}