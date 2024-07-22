import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_image_widget.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/main_login/main_login_controller.dart';

class MainLoginLogoView extends GetView<MainLoginController> {
  const MainLoginLogoView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingOrMargin100,
        vertical: AppDimensions.paddingOrMargin32,
      ),

      // Logo
      child: AppImageWidget(
        path: Theme.of(context).brightness == Brightness.light
            ? AppAssets.logo
            : AppAssets.logoWhite,
      ),
    );
  }
}
