import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';
import 'package:qyam_novers_mobile/app/features/auth/core/utils/auth_user_utils.dart';

import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_account/student_account_controller.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class StudentAccountFormView extends GetView<StudentAccountController> {
  const StudentAccountFormView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // Animation for form
        return AnimatedOpacity(
          opacity: controller.state().showForm
              ? AppConstants.opacity01
              : AppConstants.opacity00,
          duration: const Duration(
            milliseconds: AppConstants.formLoginDelay,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingOrMargin16,
              vertical: AppDimensions.paddingOrMargin16,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.onPrimary
                    : AppColors.darkOnPrimary,
                borderRadius: BorderRadius.circular(
                  AppDimensions.radius10,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.surfaceVariant
                        : AppColors.gray03.withOpacity(
                            AppConstants.opacity_01,
                          ),
                    blurRadius: AppDimensions.radius08,
                    offset: Offset.zero,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Name Student
                  AppListTileWidget(
                    iconPath: AppAssets.face,
                    textTitle: AppStrings.fullName.tr,
                    textSubtitle: AuthUserUtils.nickName,
                    isProfile: true,
                    minHeight: true,
                  ),

                  // Phone student
                  AppListTileWidget(
                    iconPath: AppAssets.phone,
                    textTitle: AppStrings.phoneNumber.tr,
                    textSubtitle: AuthUserUtils.phoneNumber,
                    isProfile: true,
                    minHeight: true,
                  ),

                  // WhatsApp parent
                  AppListTileWidget(
                    iconPath: AppAssets.whatsapp,
                    textTitle: AppStrings.parentWhatsapp.tr,
                    textSubtitle: AuthUserUtils.parentsWhatsapp,
                    isProfile: true,
                    minHeight: true,
                  ),

                  // Name father
                  AppListTileWidget(
                    iconPath: AppAssets.father,
                    textTitle: AppStrings.fatherName.tr,
                    textSubtitle: AuthUserUtils.fatherName,
                    isProfile: true,
                    minHeight: true,
                  ),

                  // Phone father
                  AppListTileWidget(
                    iconPath: AppAssets.phone,
                    textTitle: AppStrings.fatherPhone.tr,
                    textSubtitle: AuthUserUtils.fatherMobile,
                    isProfile: true,
                    minHeight: true,
                  ),

                  // Father job
                  AppListTileWidget(
                    iconPath: AppAssets.job,
                    textTitle: AppStrings.fatherJob.tr,
                    textSubtitle: AuthUserUtils.fatherJob,
                    isProfile: true,
                    minHeight: true,
                  ),

                  // Name mother
                  AppListTileWidget(
                    iconPath: AppAssets.mother,
                    textTitle: AppStrings.motherName.tr,
                    textSubtitle: AuthUserUtils.motherName,
                    isProfile: true,
                    minHeight: true,
                  ),

                  // Phone mother
                  AppListTileWidget(
                    iconPath: AppAssets.phone,
                    textTitle: AppStrings.motherPhone.tr,
                    textSubtitle: AuthUserUtils.motherMobile,
                    isProfile: true,
                    minHeight: true,
                  ),

                  // Mother job
                  AppListTileWidget(
                    iconPath: AppAssets.job,
                    textTitle: AppStrings.motherJob.tr,
                    textSubtitle: AuthUserUtils.motherJob,
                    isListView: true,
                    isProfile: true,
                    minHeight: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
