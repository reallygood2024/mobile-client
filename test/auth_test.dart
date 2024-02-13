// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_client/firebase_options.dart';

main() {
  test("Auth Test", () async {
    UserCredential? cred = null;
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    cred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: "Demo@example.com", password: "123456789");
    expect(cred.user.runtimeType.toString(), "User");
  });
}
