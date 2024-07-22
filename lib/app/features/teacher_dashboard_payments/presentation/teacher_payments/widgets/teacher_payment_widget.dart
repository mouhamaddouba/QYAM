import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:qyam_novers_mobile/app/core/extensions/num_extensions.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/core/extensions/string_extensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/entities/teacher_payments.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/teacher_dashboard_payments_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/widgets/teacher_payments_details_widget.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

class TeacherPaymentWidget extends GetView<TeacherDashboardPaymentsController> {
  final TeacherPaymentsDataList teacherPaymentData;
  final void Function(TeacherPaymentsDataList) onTap;

  const TeacherPaymentWidget({
    Key? key,
    required this.teacherPaymentData,
    required this.onTap,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(teacherPaymentData);
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radius10,
          ),
        ),
        child: SizedBox(
          height: AppDimensions.height100,
          child: Row(
            children: [
              // The Primary section of the card

              Expanded(
                flex: AppDimensions.flexExpand01,
                child: ColoredBox(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: AppDimensions.paddingOrMargin16,
                    ),

                    // Pay number
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // pay Number
                        AppTextWidget(
                          teacherPaymentData.payNo.toString(),
                          textAlign: TextAlign.center,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // The white section of the card

              Expanded(
                flex: AppDimensions.flexExpand04,
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: AppDimensions.paddingOrMargin16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Payment value
                      TeacherPaymentDetailsWidget(
                        iconPath: AppAssets.payment,
                        title: teacherPaymentData.pay.withComma,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      ),

                      // Space
                      const SizedBox(
                        height: AppDimensions.paddingOrMargin8,
                      ),

                      // Date
                      TeacherPaymentDetailsWidget(
                        iconPath: AppAssets.date,
                        isNotesRow: true,
                        title: DateFormat("yyyy/MM/dd")
                            .format(teacherPaymentData.dateAndTime),
                        textStyle: Theme.of(context).textTheme.displaySmall,
                      ),

                      // Space
                      const SizedBox(
                        height: AppDimensions.paddingOrMargin8,
                      ),

                      // Notes
                      TeacherPaymentDetailsWidget(
                        iconPath: AppAssets.notes,
                        isNotesRow: true,
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        title: teacherPaymentData.notes.isEmpty
                            ? AppStrings.noNots.tr
                            : teacherPaymentData.notes.trimLength(
                                AppConstants.trim20,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
