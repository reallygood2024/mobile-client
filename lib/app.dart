import 'package:flutter/material.dart';
import 'package:mobile_client/Page/login_page.dart';
import 'package:mobile_client/Page/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Widget? page = null;
  static int type = -1;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appName = "Flutter Demo";
    return MaterialApp(
      title: appName,
      initialRoute: "/login",
      onGenerateRoute: (settings) {
        if(settings.name!.startsWith("/login") || settings.name == "/"){
          if(page == null || type != 0) page = const LoginPage();
          type = 0;
        }
        else if(settings.name!.startsWith("/main")){
          if(page == null || type != 1) page = const MainPage();
          type = 1;
        }else{
          throw Exception('Unknown route: ${settings.name}');
        }
        return MaterialPageRoute<dynamic>(
          builder: (context2) {
            return page!;
          },
          settings: settings
        );
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: const Color(0xFF00AFBE),
          secondary: const Color(0xFF45BFCA),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
