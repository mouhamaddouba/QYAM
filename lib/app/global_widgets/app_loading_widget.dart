import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qyam/app/core/values/app_colors.dart';
import 'package:qyam/app/core/values/app_dimensions.dart';
import 'package:qyam/app/core/values/constants/app_constants.dart';

class AppLoadingWidget extends GetView {
  // Page content
  final Widget? content;
  final Color overlayColor;
  final bool isLoading;
  final String titleText;
  final String descriptionText;
  final Color textColor;
  final Color spinColor;
  final double fontSize;
  final double height;

  const AppLoadingWidget({
    super.key,
    this.content,
    this.overlayColor = AppColors.black00,
    this.isLoading = true,
    this.titleText = AppConstants.emptyText,
    this.descriptionText = AppConstants.emptyText,
    this.textColor = AppColors.white01,
    this.spinColor = AppColors.white01,
    this.fontSize = AppDimensions.fontSize18,
    this.height = AppDimensions.height200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          // Page content
          content ?? const SizedBox.shrink(),

          // Overlay
          isLoading
              ? SpinKitSpinningLines(
                  color: Theme.of(context).primaryColor,
                  size: AppDimensions.paddingOrMargin70,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
