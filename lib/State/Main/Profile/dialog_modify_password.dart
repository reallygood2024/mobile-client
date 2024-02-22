import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Dialog_Modify_Password extends StatelessWidget {
  bool showalert = true;

  Dialog_Modify_Password({super.key});

  _PasswordModify(){
    // TODO: Modify password implementation
  }

  @override
  Widget build(BuildContext context) {
    return GFFloatingWidget(
      verticalPosition: MediaQuery.of(context).size.height* 0.1,
      horizontalPosition: MediaQuery.of(context).size.width* 0,
      child: GFAlert(
        titleAlignment: Alignment.center,
        contentAlignment: Alignment.center,
        title: '修改密碼',
        content: Material(
          child: Column(
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
        ),
        bottomBarAlignment: Alignment.center,
        bottomBar: GFButtonBar(
          spacing: 20,
          children: <Widget>[
            GFButton(
              onPressed: (){ 
                _PasswordModify();
                Navigator.pop(context); 
              },
              color: const Color(0xFF00AFBE),
              textColor: Colors.white,
              shape: GFButtonShape.pills,
              child: const Text('確認')
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