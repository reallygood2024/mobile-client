import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/List/homework_record.dart';
import 'package:mobile_client/State/main_state.dart';

class Homework_List {
  List<Homework_Record> elements = [];

  int length() => elements.length;

  static Homework_List instance (){
    return Homework_List();
  }

  Homework_List(){
    if(kDebugMode){
      for(int i = 0; i < 10; i++){
        elements.add(Homework_Record.GenerateDummy());
      }
    }else{
      // TODO loading course records from server
    }
  }

  Widget? Build(BuildContext context, int item){
    var k = elements[item];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 4
          )
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5)
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(100, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 6,
            blurStyle: BlurStyle.outer,
            offset: Offset(0, 3)
          )
        ]
      ),
      child: GFListTile(
        titleText: k.title,
        subTitleText: "期限:${k.to_string()}",
        onTap: () {
          // TODO: Open work content page
          MainState.JumpTo(3);
          Navigator.pushNamed(context, "/main/work_state");
        },
      ),
    );
  }
}