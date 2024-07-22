import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_button_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/teacher_login_controller.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/ui/teacher_login_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/teacher_login/widgets/views/teacher_login_fields_view.dart';

class TeacherLoginFormView extends GetView<TeacherLoginController> {
  const TeacherLoginFormView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppDimensions.flexExpand03,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppDimensions.paddingOrMargin16,
          vertical: AppDimensions.paddingOrMargin32,
        ),
        child: Obx(
          () {
            // Animation for form
            return AnimatedOpacity(
              opacity: controller.state().showForm
                  ? AppConstants.opacity01
                  : AppConstants.opacity00,
              duration: const Duration(
                milliseconds: AppConstants.formLoginDelay,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text form
                  AppTextWidget(
                    AppStrings.teacherLogin.tr,
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),

                  // Space
                  const SizedBox(
                    height: AppDimensions.paddingOrMargin16,
                  ),

                  // Fields
                  const TeacherLoginFieldsView(),

                  // Space
                  const SizedBox(
                    height: AppDimensions.paddingOrMargin16,
                  ),

                  // Button Login
                  controller.state().isLoading
                      ? const AppLoadingWidget(
                          height: AppDimensions.height100,
                        )
                      : Center(
                          child: AppButtonWidget(
                            text: AppStrings.login.tr,
                            textColor:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.onPrimary
                                    : AppColors.darkOnPrimary,
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              controller.on(
                                event: TeacherLoginUiEvent.teacherLogin(
                                  phoneNumber: controller
                                      .state()
                                      .phoneNumberController
                                      .text,
                                  password: controller
                                      .state()
                                      .passwordController
                                      .text,
                                  byEmail: AppConstants.byEmail,
                                  email: AppConstants.email,
                                  remeberMe: AppConstants.remeberMe,
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
