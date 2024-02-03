import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Auth/auth.dart';

class AppleSignInButton extends GFIconButton {
  const AppleSignInButton(
    {super.key, 
      required super.onPressed, 
      super.icon = const Icon(FontAwesomeIcons.apple),
      super.color = Colors.black,
    });
}


class AppleSignInHelper {
  static SignInWithPopup() async {
    final appleProvider = AppleAuthProvider();
    if (kIsWeb) {
      AuthState.SetCred(await FirebaseAuth.instance.signInWithPopup(appleProvider));
    } else {
      AuthState.SetCred(await FirebaseAuth.instance.signInWithProvider(appleProvider));
    }
  }
}