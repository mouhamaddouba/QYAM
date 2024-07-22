import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_strings.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/ui/student_dashboard_classes_ui_event.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_loading_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_no_data_found_widget.dart';

import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/widgets/student_classes_widget.dart';
import 'package:qyam_novers_mobile/app/features/student_dashboard_classes/presentation/student_dashboard_classes_controller.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class StudentDashboardClassesListView
    extends GetView<StudentDashboardClassesController> {
  const StudentDashboardClassesListView({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return SwipeRefresh.material(
          indicatorColor: Theme.of(context).primaryColor,
          stateStream: controller.state().swipeController.stream,
          onRefresh: () {
            controller.on(
              event: StudentDashboardClassesUiEvent.refresh(),
            );
          },
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingOrMargin12,
              ),
              child: controller.state().filteredData.isEmpty

                  // If i don't have classe in select day
                  ? Container(
                      height: MediaQuery.of(context).size.height /
                          AppDimensions.height02,
                      child: AppNoDataFoundWidget(
                        title: AppStrings.noClasses.tr,
                      ),
                    )

                  // If i have classe in select day
                  : ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.state().filteredData.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == controller.state().filteredData.length) {
                          return const Center(
                            child: AppLoadingWidget(),
                          );
                        }

                        // Class card
                        return StudentClassesWidget(
                          classes: controller.state().filteredData[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: AppDimensions.paddingOrMargin8,
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}
