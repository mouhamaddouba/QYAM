import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/teacher_profile_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/ui/teacher_profile_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/widgets/views/teacher_profile_expansion_tile_view.dart';
import 'package:qyam_novers_mobile/app/features/teacher_profile/presentation/teacher_profile/widgets/views/teacher_profile_list_style_view.dart';

class TeacherProfileFormExpansionTileView
    extends GetView<TeacherProfileController> {
  const TeacherProfileFormExpansionTileView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    // Animation for form
    return Column(
      children: [
        TeacherProfileListStyleView(
          child: Column(
            children: [
              // For themes
              TeacherProfileExpansionTileView(
                iconPathExpansionTile: AppAssets.theme,
                textTitleExpansionTile: AppStrings.themes.tr,
                iconPathItem01: AppAssets.sun,
                textTitleItem01: AppStrings.lightTheme.tr,
                iconPathItem02: AppAssets.moon,
                textTitleItem02: AppStrings.darkTheme.tr,
                onTap01: () {
                  controller.on(
                    event: TeacherProfileUiEvent.changeToLightTheme(),
                  );
                },
                onTap02: () {
                  controller.on(
                    event: TeacherProfileUiEvent.changeToDarkTheme(),
                  );
                },
              ),

              // divider
              Divider(
                thickness: AppDimensions.thickness_08,
                height: AppDimensions.zero,
              ),

              // For languages
              TeacherProfileExpansionTileView(
                iconPathExpansionTile: AppAssets.language,
                textTitleExpansionTile: AppStrings.language.tr,
                iconPathItem01: AppAssets.ar,
                textTitleItem01: AppStrings.arabicLanguage.tr,
                iconPathItem02: AppAssets.en,
                textTitleItem02: AppStrings.englishLanguage.tr,
                onTap01: () {
                  controller.on(
                    event: TeacherProfileUiEvent.changeToArabic(),
                  );
                },
                onTap02: () {
                  controller.on(
                    event: TeacherProfileUiEvent.changeToEnglish(),
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
