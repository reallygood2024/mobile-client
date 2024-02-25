import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile_client/State/Main/Home/dialog_course_delete.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:mobile_client/Page/Main/appointment_page.dart';
import 'package:mobile_client/List/course_list.dart';
import 'package:mobile_client/Utility/size.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentState extends State<AppointmentPage> with TickerProviderStateMixin {
  late TabController tabController;
  late CalendarController calendarController;
  late Course_List course_list;
  late TextStyle selected;
  late TextStyle unselecte;
  late DateTime focusDate;
  late CalendarFormat format;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    calendarController = CalendarController();
    //homework_list = Homework_List();
    course_list = Course_List.instance();
    selected = const TextStyle(fontWeight: FontWeight.w900, fontSize: 16);
    unselecte = const TextStyle(fontWeight: FontWeight.w300, fontSize: 16);
    focusDate = DateTime.now();
    format = CalendarFormat.week;
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
          const Divider( color: Colors.black, height: 2 ),
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
                      endActionPane: ActionPane(
                        extentRatio: 0.35,
                        motion: const ScrollMotion(),
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: IconButton(
                              onPressed: () {
                                // TODO: Send delete event to server and update client UI
                                showDialog(
                                  context: context, 
                                  builder: (BuildContext context2) => Dialog_Course_Delete(
                                    title: course_list.elements[item].to_string(), 
                                    content: "Test Content"
                                  )
                                );
                              },
                              icon: Image.asset("lib/Assets/delete.png"),
                            ),
                          )
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
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: 
                      Stack(
                        children: <Widget>[
                          TableCalendar(
                            firstDay: focusDate,
                            lastDay: DateTime.now().add(const Duration(days: 365 * 10)),
                            focusedDay: focusDate,
                            currentDay: focusDate,
                            calendarFormat: format,
                            locale: 'zh_TW',
                            headerStyle: const HeaderStyle(
                              decoration: BoxDecoration(
                                color: Color(0xFF00AFBE),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                              ),
                              formatButtonVisible: false,
                              titleCentered: true
                            ),
                            daysOfWeekStyle: const DaysOfWeekStyle(
                              weekdayStyle: TextStyle(color: Colors.black),
                              weekendStyle: TextStyle(color: Colors.black),
                              decoration: BoxDecoration(
                                color: Color(0xFF00AFBE),
                              )
                            ),
                            calendarStyle: const CalendarStyle(
                              defaultTextStyle: TextStyle(color: Colors.black),
                              holidayTextStyle: TextStyle(color: Colors.black),
                              rangeEndTextStyle: TextStyle(color: Colors.black),
                              weekendTextStyle: TextStyle(color: Colors.black),
                              outsideTextStyle: TextStyle(color: Colors.black),
                              rangeStartTextStyle: TextStyle(color: Colors.black),
                              withinRangeTextStyle: TextStyle(color: Colors.black),
                              weekNumberTextStyle: TextStyle(color: Colors.black),
                              disabledTextStyle: TextStyle(color: Colors.black),
                              selectedTextStyle: TextStyle(color: Colors.black),
                              todayTextStyle: TextStyle(color: Colors.white),
                              isTodayHighlighted: false,
                              todayDecoration: BoxDecoration(
                                color: Color(0xFF9FA8DA),
                                shape: BoxShape.circle,
                              ),
                              withinRangeDecoration: BoxDecoration(
                                color: Color(0xFF00AFBE),
                              ),
                              selectedDecoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              rowDecoration: BoxDecoration(
                                color: Color(0xFF00AFBE),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                              )
                            ),
                            onFormatChanged: (f) {
                              setState(() {
                                format = f;
                              });
                            },
                            selectedDayPredicate: (day) {
                              return isSameDay(calendarController.selectedDate, day);
                            },
                            onPageChanged: (focusedDay) {
                              focusDate = focusedDay;
                            },
                            onDaySelected: (selectedDay, focusedDay){
                              if (!isSameDay(calendarController.selectedDate, selectedDay)) {
                                setState(() {
                                  focusDate = focusedDay;
                                  calendarController.selectedDate = selectedDay;
                                  //_selectedEvents = _getEventsForDay(selectedDay);
                                });
                              }
                            },
                          ),
                          const Padding(
                            padding:EdgeInsets.only(top: 81, left: 10, right: 10),
                            child: Divider(color: Colors.black),
                          ),
                        ],
                      )
                    ),
                    Expanded(
                      child: SfCalendar(
                        controller: calendarController,
                        showCurrentTimeIndicator: false,
                        showWeekNumber: false,
                        showTodayButton: false,
                        showDatePickerButton: false,
                        view: CalendarView.day,
                        viewNavigationMode: ViewNavigationMode.none,
                        allowAppointmentResize: true,
                        cellEndPadding: 50,
                        dragAndDropSettings: const DragAndDropSettings(
                          allowNavigation: false,
                          allowScroll: false
                        ),
                        headerHeight: 0,
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