import 'package:flutter/material.dart';
import 'package:mobile_client/State/Main/Work/work_content_state.dart';

class WorkContentPage extends StatefulWidget {
  const WorkContentPage({super.key, required this.title});
  final String title;
  @override
  State<WorkContentPage> createState() => WorkContentState();
}
