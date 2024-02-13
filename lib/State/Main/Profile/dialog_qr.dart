import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Dialog_QR extends StatelessWidget {

  String data;
  bool showalert = true;

  Dialog_QR({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GFFloatingWidget(
      child: GFAlert(
        title: '學生 QR Code',
        content: QrImageView(
          data: data,
          version: QrVersions.auto,
        ),
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