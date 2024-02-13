import 'package:flutter/widgets.dart';
import 'package:mobile_client/State/Main/appointment_state.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key, required this.title});
  final String title;
  @override
  State<AppointmentPage> createState() =>AppointmentState();
}