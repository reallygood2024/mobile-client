import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/Page/Main/Profile/wish_page.dart';
import 'package:mobile_client/State/main_state.dart';

class Wish {
  /// Creates the employee class with required details.
  Wish(this.id, this.institution, this.docs, this.oral);

  /// Id of an employee.
  final int id;

  /// Name of an employee.
  final String institution;

  /// Designation of an employee.
  final DateTime docs;

  /// Salary of an employee.
  final DateTime oral;
}

class WishState extends State<WishPage> with TickerProviderStateMixin {
  List<Wish> wishes = <Wish>[];

  @override
  void initState() {
    super.initState();
    wishes = getWishData();
  }

  List<Wish> getWishData() {
    return [
      Wish(10001, 'James', DateTime.now(), DateTime.now()),
      Wish(10002, 'Kathryn', DateTime.now(), DateTime.now()),
      Wish(10003, 'Lara', DateTime.now(), DateTime.now()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GFButton(text: "返回", onPressed: () {
              MainState.instance.UpdatePage(1, 0);
            }),
            GFButton(text: "儲存", onPressed: () {
              MainState.instance.UpdatePage(1, 0);
            })
          ],
        )
      ],
    );
  }
}