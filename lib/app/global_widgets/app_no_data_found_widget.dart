import 'package:flutter/material.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_image_widget.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

class AppNoDataFoundWidget extends StatelessWidget {
  final double? widthImage;
  final double? space;
  final String title;
  final MainAxisAlignment? mainAxisAlignment;

  const AppNoDataFoundWidget({
    Key? key,
    this.widthImage,
    this.space,
    required this.title,
    this.mainAxisAlignment,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
      children: [
        AppImageWidget(
          path: Theme.of(context).brightness == Brightness.light
              ? AppAssets.lightEmptyImage
              : AppAssets.darkEmptyImage,
          width: widthImage ?? AppDimensions.width160,
        ),
        SizedBox(
          height: space ?? AppDimensions.height40,
        ),
        AppTextWidget(
          title,
          textStyle: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
