import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:swipe_refresh/swipe_refresh.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:qyam_novers_mobile/app/core/values/export/export_values.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/student_dashboard_attendances_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_attendances/presentation/ui/student_dashboard_attendances_ui_event.dart';

class StudentDashboardAttendancesCalenderView
    extends GetView<StudentDashboardAttendancesController> {
  const StudentDashboardAttendancesCalenderView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Expanded(
          child: SwipeRefresh.material(
            indicatorColor: Theme.of(context).primaryColor,
            stateStream: controller.state().swipeController.stream,
            onRefresh: () {
              controller.on(
                event: StudentDashboardAttendancesUiEvent.refresh(),
              );
            },
            children: [
              TableCalendar(
                firstDay: controller.state().calenderFirstDay,
                lastDay: controller.state().calenderLastDay,
                locale: Get.locale.toString(),
                focusedDay: controller.state().calenderFocusedDay,
                currentDay: controller.state().selectDate,
                calendarFormat: CalendarFormat.month,
                onDaySelected: (date, _) {
                  controller.on(
                    event: StudentDashboardAttendancesUiEvent.selectDate(
                      selectDateId: date,
                    ),
                  );
                },
                onPageChanged: (value) async {
                  await Future.delayed(
                    const Duration(
                      milliseconds: AppConstants.delayCalender,
                    ),
                  );

                  controller.on(
                    event:
                        StudentDashboardAttendancesUiEvent.pageCalenderChanged(
                      monthChange: value.month,
                      yearChange: value.year,
                    ),
                  );
                  controller.on(
                    event: StudentDashboardAttendancesUiEvent.getAttendances(
                      studyYear: controller.state().studyYear,
                      month: value.month.toString(),
                      year: value.year.toString(),
                    ),
                  );
                },
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: Theme.of(context).textTheme.titleSmall!,
                  titleTextFormatter: (date, locale) {
                    return DateFormat("yyyy ").format(date) +
                        DateFormat("MMM", locale).format(date);
                  },
                ),
                calendarStyle: CalendarStyle(
                  outsideTextStyle: Theme.of(context).textTheme.bodyMedium!,
                  disabledTextStyle: Theme.of(context).textTheme.bodyMedium!,
                  cellPadding: const EdgeInsets.all(
                    AppDimensions.paddingOrMargin6,
                  ),
                  markerSize: AppConstants.markerSize,
                  isTodayHighlighted: controller.state().selectDate != null,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: Theme.of(context).textTheme.bodySmall!,
                  weekendStyle: Theme.of(context).textTheme.bodySmall!,
                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, date, focusedDay) {
                    Color? color;

                    // This is if here because when i but in controller i have error reBuild
                    if (controller.state().attendances.any(
                          (element) => element.day == date.day + 1,
                        )) {
                      final attendance =
                          controller.state().attendances.singleWhere(
                                (element) => element.day == date.day,
                              );
                      if (attendance.value == "p") {
                        color = Colors.green.withOpacity(.5);
                      } else if (attendance.value != "NA") {
                        color = Colors.red.withOpacity(.5);
                      }
                    }
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),
                      margin: const EdgeInsets.all(
                        AppDimensions.paddingOrMargin6,
                      ),
                      child: Center(
                        child: AppTextWidget(
                          textStyle: Theme.of(context).textTheme.bodySmall!,
                          date.day.toString(),
                          textColor: color == null ? null : AppColors.white01,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
