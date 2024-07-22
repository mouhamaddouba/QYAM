import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

import 'package:qyam_novers_mobile/app/core/values/export/export_values.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/student_dashboard_classes_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/ui/student_dashboard_classes_ui_event.dart';

class StudentDashboardClassesListDaysView
    extends GetView<StudentDashboardClassesController> {
  const StudentDashboardClassesListDaysView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: AppDimensions.paddingOrMargin8,
      ),
      child: SizedBox(
        height: AppDimensions.paddingOrMargin36,
        child: ListView.separated(
          // Padding for list
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppDimensions.paddingOrMargin16,
          ),
          controller: controller.state().scrollController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.state().weekDays.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              borderRadius: BorderRadius.circular(
                AppDimensions.radius10,
              ),
              onTap: () {
                controller.on(
                  event: StudentDashboardClassesUiEvent.selectDays(
                    dayId: index,
                  ),
                );
                controller.on(
                  event: StudentDashboardClassesUiEvent.filterClassesByDay(
                    filteredData: controller.state().filteredData,
                  ),
                );
              },
              child: Obx(
                () {
                  return AnimatedContainer(
                    duration: const Duration(
                      milliseconds: AppConstants.animateContainerClasses,
                    ),

                    width: AppDimensions.width94.w,

                    // Padding for inner Container
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: AppDimensions.paddingOrMargin10,
                      vertical: AppDimensions.paddingOrMargin10,
                    ),

                    // Style container
                    decoration: BoxDecoration(
                      color: controller.state().selectedDay == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).cardColor,
                      borderRadius: BorderRadiusDirectional.circular(
                        AppDimensions.radius10,
                      ),
                    ),

                    // Style text container
                    child: AppTextWidget(
                      controller.state().weekDays[index],
                      textColor: controller.state().selectedDay == index
                          ? Theme.of(context).brightness == Brightness.light
                              ? AppColors.onPrimary
                              : AppColors.darkOnPrimary
                          : Theme.of(context).brightness == Brightness.light
                              ? AppColors.onPrimaryContainer
                              : AppColors.darkOnPrimaryContainer,
                      textAlign: TextAlign.center,
                      fontSize: AppDimensions.fontSize08.sp,
                    ),
                  );
                },
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: AppDimensions.paddingOrMargin8,
            );
          },
        ),
      ),
    );
  }
}
