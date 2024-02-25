import 'package:flutter/material.dart';
import 'package:getwidget/components/tabs/gf_tabbar.dart';
import 'package:mobile_client/Page/Main/Work/work_content_page.dart';
import 'package:mobile_client/State/main_state.dart';

class WorkContentState extends State<WorkContentPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 5, 
      vsync: this,
    );
    tabController.index = 3;

    tabController.addListener(() {
      MainState.placeHolder = tabController.index;
      Navigator.pushNamed(context, "/main");
    });
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GFTabBar(
        tabBarHeight: 75,
        length: 5,
        tabBarColor: const Color(0xFF00AFBE),
        labelColor: Colors.black,
        unselectedLabelColor: const Color.fromARGB(255, 0, 17, 19),
        controller: tabController,
        tabs: [
          Tab(icon: Image.asset("lib/Assets/home.png", width: 35)),
          Tab(icon: Image.asset("lib/Assets/user.png", width: 35)),
          Tab(icon: Image.asset("lib/Assets/calendar.png", width: 35)),
          Tab(icon: Image.asset("lib/Assets/paper.png", width: 35)),
          Tab(icon: Image.asset("lib/Assets/conversation.png", width: 35)),
        ], 
      ),
      body: Text("Hello")
    );
  }
}