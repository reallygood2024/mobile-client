import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Page/Main/profile_page.dart';
import 'package:mobile_client/State/Main/Profile/dialog_logout.dart';
import 'package:mobile_client/State/main_state.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileState extends State<ProfilePage> with TickerProviderStateMixin {

  Widget GetTitleText(String title, double size){
    return Text(
      title, 
      style: TextStyle(fontSize: size)
    );
  }

  Widget GetTitleChild(String title, int onPressedJump, int onPressedSubJump){
    return Row(
      children: [
        GetTitleText(title, 18),
        IconButton(
          onPressed: () {
            MainState.instance.UpdatePage(onPressedJump, onPressedSubJump);
          }, 
          icon: Image.asset("lib/Assets/edit.png", width: 25)
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GFAccordion(
          titleChild: GetTitleText('簽到QRCode', 18),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          contentChild: Container(
            alignment: Alignment.center,
            child: QrImageView(
              backgroundColor: Colors.white,
              size: MediaQuery.of(context).size.width * 0.7,
              data: "Test",
              version: QrVersions.auto,
            ),
          )
        ),
        GFAccordion(
          titleChild: GetTitleChild('報考校系', 1, 1),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("A"),
              Text("B")
            ],
          )
          //icon: Icon(Icons.expand_more)
        ),
        GFAccordion(
          titleChild: GetTitleChild('學生背景', 1, 2),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("A"),
              Text("B")
            ],
          )
          //icon: Icon(Icons.expand_more)
        ),
        GFAccordion(
          titleChild: GetTitleChild('上課資訊', 1, 3),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("A"),
              Text("B")
            ],
          )
          //icon: Icon(Icons.expand_more)
        ),
        GFAccordion(
          titleChild: GetTitleChild('上課進度', 1, 4),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("A"),
              Text("B")
            ],
          )
          //icon: Icon(Icons.expand_more)
        ),
        GFAccordion(
          titleChild: GetTitleText('修改密碼', 18),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          contentChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '原本密碼',
                  ),
                  onChanged: (text) => {},
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '新密碼',
                  ),
                  onChanged: (text) => {},
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '確認密碼',
                  ),
                  onChanged: (text) => {},
                )
              ),
            ]
          ),
        ),//icon: Icon(Icons.expand_more)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: GFButton(                          
            onPressed: () {
              showDialog(
                context: context, 
                builder: (BuildContext context2) => Dialog_Logout()
              );
            },
            text: "帳號登出",
            icon: const Icon(Icons.logout),
            type: GFButtonType.outline,
          ),
        ),
      ],
    );
  }

}