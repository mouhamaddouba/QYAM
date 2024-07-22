import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/student_profile_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/ui/student_profile_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/widgets/views/student_profile_list_style_view.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class StudentProfileFormView extends GetView<StudentProfileController> {
  const StudentProfileFormView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    // Style List
    return StudentProfileListStyleView(
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
                event: StudentProfileUiEvent.logout(),
              );
            },
          ),
        ],
      ),
    );
  }
}
