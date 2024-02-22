import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Auth/auth.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Dialog_Logout extends StatelessWidget {

  Dialog_Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return GFFloatingWidget(
      verticalPosition: MediaQuery.of(context).size.height* 0.1,
      horizontalPosition: MediaQuery.of(context).size.width* 0,
      child: GFAlert(
        titleAlignment: Alignment.center,
        contentAlignment: Alignment.center,
        title: '登出',
        content: const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 20),
          child: Text(
            "確定登出嗎?", 
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400),
          ),
        ),
        bottomBarAlignment: Alignment.center,
        bottomBar: GFButtonBar(
          spacing: 20,
          children: <Widget>[
            GFButton(
              onPressed: (){ 
                AuthState.Logout();
              },
              color: const Color(0xFF00AFBE),
              textColor: Colors.white,
              shape: GFButtonShape.pills,
              child: const Text('登出')
            ),
            GFButton(
              onPressed: (){ 
                Navigator.pop(context); 
              },
              color: const Color(0xFF00AFBE),
              textColor: Colors.white,
              shape: GFButtonShape.pills,
              child: const Text('關閉')
            ),
          ],
        ),
      )
    );
  }
}