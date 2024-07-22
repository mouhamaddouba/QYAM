import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/ui/student_dashboard_payments_ui_event.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/widgets/student_payment_widget.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/domain/entities/student_payments_data.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_payments/presentation/student_payments/student_dashboard_payments_controller.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StudentDashboardPaymentListView
    extends GetView<StudentDashboardPaymentsController> {
  const StudentDashboardPaymentListView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SwipeRefresh.material(
      indicatorColor: Theme.of(context).primaryColor,
      stateStream: controller.state().swipeController.stream,
      onRefresh: () {
        controller.on(
          event: StudentDashboardPaymentsUiEvent.refresh(),
        );
      },
      children: [
        ListView.separated(
          // Padding list
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppDimensions.paddingOrMargin16,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          controller: controller.state().scrollController,
          itemCount: controller.state().studentPayments.length +
              (controller.state().isLoading ||
                      controller.state().pagedList.nextPage == -1
                  ? 1
                  : 0),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (controller.state().isLoading &&
                index == controller.state().studentPayments.length) {
              return const Center(
                child: AppLoadingWidget(),
              );
            }

            // If we dont have data more
            if (controller.state().pagedList.nextPage == -1 &&
                index == controller.state().studentPayments.length) {
              return const SizedBox.shrink();
            }

            // Payment card
            return StudentPaymentWidget(
              studentPaymentData: controller.state().studentPayments[index],
              onTap: (StudentPaymentsDataList payment) {
                controller.on(
                  event: StudentDashboardPaymentsUiEvent.showDialog(
                    paymentsData: payment,
                  ),
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: AppDimensions.paddingOrMargin8,
            );
          },
        ),
      ],
    );
  }
}
