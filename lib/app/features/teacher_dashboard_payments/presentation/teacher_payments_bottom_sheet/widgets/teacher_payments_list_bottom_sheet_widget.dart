import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments_bottom_sheet/teacher_payments_bottom_sheet_controller.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class TeacherPaymentsListBottomSheetWidget
    extends GetView<TeacherPaymentsBottomSheetController> {
  final String path;
  final String title;
  final String subTitle;
  final double? subTitleSize;
  const TeacherPaymentsListBottomSheetWidget({
    Key? key,
    required this.path,
    required this.title,
    required this.subTitle,
    this.subTitleSize,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return AppListTileWidget(
      iconPath: path,
      isBottomSheet: true,
      isTitleProfile: true,
      minHeight: true,
      textTitle: title,
      titleSize: AppDimensions.fontSize09.sp,
      titleColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.onPrimaryContainer
          : AppColors.darkOnPrimaryContainer,
      titleSecondary: subTitle,
      dateSize: subTitleSize ?? AppDimensions.fontSize12.sp,
      dateColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.primary
          : AppColors.white01,
    );
  }
}
