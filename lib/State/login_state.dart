import 'package:flutter/material.dart';
import 'package:mobile_client/Auth/auth.dart';
import 'package:mobile_client/Auth/email_signIn.dart';
//import 'package:mobile_client/Auth/google_signIn.dart';
//import 'package:mobile_client/Auth/apple_signIn.dart';
import 'package:mobile_client/Page/login_page.dart';
import 'package:getwidget/getwidget.dart';

class LoginState extends State<LoginPage> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    AuthState.login = () => {
      Navigator.pushNamed(context, "/main")
    };
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  onChanged: (text) => EmailSignInHelper.email = text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (text) => EmailSignInHelper.password = text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: GFButton(
                  textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                  size: 38,
                  shape: GFButtonShape.square,
                  fullWidthButton: true,
                  onPressed: () { EmailSignInHelper.SignInWithEmail(); },
                  child: const Text('Login')
                ),
              ),
              /** // Third-party sign in method
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: AppleSignInButton(
                        onPressed: AppleSignInHelper.SignInWithPopup
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: GoogleSignInButton(
                        onPressed: GoogleSignInHelper.SignInWithPopup
                      ),
                    ),
                  ],
                ),
              )
              */
            ],
          ),
        ),
      ),
    );
  }
}
