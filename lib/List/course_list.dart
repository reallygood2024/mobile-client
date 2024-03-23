import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/List/course_record.dart';

const debug = true;

class Course_List {
  List<Course_Record> elements = [];

  static Course_List? _instance = null;
  static Course_List instance (){
    if(_instance != null) {
      return _instance!;
    } else {
      _instance = Course_List();
    }
    return _instance!;
  }

  Course_List(){
    if(debug){
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
        subTitleText: k.context,
      ),
    );
  }
}