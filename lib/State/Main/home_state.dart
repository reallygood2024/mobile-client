import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Page/Main/home_page.dart';
import 'package:mobile_client/State/Main/Home/homework_list.dart';
import 'package:mobile_client/Utility/size.dart';

class HomeState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  late Homework_List homework_list;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    homework_list = Homework_List();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Material(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GFButton(
                  onPressed: (){ tabController.index = 0; },
                  fullWidthButton: true,
                  text: "預約紀錄",
                  shape: GFButtonShape.square,
                ),
              ),
              Expanded(
                child: GFButton(
                  onPressed: (){ tabController.index = 1; },
                  fullWidthButton: true,
                  text: "作業紀錄",
                  shape: GFButtonShape.square,
                ),
              )
            ],
          ),
          GFTabBarView(
            height: Home_Page_Utility.GetListViewHeight(context),
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: <Widget>[
              Scrollbar(
                child: ListView.builder(
                  itemCount: 20,
                  padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  itemBuilder: (context, item) {
                    // TODO: Loading appointment records from server
                    
                    return const GFListTile(
                      titleText:'Title',
                      subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                      icon: Icon(Icons.favorite)
                    );
                  },
                ),
              ),
              Scrollbar(
                child: ListView.builder(
                  itemCount: homework_list.length(),
                  padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  itemBuilder: (context, item) {
                    
                    //Homework_List
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