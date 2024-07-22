import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/features/student_profile/presentation/student_profile/student_profile_controller.dart';

import 'package:qyam_novers_mobile/app/global_widgets/app_list_tile_widget.dart';

class StudentProfileExpansionTileView
    extends GetView<StudentProfileController> {
  final String iconPathExpansionTile;
  final String textTitleExpansionTile;
  final String iconPathItem01;
  final String textTitleItem01;
  final String iconPathItem02;
  final String textTitleItem02;
  final void Function() onTap01;
  final void Function() onTap02;

  const StudentProfileExpansionTileView({
    Key? key,
    required this.iconPathExpansionTile,
    required this.textTitleExpansionTile,
    required this.iconPathItem01,
    required this.textTitleItem01,
    required this.iconPathItem02,
    required this.textTitleItem02,
    required this.onTap01,
    required this.onTap02,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    // Animation for form
    return ExpansionTile(
      // style list expansion
      shape: Border(),
      collapsedIconColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
      tilePadding: EdgeInsetsDirectional.only(
        end: AppDimensions.paddingOrMargin16,
      ),
      title: AppListTileWidget(
        iconPath: iconPathExpansionTile,
        textTitle: textTitleExpansionTile,
        isListView: true,
      ),

      // when the list expand
      children: [
        Column(
          children: [
            // Item 01
            InkWell(
              onTap: onTap01,
              child: AppListTileWidget(
                paddingListTile: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingOrMargin40,
                ),
                textTitle: textTitleItem01,
                iconPath: iconPathItem01,
              ),
            ),

            // Item 02
            InkWell(
              onTap: onTap02,
              child: AppListTileWidget(
                paddingListTile: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingOrMargin40,
                ),
                textTitle: textTitleItem02,
                iconPath: iconPathItem02,
                isListView: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
