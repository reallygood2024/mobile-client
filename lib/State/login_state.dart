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
        heightFactor: 1.2,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Image(
                  width: 510,
                  height: 204,
                  image: NetworkImage('lib/Assets/LOGO.jpg')
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '帳號 (學員編號)',
                  ),
                  onChanged: (text) => EmailSignInHelper.email = text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '密碼 (預設身分證字號)',
                  ),
                  onChanged: (text) => EmailSignInHelper.password = text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextButton(
                  onPressed: () { EmailSignInHelper.SignInWithEmail(); },
                  child: const Text('忘記密碼', style: TextStyle(color: Color(0xFF00AFBE)))
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                child: GFButton(
                  textStyle: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
                  color: Color(0xFF00AFBE),
                  size: 38,
                  borderShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  shape: GFButtonShape.standard,
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
