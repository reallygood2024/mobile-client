import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

/// The data structure for the homework element
class Course_Record {
  late String title;
  late String context;
  late String teacher;
  late String teacher2;
  late int limit;
  late int place;
  late DateTime time_from;
  late DateTime time_to;
  
  static Course_Record GenerateDummy(){
    Course_Record cr = Course_Record();
    cr.title = "Test Title";
    cr.context = "書審第三堂 OO老師\n討論報考動機和學習計畫";
    cr.teacher = "Test teacher";
    cr.teacher2 = "Test teacher2";
    cr.time_from = DateTime.now();
    cr.place = 0;
    cr.limit = 1;
    cr.time_to = DateTime.now().add(const Duration(days: 5));
    return cr;
  }

  String placeToString(){
    switch(place){
      case 0: return "線上";
      case 1: return "現場";
      default: return "線上";
    }
  }

  String to_string(){
    return "${time_from.month}/${time_from.day} ${time_from.hour.toStringAsFixed(0)}:${time_from.minute.toStringAsFixed(0)} ${placeToString()}";
  }
}

class Course_List {
  List<Course_Record> elements = [];

  Course_List(){
    if(kDebugMode){
      for(int i = 0; i < 10; i++){
        elements.add(Course_Record.GenerateDummy());
      }
    }else{
      // TODO loading course records from server
    }
  }

  int length() => elements.length;

  Widget? Build(BuildContext context, int item){
    var k = elements[item];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(
            color:  Color(0xFF00AFBE),
            width: 4
          )
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5)
        ),
        boxShadow: [
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
        titleText: k.to_string(),
        subTitleText: k.context,//icon: const Icon(Icons.favorite)
      ),
    );
  }
}