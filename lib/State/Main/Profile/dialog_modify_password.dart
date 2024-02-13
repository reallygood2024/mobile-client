import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Dialog_Modify_Password extends StatelessWidget {
  bool showalert = true;

  Dialog_Modify_Password({super.key});

  @override
  Widget build(BuildContext context) {
    return GFFloatingWidget(
      child: GFAlert(
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
        bottomBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GFButton(
              onPressed: (){ Navigator.pop(context); },
              shape: GFButtonShape.standard,
              child: const Text('確認')
            ),
            GFButton(
              onPressed: (){ Navigator.pop(context); },
              shape: GFButtonShape.standard,
              child: const Text('關閉')
            ),
          ],
        ),
      )
    );
  }
}