import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Page/Main/home_page.dart';
import 'package:mobile_client/State/Main/Home/course_list.dart';
import 'package:mobile_client/State/Main/Home/dialog_course_delete.dart';
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
          const Divider( color: Colors.black, height: 2, ),
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
                      endActionPane: ActionPane(
                        extentRatio: 0.35,
                        motion: const ScrollMotion(),
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: IconButton(
                              onPressed: () {
                                // TODO: Send delete event to server and update client UI
                                showDialog(
                                  context: context, 
                                  builder: (BuildContext context2) => Dialog_Course_Delete(
                                    title: course_list.elements[item].to_string(), 
                                    content: "Test Content"
                                  )
                                );
                              },
                              icon: Image.asset("lib/Assets/delete.png"),
                            ),
                          )
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
