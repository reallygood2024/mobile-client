import 'package:flutter/material.dart';
import 'package:mobile_client/State/Main/Profile/wish_state.dart';

class WishPage extends StatefulWidget {
  const WishPage({super.key, required this.title});
  final String title;
  @override
  State<WishPage> createState() => WishState();
}
