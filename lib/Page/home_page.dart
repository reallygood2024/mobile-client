import 'package:flutter/widgets.dart';
import 'package:mobile_client/State/home_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;
  @override
  State<MainPage> createState() => HomeState();
}