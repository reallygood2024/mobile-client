import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Dialog_Progress extends StatelessWidget {

  Dialog_Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return GFFloatingWidget(
      child: GFAlert(
        title: '上課進度',
        bottomBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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