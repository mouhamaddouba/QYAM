import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:qyam/app/core/values/app_colors.dart';
import 'package:qyam/app/core/values/app_dimensions.dart';
import 'package:qyam/app/core/values/app_strings.dart';
import 'package:qyam/app/global_widgets/app_button_widget.dart';
import 'package:qyam/app/global_widgets/app_icon_widget.dart';
import 'package:qyam/app/global_widgets/app_text_widget.dart';

// ignore: must_be_immutable
class AppDefaultDialogWidget extends StatelessWidget {
  final String? title;
  List<Widget> actionButtons;
  final Widget? icon;
  final DialogTypeEnum dialogTypeEnum;
  final String message;
  final Widget? content;
  final Function()? onConfirm;
  final Function()? onCancel;
  final String? textConfirm;
  final String? textCancel;

  AppDefaultDialogWidget({
    Key? key,
    this.title,
    this.actionButtons = const [],
    this.icon,
    this.dialogTypeEnum = DialogTypeEnum.primary,
    this.message = AppStrings.alertMassageNoContentText,
    this.content,
    this.onConfirm,
    this.onCancel,
    this.textConfirm,
    this.textCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textCancelTemp = textCancel ?? AppStrings.cancel.tr;
    final textConfirmTemp = textConfirm ?? AppStrings.ok.tr;

    final paddingCancelFactor = textCancelTemp.length < 5 ? 3 : 1;
    final paddingConfirmFactor = textConfirmTemp.length < 5 ? 3 : 1;

    actionButtons = actionButtons.isEmpty
        ? [
            // Cancel
            onCancel != null
                ? AppButtonWidget(
                    text: textCancelTemp,
                    onPressed: onCancel,
                    // width: AppDimensions.buttonWidth80,
                    textColor: AppColors.black02,
                    color: AppColors.background,
                    padding: EdgeInsetsDirectional.only(
                      start:
                          AppDimensions.paddingOrMargin10 * paddingCancelFactor,
                      end:
                          AppDimensions.paddingOrMargin10 * paddingCancelFactor,
                    ),
                  )
                : const SizedBox.shrink(),

            // Space
            if (onCancel != null && onConfirm != null)
              const SizedBox(
                width: AppDimensions.paddingOrMargin10,
              ),

            // Confirm
            onConfirm != null
                ? AppButtonWidget(
                    text: textConfirmTemp,
                    onPressed: onConfirm,
                    width: AppDimensions.width80,
                    textColor: AppColors.onPrimary,
                    color: _getPrimaryColor(context),
                    padding: EdgeInsetsDirectional.only(
                      start:
                          AppDimensions.paddingOrMargin8 * paddingConfirmFactor,
                      end:
                          AppDimensions.paddingOrMargin8 * paddingConfirmFactor,
                    ),
                  )
                : const SizedBox.shrink(),
          ]
        : actionButtons;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.radius10,
        ),
      ),
      elevation: AppDimensions.elevation04,
      child: ClipRRect(
        borderRadius: const BorderRadiusDirectional.all(
          Radius.circular(
            AppDimensions.radius10,
          ),
        ),
        child: Container(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.onPrimary
              : AppColors.primary,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppDimensions.paddingOrMargin16,
              vertical: AppDimensions.paddingOrMargin16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon & Title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon
                    (icon != null)
                        ? icon!
                        : AppIconWidget(
                            iconData: _getIconData(),
                            color: _getPrimaryColor(context),
                            size: AppDimensions.iconSize30,
                          ),

                    // Space
                    const SizedBox(
                      width: AppDimensions.paddingOrMargin10,
                    ),

                    // Title
                    // if (title != null)
                    Expanded(
                      child: AppTextWidget(
                        title ?? AppStrings.noticeLabel.tr,
                        textAlign: TextAlign.start,
                        fontSize: AppDimensions.fontSize10,
                        fontWeight: FontWeight.w600,
                        textColor:
                            Theme.of(context).brightness == Brightness.light
                                ? AppColors.darkOnPrimary
                                : AppColors.onPrimary,
                      ),
                    ),
                  ],
                ),

                // Space
                const SizedBox(
                  height: AppDimensions.paddingOrMargin16,
                ),

                // Content
                (content != null)
                    ? Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: content!,
                      )
                    : SingleChildScrollView(
                        child: Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: AppTextWidget(
                            message.tr,
                            textAlign: TextAlign.start,
                            fontSize: AppDimensions.fontSize16,
                            fontWeight: FontWeight.w500,
                            textColor: AppColors.black01,
                            maxLines: 10,
                          ),
                        ),
                      ),

                // Space
                const SizedBox(
                  height: AppDimensions.paddingOrMargin20,
                ),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actionButtons,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getIconData() {
    if (dialogTypeEnum == DialogTypeEnum.error) {
      return Icons.warning;
    } else if (dialogTypeEnum == DialogTypeEnum.warning) {
      return Icons.warning;
    } else if (dialogTypeEnum == DialogTypeEnum.success) {
      return Icons.check;
    } else {
      return Icons.check;
    }
  }

  Color _getPrimaryColor(BuildContext context) {
    if (dialogTypeEnum == DialogTypeEnum.error) {
      return AppColors.errorLight;
    } else if (dialogTypeEnum == DialogTypeEnum.warning) {
      return AppColors.warningLight;
    } else if (dialogTypeEnum == DialogTypeEnum.success) {
      return AppColors.successLight;
    } else {
      return Theme.of(context).primaryColor;
    }
  }
}

enum DialogTypeEnum {
  primary,
  success,
  warning,
  error,
}
