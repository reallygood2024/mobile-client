import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_client/Auth/auth.dart';
import 'package:mobile_client/Page/Main/Work/work_content_page.dart';
import 'package:mobile_client/Page/Main/appointment_page.dart';
import 'package:mobile_client/Page/Main/chat_page.dart';
import 'package:mobile_client/Page/main_page.dart';
import 'package:mobile_client/Page/Main/home_page.dart';
import 'package:mobile_client/Page/Main/profile_page.dart';
import 'package:mobile_client/Page/Main/work_page.dart';


class MainState extends State<MainPage> with TickerProviderStateMixin {
  static late MainState instance;
  int currentIndex = 0;
  int currentSubIndex = 0;
  late Widget currentPage;

  @override
  void initState() {
    super.initState();
    instance = this;
    currentIndex = 0;
    currentPage = HomePage();
  }

  void UpdatePage(int value, int subvalue){
    setState(() {
      currentIndex = value;
      currentSubIndex = subvalue;
      currentPage = GetCurrentPage();
    });
  }

  Widget GetCurrentPage(){
    switch(currentIndex){
      case 0: return const HomePage();
      case 1: return const ProfilePage();
      case 2: return const AppointmentPage();
      case 3: {
        switch(currentSubIndex){
          case 0: return const WorkPage();
          case 1: return const WorkContentPage();
          default: return const WorkPage();
        }
      }
      case 4: return const ChatPage();
      default: return const HomePage();
    }
  }

  Widget IconGen(String path){
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Image.asset(path, width: 35),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthState.logout = () => {
      Navigator.pushNamed(context, "/login")
    };
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //tabBarHeight: 75,
        currentIndex: currentIndex,
        backgroundColor: const Color(0xFF00AFBE),
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 0, 17, 19),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 1,
        enableFeedback: true,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          log("value: " + value.toString());
          setState(() {
            currentIndex = value;
            currentSubIndex = 0;
            currentPage = GetCurrentPage();
          });
        },
        items: [
          BottomNavigationBarItem(icon: IconGen("lib/Assets/home.png"), label: "", backgroundColor: const Color(0xFF00AFBE)),
          BottomNavigationBarItem(icon: IconGen("lib/Assets/user.png"), label: "", backgroundColor: const Color(0xFF00AFBE)),
          BottomNavigationBarItem(icon: IconGen("lib/Assets/calendar.png"), label: "", backgroundColor: const Color(0xFF00AFBE)),
          BottomNavigationBarItem(icon: IconGen("lib/Assets/paper.png"), label: "", backgroundColor: const Color(0xFF00AFBE)),
          BottomNavigationBarItem(icon: IconGen("lib/Assets/conversation.png"), label: "", backgroundColor: const Color(0xFF00AFBE)),
        ], 
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: currentPage
          )
        )
      )
    );
  }
}

