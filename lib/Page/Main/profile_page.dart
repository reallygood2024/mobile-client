import 'package:flutter/material.dart';
import 'package:mobile_client/State/Main/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});
  final String title;
  @override
  State<ProfilePage> createState() => ProfileState();
}