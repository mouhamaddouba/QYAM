import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:qyam_novers_mobile/app/core/utils/app_widgets_utils.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/entities/student_payments_data.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments_bottom_sheet/student_payments_bottom_sheet_binding.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments_bottom_sheet/student_payments_bottom_sheet_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments_bottom_sheet/widgets/student_payments_list_bottom_sheet_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class StudentPaymentsBottomSheetPage extends BaseWidget<
    StudentPaymentsBottomSheetBinding, StudentPaymentsBottomSheetController> {
  final StudentPaymentsDataList studentPaymentData;
  const StudentPaymentsBottomSheetPage({
    Key? key,
    required this.studentPaymentData,
    required BindingCreator<StudentPaymentsBottomSheetBinding>? bindingCreator,
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
                    : AppColors.gray03.withOpacity(
                        AppConstants.opacity_01,
                      ),
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
                  StudentPaymentsListBottomSheetWidget(
                    path: AppAssets.money,
                    title: AppStrings.payNo.tr,
                    subTitle: studentPaymentData.payNo.toString(),
                  ),
                  StudentPaymentsListBottomSheetWidget(
                    path: AppAssets.payment,
                    title: AppStrings.payment.tr,
                    subTitle: studentPaymentData.pay.toString(),
                  ),
                  StudentPaymentsListBottomSheetWidget(
                    path: AppAssets.date,
                    title: AppStrings.dateAndTime.tr,
                    subTitleSize: AppDimensions.fontSize10.sp,
                    subTitle: DateFormat("yyyy/MM/dd")
                        .format(studentPaymentData.dateAndTime),
                  ),
                  AppListTileWidget(
                    iconPath: AppAssets.notes,
                    isListView: true,
                    isNotes: true,
                    isProfile: true,
                    textTitle: AppStrings.notes.tr,
                    dateSize: AppDimensions.fontSize09.sp,
                    dateColor: Theme.of(context).primaryColor,
                    textSubtitle: studentPaymentData.notes.isEmpty
                        ? AppStrings.noNots
                        : studentPaymentData.notes,
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
