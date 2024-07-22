import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/teacher_profile_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/ui/teacher_profile_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/widgets/views/teacher_profile_app_bar_view.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/widgets/views/teacher_profile_form_expansion_tile_view.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/widgets/views/teacher_profile_form_view.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/widgets/views/teacher_profile_list_style_view.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class TeacherProfilePage extends GetView<TeacherProfileController> {
  const TeacherProfilePage({
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
            TeacherProfilAppBarView(),

            // form for my Account
            TeacherProfileListStyleView(
              child: AppListTileWidget(
                iconPath: AppAssets.user,
                textTitle: AppStrings.myAccount.tr,
                isListView: true,
                onTap: () {
                  controller.on(
                    event: TeacherProfileUiEvent.toAccount(),
                  );
                },
              ),
            ),

            // form languages & themes
            TeacherProfileFormExpansionTileView(),

            // form public settings
            TeacherProfileFormView(),
          ],
        ),
      ),
    );
  }
}
