import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Auth/auth.dart';
import 'package:mobile_client/Page/home_page.dart';


class HomeState extends State<MainPage> with TickerProviderStateMixin {
  int _counter = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthState.logout = () => {
      Navigator.pushNamed(context, "/login")
    };
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: GFTabBar(
        length: 4,
        tabBarColor: Colors.black87,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        controller: tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.person_2_rounded),
            child: Text(
              "學生資料",
              style: TextStyle(fontSize: 10),
            ),
          ),
          Tab(
            icon: Icon(Icons.rule_rounded),
            child: Text(
              "上課時間",
              style: TextStyle(fontSize: 10),
            ),
          ),
          Tab(
            icon: Icon(Icons.home_work_rounded),
            child: Text(
              "繳交作業",
              style: TextStyle(fontSize: 10),
            ),
          ),
          Tab(
            icon: Icon(Icons.message_rounded),
            child: Text(
              "留言",
              style: TextStyle(fontSize: 10),
            ),
          ),
        ], 
      ),
      body: Center(
        child: ConstrainedBox(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GFCard(
                titlePosition: GFPosition.start,
                title: const GFListTile(
                  avatar: GFAvatar(
                    backgroundImage: NetworkImage("data:image/jpeg;base64,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"),
                  ),
                  titleText: 'Game Controllers',
                  subTitleText: 'PlayStation 4',
                ),
                content: const Text("Some quick example text to build on the card"),
                buttonBar: const GFButtonBar(
                  children: <Widget>[
                    GFAvatar(
                      backgroundColor: GFColors.PRIMARY,
                      child: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                    GFAvatar(
                      backgroundColor: GFColors.SECONDARY,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    GFAvatar(
                      backgroundColor: GFColors.SUCCESS,
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
