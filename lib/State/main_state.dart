import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Auth/auth.dart';
import 'package:mobile_client/Page/Main/appointment_page.dart';
import 'package:mobile_client/Page/Main/chat_page.dart';
import 'package:mobile_client/Page/main_page.dart';
import 'package:mobile_client/Page/Main/home_page.dart';
import 'package:mobile_client/Page/Main/profile_page.dart';
import 'package:mobile_client/Page/Main/work_page.dart';


class MainState extends State<MainPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 5, 
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthState.logout = () => {
      Navigator.pushNamed(context, "/login")
    };
    return Scaffold(
      bottomNavigationBar: GFTabBar(
        tabBarHeight: 75,
        length: 5,
        tabBarColor: Color(0xFF00AFBE),
        labelColor: Colors.black,
        unselectedLabelColor: Color.fromARGB(255, 0, 17, 19),
        controller: tabController,
        tabs: [
          Tab(icon: Image.asset("lib/Assets/home.png", width: 35)),
          Tab(icon: Image.asset("lib/Assets/user.png", width: 35)),
          Tab(icon: Image.asset("lib/Assets/calendar.png", width: 35)),
          Tab(icon: Image.asset("lib/Assets/paper.png", width: 35)),
          Tab(icon: Image.asset("lib/Assets/conversation.png", width: 35)),
        ], 
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const <Widget>[
                  HomePage(title: 'Home page'),
                  ProfilePage(title: 'Profile page'),
                  AppointmentPage(title: 'Appointment page'),
                  WorkPage(title: 'Work page'),
                  ChatPage(title: 'Chat page'),
              ],
            ),
          )
        )
      )
    );
  }
}
