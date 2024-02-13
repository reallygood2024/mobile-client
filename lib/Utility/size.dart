import 'package:flutter/material.dart';

class Home_Page_Utility {
  static double GetListViewHeight(BuildContext context){
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return height - 120;
  }
}