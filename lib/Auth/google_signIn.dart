import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_client/Auth/auth.dart';

class GoogleSignInButton extends GFIconButton {
  const GoogleSignInButton(
    {super.key, 
      required super.onPressed, 
      super.icon = const Icon(FontAwesomeIcons.google),
      super.color = Colors.red,
    });
}


class GoogleSignInHelper {
  static SignInWithPopup() async {
    if (kIsWeb){
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({
        'login_hint': 'user@example.com'
      });
      // Once signed in, return the UserCredential
      AuthState.SetCred(await FirebaseAuth.instance.signInWithPopup(googleProvider));
    }else{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      AuthState.SetCred(await FirebaseAuth.instance.signInWithCredential(credential));
    }
  }
}