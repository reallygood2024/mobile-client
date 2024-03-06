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