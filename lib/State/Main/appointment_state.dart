import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:mobile_client/Page/Main/appointment_page.dart';
import 'package:mobile_client/State/Main/Home/course_list.dart';
import 'package:mobile_client/Utility/size.dart';

class AppointmentState extends State<AppointmentPage> with TickerProviderStateMixin {
  late TabController tabController;
  late CalendarController calendarController;
  late Course_List course_list;
  late TextStyle selected;
  late TextStyle unselecte;
  late DateTime focusDate;
  final EasyInfiniteDateTimelineController _controller = EasyInfiniteDateTimelineController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    calendarController = CalendarController();
    //homework_list = Homework_List();
    course_list = Course_List();
    selected = const TextStyle(fontWeight: FontWeight.w900, fontSize: 16);
    unselecte = const TextStyle(fontWeight: FontWeight.w300, fontSize: 16);
    focusDate = DateTime.now();
  }

  @override
  void dispose() {
    tabController.dispose();
    calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget> [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GFButton(
                  onPressed: (){ 
                    setState(() {
                      tabController.index = 0;
                    });
                  },
                  fullWidthButton: true,
                  text: "預約紀錄",
                  color: Colors.white,
                  textColor: Colors.black,
                  textStyle: tabController.index == 0 ? selected : unselecte,
                  shape: GFButtonShape.square,
                ),
              ),
              Expanded(
                child: GFButton(
                  onPressed: (){ 
                    setState(() {
                      tabController.index = 1;
                    });
                  },
                  fullWidthButton: true,
                  text: "預約上課",
                  color: Colors.white,
                  textColor: Colors.black,
                  textStyle: tabController.index == 1 ? selected : unselecte,
                  shape: GFButtonShape.square,
                ),
              )
            ],
          ),
          const Divider( color: Colors.black, ),
          GFTabBarView(
            height: Home_Page_Utility.GetListViewHeight(context),
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: <Widget>[
              Scrollbar(
                child: ListView.builder(
                  itemCount: course_list.length(),
                  padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                  itemBuilder: (context, item) {
                    // Course_List
                    Widget? w = course_list.Build(context, item);
                    
                    return Slidable(
                      endActionPane: const ActionPane(
                        extentRatio: 0.35,
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: null,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: w!
                    );
                  },
                ),
              ),
              Scrollbar(
                child: Column(
                  children: <Widget>[
                    EasyDateTimeLine(
                      //controller: _controller,
                      //firstDate: DateTime(2023),
                      activeColor: const Color(0xFF00AFBE),
                      initialDate: focusDate,
                      locale: 'zh_TW',
                      //lastDate: DateTime(2023, 12, 31),
                      onDateChange: (selectedDate) {
                        setState(() {
                          focusDate = selectedDate;
                          calendarController.selectedDate = focusDate;
                          calendarController.displayDate = focusDate;
                        });
                      },
                    ),
                    Expanded(
                      child: SfCalendar(
                        controller: calendarController,
                        view: CalendarView.day,
                        viewNavigationMode: ViewNavigationMode.none,
                        allowAppointmentResize: true,
                        cellEndPadding: 50,
                        dragAndDropSettings: const DragAndDropSettings(
                          allowNavigation: false,
                          allowScroll: false
                        ),
                        timeSlotViewSettings: const TimeSlotViewSettings(
                          timeIntervalHeight: 40,
                          timeFormat: 'hh:mm',
                          timeInterval: Duration(minutes: 30),
                        ),
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ]
      )
    );
  }
}