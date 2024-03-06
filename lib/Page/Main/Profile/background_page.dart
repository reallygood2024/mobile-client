import 'package:flutter/material.dart';
import 'package:mobile_client/State/Main/Profile/background_state.dart';

class BackgroundPage extends StatefulWidget {
  const BackgroundPage({super.key, required this.title});
  final String title;
  @override
  State<BackgroundPage> createState() => BackgroundState();
}
