import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/student_profile_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/ui/student_profile_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/widgets/views/student_profile_app_bar_view.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/widgets/views/student_profile_form_expansion_tile_view.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/widgets/views/student_profile_form_view.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/widgets/views/student_profile_list_style_view.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class StudentProfilePage extends GetView<StudentProfileController> {
  const StudentProfilePage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            StudentProfilAppBarView(),

            // form for my Account
            StudentProfileListStyleView(
              child: AppListTileWidget(
                iconPath: AppAssets.user,
                textTitle: AppStrings.myAccount.tr,
                isListView: true,
                onTap: () {
                  controller.on(
                    event: StudentProfileUiEvent.toAccount(),
                  );
                },
              ),
            ),

            // form languages & themes
            StudentProfileFormExpansionTileView(),

            // form public settings
            StudentProfileFormView(),
          ],
        ),
      ),
    );
  }
}
