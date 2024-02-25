import 'package:flutter/material.dart';
import 'package:mobile_client/Page/Main/Profile/background_page.dart';
import 'package:mobile_client/Page/Main/Profile/wish_page.dart';
import 'package:mobile_client/Page/Main/Work/file_system_page.dart';
import 'package:mobile_client/Page/Main/Work/work_content_page.dart';
import 'package:mobile_client/Page/login_page.dart';
import 'package:mobile_client/Page/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appName = "Flutter Demo";
    return MaterialApp(
      title: appName,
      initialRoute: "/login",
      routes: <String, WidgetBuilder>{
        "/login": (BuildContext context) => const LoginPage(title: "Learnscape Login"),
        "/main": (BuildContext context) => const MainPage(title: "Learnscape Login"),
        "/main/profile_background": (BuildContext context) => const BackgroundPage(title: "Background"),
        "/main/profile_wish": (BuildContext context) => const WishPage(title: "Wish"),
        "/main/work_content": (BuildContext context) => const WorkContentPage(title: "Work Detail"),
        "/main/work_filesystem": (BuildContext context) => const WorkFileSystemPage(title: "Work File System"),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: const Color(0xFF00AFBE),
          secondary: const Color(0xFF45BFCA),
        ),
        useMaterial3: true,
      ),
    );
  }
}
