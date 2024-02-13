import 'package:flutter/widgets.dart';
import 'package:mobile_client/State/Main/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => HomeState();
}