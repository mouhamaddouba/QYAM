import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

import 'package:qyam_novers_mobile/app/core/values/export/export_values.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/teacher_dashboard_classes_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_classes/presentation/ui/teacher_dashboard_classes_ui_event.dart';

class TeacherDashboardClassesListDaysView
    extends GetView<TeacherDashboardClassesController> {
  const TeacherDashboardClassesListDaysView({
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
                  event: TeacherDashboardClassesUiEvent.selectDays(
                    dayId: index,
                  ),
                );
                controller.on(
                  event: TeacherDashboardClassesUiEvent.filterClassesByDay(
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
                      horizontal: AppDimensions.paddingOrMargin16,
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
