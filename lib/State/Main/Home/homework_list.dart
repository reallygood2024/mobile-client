import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

/// The data structure for the homework element
class Homework_Record {
  late String color;
  late String title;
  late String context;
  late bool upload;
  late bool reply;
  late bool finish;
  late DateTime deadline;
  late DateTime create;
  
  static Homework_Record GenerateDummy(){
    Homework_Record cr = Homework_Record();
    cr.color = "#000000";
    cr.title = "Test Title";
    cr.context = "Test Context";
    cr.upload = true;
    cr.reply = true;
    cr.finish = true;
    cr.create = DateTime.now();
    cr.deadline = DateTime.now().add(const Duration(days: 5));
    return cr;
  }

  String to_string(){
    return "${deadline.month}/${deadline.day} ${deadline.hour.toStringAsFixed(2)}:${deadline.minute.toStringAsFixed(2)}";
  }
}

class Homework_List {
  List<Homework_Record> elements = [];

  int length() => elements.length;

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

    return GFListTile(
      titleText: k.to_string(),
      subTitleText: k.context,
      icon: const Icon(Icons.favorite)
    );
  }
}