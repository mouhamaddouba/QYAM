import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:qyam_novers_mobile/app/core/extensions/num_extensions.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_assets.dart';
import 'package:qyam_novers_mobile/app/core/extensions/string_extensions.dart';
import 'package:qyam_novers_mobile/app/core/values/constants/app_constants.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/entities/student_payments_data.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/student_dashboard_payments_controller.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/widgets/student_payments_details_widget.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

class StudentPaymentWidget extends GetView<StudentDashboardPaymentsController> {
  final StudentPaymentsDataList studentPaymentData;
  final void Function(StudentPaymentsDataList) onTap;

  const StudentPaymentWidget({
    Key? key,
    required this.studentPaymentData,
    required this.onTap,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(studentPaymentData);
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(
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
                          studentPaymentData.payNo.toString(),
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
                      StudentPaymentDetailsWidget(
                        iconPath: AppAssets.payment,
                        title: studentPaymentData.pay.withComma,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      ),

                      // Space
                      const SizedBox(
                        height: AppDimensions.paddingOrMargin8,
                      ),

                      // Date
                      StudentPaymentDetailsWidget(
                        iconPath: AppAssets.date,
                        isNotesRow: true,
                        title: DateFormat("yyyy/MM/dd")
                            .format(studentPaymentData.dateAndTime),
                        textStyle: Theme.of(context).textTheme.displaySmall,
                      ),

                      // Space
                      const SizedBox(
                        height: AppDimensions.paddingOrMargin8,
                      ),

                      // Notes
                      StudentPaymentDetailsWidget(
                        iconPath: AppAssets.notes,
                        isNotesRow: true,
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        title: studentPaymentData.notes.isEmpty
                            ? AppStrings.noNots.tr
                            : studentPaymentData.notes.trimLength(
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
