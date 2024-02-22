import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Dialog_QR extends StatelessWidget {

  String data;

  Dialog_QR({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GFFloatingWidget(
      verticalPosition: MediaQuery.of(context).size.height* 0.1,
      horizontalPosition: MediaQuery.of(context).size.width* 0,
      child: GFAlert(
        titleAlignment: Alignment.center,
        contentAlignment: Alignment.center,
        title: '學生 QR Code',
        content: QrImageView(
          backgroundColor: Colors.white,
          size: MediaQuery.of(context).size.width * 0.7,
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