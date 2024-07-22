import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/features/auth/core/utils/auth_user_utils.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_account/teacher_account_controller.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class TeacherAccountFormView extends GetView<TeacherAccountController> {
  const TeacherAccountFormView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppDimensions.flexExpand04,

      // Padding for form
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    AppDimensions.paddingOrMargin16,
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
                          color:
                              Theme.of(context).brightness == Brightness.light
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
                        // Name teacher
                        AppListTileWidget(
                          iconPath: AppAssets.face,
                          textTitle: AppStrings.fullName.tr,
                          textSubtitle: AuthUserUtils.nickName,
                          isProfile: true,
                        ),

                        // Phone Teacher
                        AppListTileWidget(
                          iconPath: AppAssets.phone,
                          textTitle: AppStrings.phoneNumber.tr,
                          textSubtitle: AuthUserUtils.phoneNumber,
                          isListView: true,
                          isProfile: true,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox.shrink(),
              ],
            ),
          );
        },
      ),
    );
  }
}
