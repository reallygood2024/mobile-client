import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Auth/auth.dart';
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
        length: 5,
        tabBarColor: Colors.black87,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        controller: tabController,
        tabs: const [
          Tab(icon: Icon(Icons.home_filled)),
          Tab(icon: Icon(Icons.message_rounded)),
          Tab(icon: Icon(Icons.calendar_month)),
          Tab(icon: Icon(Icons.edit_calendar)),
          Tab(icon: Icon(Icons.person_2_rounded)),
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
                  ChatPage(title: 'Chat page'),
                  WorkPage(title: 'Work page'),
                  WorkPage(title: 'Work page'),
                  ProfilePage(title: 'Profile page'),
              ],
            ),
          )
        )
      )
    );
  }
}
