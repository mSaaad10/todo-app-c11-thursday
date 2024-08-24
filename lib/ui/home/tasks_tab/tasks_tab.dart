import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:todo_c11_thursday/ui/widgets/task_item_widget.dart';

class TasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineCalendar(
          calendarType: CalendarType.GREGORIAN,
          calendarLanguage: "en",
          calendarOptions: CalendarOptions(
            viewType: ViewType.DAILY,
            toggleViewType: true,
            headerMonthElevation: 10,
            headerMonthShadowColor: Colors.transparent,
            headerMonthBackColor: Colors.transparent,
          ),
          dayOptions: DayOptions(
              selectedBackgroundColor: Theme.of(context).primaryColor,
              compactMode: true,
              weekDaySelectedColor: Theme.of(context).primaryColor,
              disableDaysBeforeNow: true),
          headerOptions: HeaderOptions(
              weekDayStringType: WeekDayStringTypes.SHORT,
              monthStringType: MonthStringTypes.SHORT,
              backgroundColor: const Color(0xff3AC3E2),
              headerTextColor: Colors.black),
          onChangeDateTime: (datetime) {
            print(datetime.getDate());
          },
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => TaskItemWidget(),
          itemCount: 20,
        ))
      ],
    );
  }
}
