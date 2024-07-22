import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:qyam_novers_mobile/app/core/utils/app_widgets_utils.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/entities/teacher_payments.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments_bottom_sheet/teacher_payments_bottom_sheet_binding.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments_bottom_sheet/teacher_payments_bottom_sheet_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments_bottom_sheet/widgets/teacher_payments_list_bottom_sheet_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class TeacherPaymentsBottomSheetPage extends BaseWidget<
    TeacherPaymentsBottomSheetBinding, TeacherPaymentsBottomSheetController> {
  final TeacherPaymentsDataList teacherPaymentData;
  const TeacherPaymentsBottomSheetPage({
    Key? key,
    required this.teacherPaymentData,
    required BindingCreator<TeacherPaymentsBottomSheetBinding>? bindingCreator,
  }) : super(
          key: key,
          bindingCreator: bindingCreator,
        );

  @override
  Widget view(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.onPrimary
                : AppColors.darkOnPrimary,
            borderRadius: BorderRadius.circular(
              AppDimensions.radius10,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.gray03
                    : AppColors.gray03.withOpacity(0.1),
                blurRadius: AppDimensions.radius08,
                offset: Offset.zero,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              AppDimensions.paddingOrMargin16,
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  TeacherPaymentsListBottomSheetWidget(
                    path: AppAssets.money,
                    title: AppStrings.payNo.tr,
                    subTitle: teacherPaymentData.payNo.toString(),
                  ),
                  TeacherPaymentsListBottomSheetWidget(
                    path: AppAssets.payment,
                    title: AppStrings.payment.tr,
                    subTitle: teacherPaymentData.pay.toString(),
                  ),
                  TeacherPaymentsListBottomSheetWidget(
                    path: AppAssets.date,
                    title: AppStrings.dateAndTime.tr,
                    subTitleSize: AppDimensions.fontSize10.sp,
                    subTitle: DateFormat("yyyy/MM/dd")
                        .format(teacherPaymentData.dateAndTime),
                  ),
                  AppListTileWidget(
                    iconPath: AppAssets.notes,
                    isListView: true,
                    isNotes: true,
                    isProfile: true,
                    textTitle: AppStrings.notes.tr,
                    dateSize: AppDimensions.fontSize09.sp,
                    dateColor: Theme.of(context).primaryColor,
                    textSubtitle: teacherPaymentData.notes.isEmpty
                        ? AppStrings.noNots
                        : teacherPaymentData.notes,
                    noteColor: Theme.of(context).brightness == Brightness.light
                        ? AppColors.onPrimaryContainer
                        : AppColors.darkOnPrimaryContainer,
                    subtitleSize: AppDimensions.fontSize09.sp,
                    paddingVertical: AppDimensions.paddingOrMargin16,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
