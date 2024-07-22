import 'package:flutter/material.dart';

import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_icon_widget.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_text_widget.dart';

class AppTabBarWidget extends StatelessWidget {
  final TabController? tabController;
  final List<IconData> icons;
  final List<String> titles;
  final int mode; // [0: Icon, 1: Title, 2: Icon & Title]
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  final int numberTabs;
  final bool isScrollable;

  const AppTabBarWidget({
    Key? key,
    this.tabController,
    required this.icons,
    required this.titles,
    required this.mode,
    required this.selectedIndex,
    required this.onTap,
    required this.numberTabs,
    this.isBottomIndicator = false,
    this.isScrollable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: numberTabs,
      child: TabBar(
        isScrollable: isScrollable,
        controller: tabController,
        indicatorPadding: const EdgeInsets.all(
          AppDimensions.zero,
        ),
        indicator: BoxDecoration(
          border: isBottomIndicator
              ? Border(
                  bottom: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: AppDimensions.thickness03,
                  ),
                )
              : Border(
                  top: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: AppDimensions.thickness03,
                  ),
                ),
        ),
        tabs: _getTabs(context),
        onTap: onTap,
      ),
    );
  }

  List<Widget> _getTabs(BuildContext context) {
    return icons
        .asMap()
        .map((index, iconData) {
          return MapEntry(
            index,
            Tab(
              icon: mode != 1
                  ? AppIconWidget(
                      iconData: iconData,
                      color: index == selectedIndex
                          ? AppColors.primary
                          : AppColors.iconLight,
                      size: AppDimensions.iconSize18,
                    )
                  : null,
              child: mode != 0
                  ? AppTextWidget(
                      titles[index],
                      textColor: index == selectedIndex
                          ? Theme.of(context).primaryColor
                          : AppColors.iconLight,
                      fontWeight: index == selectedIndex
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: AppDimensions.fontSize10,
                    )
                  : null,
            ),
          );
        })
        .values
        .toList();
  }
}
