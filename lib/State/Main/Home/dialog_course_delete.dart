import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Dialog_Course_Delete extends StatelessWidget {

  String title;
  String content;

  Dialog_Course_Delete({super.key, required this.title, required this.content});

  _CancelAppointMent(){
    // TODO: Cancel the appointment
  }

  @override
  Widget build(BuildContext context) {
    return GFFloatingWidget(
      verticalPosition: MediaQuery.of(context).size.height* 0.3,
      horizontalPosition: MediaQuery.of(context).size.width* 0,
      child: GFAlert(
        titleAlignment: Alignment.center,
        contentAlignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 30),
        title: title,
        titleTextStyle: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w700),
        backgroundColor: const Color(0xFF00AFBE),
        content: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 20),
          child: Text(
            content, 
            style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w400),
          ),
        ),
        bottomBarAlignment: Alignment.center,
        bottomBar: GFButtonBar(
          spacing: 20,
          children: <Widget>[
            GFButton(
              textColor: Colors.white,
              text: "保留",
              shape: GFButtonShape.pills,
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              }, 
            ),
            GFButton(
              textColor: Colors.white,
              text: "取消",
              shape: GFButtonShape.pills,
              color: Colors.black,
              onPressed: () {
                _CancelAppointMent();
                Navigator.pop(context);
              }, 
            ),
          ]
        ),
      )
    );
  }
}