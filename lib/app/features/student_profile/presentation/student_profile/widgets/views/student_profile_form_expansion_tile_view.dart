import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/student_profile_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/ui/student_profile_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/widgets/views/student_profile_expansion_tile_view.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/widgets/views/student_profile_list_style_view.dart';

class StudentProfileFormExpansionTileView
    extends GetView<StudentProfileController> {
  const StudentProfileFormExpansionTileView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    // Animation for form
    return Column(
      children: [
        StudentProfileListStyleView(
          child: Column(
            children: [
              // For themes
              StudentProfileExpansionTileView(
                iconPathExpansionTile: AppAssets.theme,
                textTitleExpansionTile: AppStrings.themes.tr,
                iconPathItem01: AppAssets.sun,
                textTitleItem01: AppStrings.lightTheme.tr,
                iconPathItem02: AppAssets.moon,
                textTitleItem02: AppStrings.darkTheme.tr,
                onTap01: () {
                  controller.on(
                    event: StudentProfileUiEvent.changeToLightTheme(),
                  );
                },
                onTap02: () {
                  controller.on(
                    event: StudentProfileUiEvent.changeToDarkTheme(),
                  );
                },
              ),

              // divider
              Divider(
                thickness: AppDimensions.thickness_08,
                height: AppDimensions.zero,
              ),

              // For languages
              StudentProfileExpansionTileView(
                iconPathExpansionTile: AppAssets.language,
                textTitleExpansionTile: AppStrings.language.tr,
                iconPathItem01: AppAssets.ar,
                textTitleItem01: AppStrings.arabicLanguage.tr,
                iconPathItem02: AppAssets.en,
                textTitleItem02: AppStrings.englishLanguage.tr,
                onTap01: () {
                  controller.on(
                    event: StudentProfileUiEvent.changeToArabic(),
                  );
                },
                onTap02: () {
                  controller.on(
                    event: StudentProfileUiEvent.changeToEnglish(),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
