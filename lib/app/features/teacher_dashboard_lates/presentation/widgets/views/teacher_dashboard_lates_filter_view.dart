import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_lates/presentation/teacher_dashboard_lates_controller.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_button_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

class TeacherDashboardLatesFilterView
    extends GetView<TeacherDashboardLatesController> {
  const TeacherDashboardLatesFilterView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppDimensions.paddingOrMargin16,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // From
              AppTextWidget(
                AppStrings.from.tr,
                textColor: AppColors.primary,
              ),

              // Date picker
              AppButtonWidget(
                color: Theme.of(context).primaryColor,
                text: DateTime.now().toString(),
                onPressed: () {},
              )
            ],
          ),

          // Space
          SizedBox(
            height: AppDimensions.paddingOrMargin16,
          ),

          // Delay to
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // To
              AppTextWidget(
                AppStrings.to.tr,
                textColor: AppColors.primary,
              ),

              // Date picker
              AppButtonWidget(
                color: Theme.of(context).primaryColor,
                text: DateTime.now().toString(),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
