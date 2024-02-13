import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Page/Main/profile_page.dart';
import 'package:mobile_client/State/Main/Profile/dialog_modify_password.dart';
import 'package:mobile_client/State/Main/Profile/dialog_qr.dart';

class ProfileState extends State<ProfilePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        GFListTile(
          titleText:'簽到 QRCode',
          onTap: () {
            showDialog(
              context: context, builder: (BuildContext context2) => Dialog_QR(
                data: "Test Data",
              )
            );
          }
          //icon: Icon(Icons.expand_more)
        ),
        GFListTile(
          titleText:'報考校系',
          onTap: () {
          }
          //icon: Icon(Icons.expand_more)
        ),
        GFListTile(
          titleText:'學生背景',
          onTap: () {
          }
          //icon: Icon(Icons.expand_more)
        ),
        GFListTile(
          titleText:'上課資訊',
          onTap: () {
          }
          //icon: Icon(Icons.expand_more)
        ),
        GFListTile(
          titleText:'上課進度',
          onTap: () {
          }
          //icon: Icon(Icons.expand_more)
        ),
        GFListTile(
          titleText:'修改密碼',
          onTap: () {
            showDialog(
              context: context, builder: (BuildContext context2) => Dialog_Modify_Password(
              )
            );
          }
          //icon: Icon(Icons.expand_more)
        ),
        Padding(
          padding:EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: GFButton(                          
            onPressed: () {

            },
            text: "帳號登出",
            icon: Icon(Icons.logout),
            type: GFButtonType.outline,
          ),
        ),
        
      ],
    );
  }

}