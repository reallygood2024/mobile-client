import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Dialog_Course extends StatelessWidget {
  Dialog_Course({super.key});

  @override
  Widget build(BuildContext context) {
    return GFFloatingWidget(
      child: GFAlert(
        title: '上課資訊',
        bottomBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GFButton(
              onPressed: (){ Navigator.pop(context); },
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