import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/domain/entities/teacher_lates.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/teacher_dashboard_lates_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/widgets/teacher_lates_details_widget.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

class TeacherLatesWidget extends GetView<TeacherDashboardLatesController> {
  final TeacherLates lates;

  const TeacherLatesWidget({
    Key? key,
    required this.lates,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          AppDimensions.radius10,
        ),
      ),
      child: SizedBox(
        height: AppDimensions.height85.h,
        child: Row(
          children: [
            // The Primary section of the card
            Expanded(
              flex: AppDimensions.flexExpand01,
              child: ColoredBox(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: AppDimensions.paddingOrMargin16,
                  ),

                  // Time class with icon
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Time
                      AppTextWidget(
                        lates.minutes.toString(),
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                        isAutoSized: true,
                      ),

                      //minutes
                      AppTextWidget(
                        (lates.minutes > 1)
                            ? AppStrings.minutes.tr
                            : AppStrings.minute.tr,
                        textAlign: TextAlign.center,
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                        isAutoSized: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // The white section of the card
            Expanded(
              flex: AppDimensions.flexExpand03,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppDimensions.paddingOrMargin16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Name Subject
                    TeacherLatesDetaislWidget(
                      iconPath: AppAssets.calendar,
                      title: DateFormat("yyyy/MM/dd").format(lates.dateAndTime),
                      textStyle: Theme.of(context).textTheme.displayMedium,
                    ),

                    // Space
                    const SizedBox(
                      height: AppDimensions.paddingOrMargin8,
                    ),

                    // Name teacher
                    TeacherLatesDetaislWidget(
                      iconPath: AppAssets.date,
                      title: DateFormat("EEEE", 'ar').format(lates.dateAndTime),
                      textStyle: Theme.of(context).textTheme.displaySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
