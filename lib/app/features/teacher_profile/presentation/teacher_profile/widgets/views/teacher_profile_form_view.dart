import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/teacher_profile_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/ui/teacher_profile_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/widgets/views/teacher_profile_list_style_view.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class TeacherProfileFormView extends GetView<TeacherProfileController> {
  const TeacherProfileFormView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    // Style List
    return TeacherProfileListStyleView(
      child: Column(
        children: [
          // About
          AppListTileWidget(
            iconPath: AppAssets.about,
            textTitle: AppStrings.about.tr,
          ),

          // Contact us
          AppListTileWidget(
            iconPath: AppAssets.contact,
            textTitle: AppStrings.contactUs.tr,
            textSubtitle: AppStrings.contactUsContent.tr,
            isProfile: true,
            minHeight: true,
          ),

          // Privacy police
          AppListTileWidget(
            iconPath: AppAssets.privacy,
            textTitle: AppStrings.privacyPolice.tr,
          ),

          // Logout
          AppListTileWidget(
            iconData: Icons.logout,
            textTitle: AppStrings.logout.tr,
            isListView: true,
            onTap: () {
              controller.on(
                event: TeacherProfileUiEvent.logout(),
              );
            },
          ),
        ],
      ),
    );
  }
}
