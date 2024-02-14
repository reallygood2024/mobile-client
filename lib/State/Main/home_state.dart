import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Page/Main/home_page.dart';
import 'package:mobile_client/State/Main/Home/course_list.dart';
import 'package:mobile_client/State/Main/Home/homework_list.dart';
import 'package:mobile_client/Utility/size.dart';

class HomeState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  late Homework_List homework_list;
  late Course_List course_list;
  late TextStyle selected;
  late TextStyle unselecte;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    homework_list = Homework_List();
    course_list = Course_List();
    selected = const TextStyle(fontWeight: FontWeight.w900, fontSize: 16);
    unselecte = const TextStyle(fontWeight: FontWeight.w300, fontSize: 16);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GFButton(
                  onPressed: (){ 
                    setState(() {
                      tabController.index = 0;
                    });
                  },
                  fullWidthButton: true,
                  text: "預約紀錄",
                  color: Colors.white,
                  textColor: Colors.black,
                  textStyle: tabController.index == 0 ? selected : unselecte,
                  shape: GFButtonShape.square,
                ),
              ),
              Expanded(
                child: GFButton(
                  onPressed: (){ 
                    setState(() {
                      tabController.index = 1;
                    });
                  },
                  fullWidthButton: true,
                  text: "作業紀錄",
                  color: Colors.white,
                  textColor: Colors.black,
                  textStyle: tabController.index == 1 ? selected : unselecte,
                  shape: GFButtonShape.square,
                ),
              )
            ],
          ),
          const Divider( color: Colors.black ),
          GFTabBarView(
            height: Home_Page_Utility.GetListViewHeight(context),
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: <Widget>[
              Scrollbar(
                child: ListView.builder(
                  itemCount: course_list.length(),
                  padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  itemBuilder: (context, item) {
                    // Course_List
                    Widget? w = course_list.Build(context, item);
                    
                    return Slidable(
                      endActionPane: const ActionPane(
                        extentRatio: 0.35,
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: null,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: w!
                    );
                  },
                ),
              ),
              Scrollbar(
                child: ListView.builder(
                  itemCount: homework_list.length(),
                  padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  itemBuilder: (context, item) {
                    // Homework_List
                    return homework_list.Build(context, item);
                  },
                )
              )
            ],
          ),
        ],
      )
    );
  }

}
