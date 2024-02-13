import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_client/User/user.dart';

class AuthState {  
  static UserCredential? cred;
  static Function? login;
  static Function? logout;

  static Skip() async {
    if (kDebugMode) print("Debug mode, skip login");
    bool hasLogin = true;
    await _SetCred(hasLogin);
  }

  static SetCred(UserCredential? credPara) async {
    cred = credPara;
    if (kDebugMode) print(cred);
    bool hasLogin = cred != null;
    await _SetCred(hasLogin);
  }

  static _SetCred(bool hasLogin) async {
    if (!hasLogin && logout != null) logout!.call();
    else if (hasLogin && login != null) login!.call();
    if (hasLogin){
      UserData.nickname = cred!.user!.displayName;
      UserData.profileURL = cred!.user!.photoURL;
      bool isFirstTime = await UserData.IsFirstTime();
      if(isFirstTime){
        
      }
    }
  }

  static Logout(){
    FirebaseAuth.instance.signOut();
    SetCred(null);
  }
}