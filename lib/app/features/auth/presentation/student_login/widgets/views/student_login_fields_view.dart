import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_text_field_widget.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/student_login_controller.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/student_login/ui/student_login_ui_event.dart';

class StudentLoginFieldsView extends GetView<StudentLoginController> {
  const StudentLoginFieldsView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // PhoneNumber
        AppTextFieldWidget(
          verticalPadding: AppDimensions.paddingOrMargin14,
          hintText: AppStrings.phoneNumber.tr,
          textController: controller.state().phoneNumberController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          textColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.black01
              : AppColors.whiteBlue,
          fontSize: AppDimensions.fontSize10,
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.onPrimary
              : AppColors.darkOnPrimary,

          //height: AppDimensions.height50,
        ),

        // Space
        const SizedBox(
          height: AppDimensions.paddingOrMargin16,
        ),

        // Password
        Obx(
          () {
            return AppTextFieldWidget(
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? AppColors.onPrimary
                  : AppColors.darkOnPrimary,
              verticalPadding: AppDimensions.paddingOrMargin14,
              textColor: Theme.of(context).brightness == Brightness.light
                  ? AppColors.black01
                  : AppColors.whiteBlue,
              textController: controller.state().passwordController,
              hintText: AppStrings.password.tr,
              textInputAction: TextInputAction.done,
              horizontalPadding: AppDimensions.paddingOrMargin16,
              maxLines: AppConstants.maxLines,
              fontSize: AppDimensions.fontSize10,
              obscureText: !controller.state().showPassword,
              suffixIcon: AppIconWidget(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.gray03
                    : AppColors.darkPrimary,
                iconData: controller.state().showPassword
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
                onTap: () {
                  controller.on(
                    event: StudentLoginUiEvent.prefixPassword(
                      showPassword: controller.state().showPassword,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
