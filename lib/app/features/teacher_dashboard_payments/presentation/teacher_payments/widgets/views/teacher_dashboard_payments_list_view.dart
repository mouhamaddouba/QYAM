import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/teacher_dashboard_payments_controller.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/ui/teacher_dashboard_payments_ui_event.dart';
import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/presentation/teacher_payments/widgets/teacher_payment_widget.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';

import 'package:qyam_novers_mobile/app/features/teacher_dashboard_payments/domain/entities/teacher_payments.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class TeacherDashboardPaymentsListView
    extends GetView<TeacherDashboardPaymentsController> {
  const TeacherDashboardPaymentsListView({
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
          event: TeacherDashboardPaymentsUiEvent.refresh(),
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
          itemCount: controller.state().teacherPayments.length +
              (controller.state().isLoading ||
                      controller.state().pagedList.nextPage == -1
                  ? 1
                  : 0),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            if (controller.state().isLoading &&
                index == controller.state().teacherPayments.length) {
              return const Center(
                child: AppLoadingWidget(),
              );
            }

            // If we dont have data more
            if (controller.state().pagedList.nextPage == -1 &&
                index == controller.state().teacherPayments.length) {
              return const SizedBox.shrink();
            }

            // Payment card
            return TeacherPaymentWidget(
              teacherPaymentData: controller.state().teacherPayments[index],

              // To-Do : add bottom sheet for show long notes
              onTap: (TeacherPaymentsDataList payment) {
                controller.on(
                  event: TeacherDashboardPaymentsUiEvent.showDialog(
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
