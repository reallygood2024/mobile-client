import 'package:flutter/material.dart';
import 'package:mobile_client/State/Main/work_state.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key, required this.title});
  final String title;
  @override
  State<WorkPage> createState() => WorkState();
}