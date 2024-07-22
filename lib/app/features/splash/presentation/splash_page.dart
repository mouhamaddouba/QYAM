import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_image_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';

import 'package:qyam_novers_mobile/app/features/splash/presentation/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Logo
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingOrMargin100,
              ),
              child: AppImageWidget(
                path: Theme.of(context).brightness == Brightness.light
                    ? AppAssets.logo
                    : AppAssets.logoWhite,
              ),
            ),
          ),

          // Progress
          Padding(
            padding: EdgeInsets.only(
              bottom: AppDimensions.paddingOrMargin50,
            ),
            child: AppLoadingWidget(),
          ),
        ],
      ),
    );
  }
}
