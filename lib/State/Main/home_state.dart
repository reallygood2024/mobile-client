import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Page/Main/home_page.dart';

class HomeState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: tabController,
          children: <Widget>[
            ListView(
              padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
              children: const <Widget> [
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                )
              ],
            ),
            ListView(
              padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
              children: const <Widget> [
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                ),
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                ),
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                ),
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                ),
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                ),
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                ),
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                ),
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                ),
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                ),
                GFListTile(
                  titleText:'Title',
                  subTitleText:'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.favorite)
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

}