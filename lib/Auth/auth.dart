import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthState {  
  static UserCredential? cred;
  static Function? login;
  static Function? logout;

  static SetCred(UserCredential? credPara){
    cred = credPara;
    if (kDebugMode) print(cred);
    if (cred == null && logout != null) logout!.call();
    else if (cred != null && login != null) login!.call();
  }

  static Logout(){
    FirebaseAuth.instance.signOut();
    SetCred(null);
  }
}