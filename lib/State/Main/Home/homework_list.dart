import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

/// The data structure for the homework element
class Homework_Record {
  late DateTime start;
  late DateTime end;
  late int type;
  late String content;

  String title(){
    return "";
  }
}

class Homework_List {
  List<Homework_Record> elements = [];

  int length() => elements.length;

  Widget? Build(BuildContext context, int item){
    var k = elements[item];
    // TODO loading homework records from server
    return GFListTile(
      titleText: k.title(),
      subTitleText: k.content,
      icon: const Icon(Icons.favorite)
    );
  }
}