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

  Widget GetTitleChild(String title, { int onPressedJump = -1, int onPressedSubJump = -1, double fontSize = 18 }){
    return Row(
      children: [
        GetTitleText(title, fontSize),
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
          titleChild: GetTitleChild('報考校系', onPressedJump: 1, onPressedSubJump: 1),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("XX 大學 XX 科系, 書12/1 口2/15"),
              Text("XX 大學 XX 科系, 書12/30 口3/1"),
              Text("XX 大學 XX 科系, 書12/29 口1/10")
            ],
          )
          //icon: Icon(Icons.expand_more)
        ),
        GFAccordion(
          titleChild: GetTitleChild('學生背景', onPressedJump: 1, onPressedSubJump: 2),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("學歷:"),
              Text("XX 大學 XX 科系 學士"),
              Text("XX 大學 XX 科系 交換半年"),
              Text(""),
              Text("學歷:"),
              Text("21-22 XX 社團幹部"),
              Text("21-22 XX 實習"),
              Text("19-20 XX 比賽 第一名"),
              Text(""),
              Text("學歷:"),
              Text("論文<XXXXXXXXXX>"),
              Text("論文<XXXXXXXXXX>"),
            ],
          )
          //icon: Icon(Icons.expand_more)
        ),
        GFAccordion(
          titleChild: GetTitleChild('上課資訊', onPressedJump: 1, onPressedSubJump: 3),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("購買項目: 書審口試大包套", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(""),
              Text("* 4 堂書審+ 4 堂口試"),
              Text("* 排版課+時事課"),
              Text("* 模擬口試 2 次"),
            ],
          )
          //icon: Icon(Icons.expand_more)
        ),
        GFAccordion(
          titleChild: GetTitleText('上課進度', 18),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          contentChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetTitleChild('第八堂 預約下次上課', fontSize: 12),
              Text(""),
              GetTitleChild('第七堂 預約下次上課', fontSize: 12),
              Text(""),
              GetTitleChild('第六堂 預約下次上課', fontSize: 12),
              Text(""),
              GetTitleChild('第五堂 預約下次上課', fontSize: 12),
              Text(""),
              Text("第四堂 1/24(三) 19:00-20:00 現場討論報考動機和學習計畫"),
              Text(""),
              Text("第三堂 1/20(六) 10:00-11:00 線上完成自傳, 簡介, 自我介紹"),
              Text(""),
              Text("第二堂 1/19(五) 19:00-20:00 現場檢查和討論自傳"),
              Text(""),
              Text("第一堂 1/15(五) 19:00-20:00 現場了解需求和目標"),
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