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
      body: GFButton(
        onPressed: (){ AuthState.Logout(); },
        text: "primary",
        shape: GFButtonShape.square,
      ),
    );
  }
}
