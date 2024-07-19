// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qyam/app/core/themes/app_themes.dart';
import 'package:qyam/app/core/values/app_colors.dart';
import 'package:qyam/app/core/values/app_dimensions.dart';
import 'package:qyam/app/core/values/constants/app_constants.dart';
import 'package:qyam/app/global_widgets/app_icon_widget.dart';

class AppTextFieldWidget extends StatelessWidget {
  TextEditingController? textController;
  String text; // Initialized in build
  String? hintText; // Initialized in build
  final double fontSize;
  final FontWeight fontWeight;
  final int? minLines;
  final int? maxLines;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final FormFieldValidator<String>? validator;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  List<TextInputFormatter>? inputFormatters;
  final bool focused;
  final Color textColor;
  final Color backgroundColor;
  final double radius;

  final Widget? suffixIcon;
  final void Function()? onSuffixIconTap;
  final IconData? suffixIconData;
  final String? suffixIconPath;
  final Color suffixIconColor;
  final Widget? prefixIcon;
  final void Function()? onPrefixIconTap;
  final IconData? prefixIconData;
  final String? prefixIconPath;
  final Color prefixIconColor;
  double horizontalPadding;
  double verticalPadding;
  final double? height;

  AppTextFieldWidget({
    super.key,
    this.textController,
    this.text = '',
    this.hintText = '',
    this.fontSize = AppDimensions.fontSize12,
    this.fontWeight = FontWeight.normal,
    this.minLines = 1,
    this.maxLines,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.validator,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.inputFormatters,
    this.focused = false,
    this.textColor = AppColors.black00,
    this.backgroundColor = AppColors.onLight500,
    this.radius = AppDimensions.radius10,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.suffixIconData,
    this.suffixIconPath,
    this.suffixIconColor = AppColors.iconLight,
    this.prefixIcon,
    this.onPrefixIconTap,
    this.prefixIconData,
    this.prefixIconPath,
    this.prefixIconColor = AppColors.iconLight,
    this.horizontalPadding = AppDimensions.paddingOrMargin16,
    this.verticalPadding = AppDimensions.zero,
    this.height = AppDimensions.height50,
  });

  @override
  Widget build(BuildContext context) {
    // Initial Text
    if (text.isNotEmpty) {
      textController ??= TextEditingController();
      textController?.text = text;
    }

    hintText = hintText == null
        ? AppConstants.emptyText
        : hintText?.isEmpty == true
            ? 'typeHere'
            : hintText;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.surfaceVariant
                : AppColors.gray03.withOpacity(0.1),
            blurRadius: AppDimensions.radius08,
            offset: Offset.zero,
          ),
        ],
      ),
      child: SizedBox(
        height: (maxLines ?? 1) > 1 ? null : height,
        child: TextFormField(
          textAlign: textAlign,
          obscureText: obscureText,
          readOnly: readOnly,
          enabled: enabled,
          enableSuggestions: false,
          autocorrect: false,
          textAlignVertical: TextAlignVertical.bottom,
          cursorHeight: 20,
          cursorColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.primary
              : AppColors.darkPrimary,
          minLines: minLines,
          maxLines: maxLines,
          controller: textController,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight,
          ),
          decoration: InputDecoration(
            hintText: enabled ? hintText : AppConstants.emptyText,
            hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.gray03
                  : AppColors.darkPrimary,
              fontSize: AppDimensions.fontSize10,
              fontFamily: AppThemes.appFontFamily,
            ),
            enabled: enabled,
            filled: true,
            fillColor: enabled ? backgroundColor : AppColors.white01,
            contentPadding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            border: _getBorder(),
            enabledBorder: _getBorder(),
            focusedBorder: _getBorder(),
            disabledBorder: _getBorder(),
            suffixIcon: _getSuffixIconWidget(),
            prefixIcon: _getPrefixIconWidget(),
          ),
          validator: validator,
        ),
      ),
    );
  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        radius,
      ),
      borderSide: BorderSide(
        color: focused
            ? AppColors.red01
            : enabled
                ? backgroundColor
                : AppColors.gray01,
        width: focused ? AppDimensions.width01 : AppDimensions.width01,
      ),
    );
  }

  Widget? _getSuffixIconWidget() {
    return suffixIconData != null || suffixIconPath != null
        ? AppIconWidget(
            onTap: onSuffixIconTap,
            iconData: suffixIconData,
            iconPath: suffixIconPath,
            color: suffixIconColor,
          )
        : suffixIcon;
  }

  Widget? _getPrefixIconWidget() {
    return prefixIconData != null || prefixIconPath != null
        ? AppIconWidget(
            onTap: onPrefixIconTap,
            iconData: prefixIconData,
            iconPath: prefixIconPath,
            color: prefixIconColor,
          )
        : prefixIcon;
  }
}
