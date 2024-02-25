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
    return "${deadline.month}/${deadline.day} ${deadline.hour.toStringAsFixed(0)}:${deadline.minute.toStringAsFixed(0)}";
  }
}