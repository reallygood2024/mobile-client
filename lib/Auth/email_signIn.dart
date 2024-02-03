import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_client/Auth/auth.dart';


class EmailSignInHelper {
  static String email = "";
  static String password = "";

  static SignInWithEmail() async {
    AuthState.SetCred(await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password));
  }
}