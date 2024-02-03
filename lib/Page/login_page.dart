import 'package:flutter/widgets.dart';
import 'package:mobile_client/State/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;
  @override
  State<LoginPage> createState() => LoginState();
}