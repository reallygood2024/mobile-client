import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Page/Main/work_page.dart';
import 'package:mobile_client/List/homework_list.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

class WorkState extends State<WorkPage> with TickerProviderStateMixin {
  late Homework_List homework_list;

  @override
  void initState() {
    super.initState();
    homework_list = Homework_List.instance();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          DefaultTabController(
            length: homework_list.length(),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: ButtonsTabBar(
                        // Customize the appearance and behavior of the tab bar
                        backgroundColor: const Color(0xFF00AFBE),
                        //unselectedBackgroundColor: const Color(0xFF00AFBE),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        // Add your tabs here
                        tabs: List.generate(homework_list.length(), (index) {
                          return Tab(text: "folder ${index}");
                        }),
                      )
                    ),
                    const GFIconButton(
                      color: Color(0xFF00AFBE),
                      icon: Icon(Icons.add),
                      onPressed: null
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                itemCount: homework_list.length(),
                padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                itemBuilder: (context, item) {
                  // Homework_List
                  return homework_list.Build(context, item);
                },
              )
            ),
          )
        ],
      )
    );
  }

}