import 'package:flutter/material.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

class AppRippleWidget extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final double? radius;
  final BorderRadius? borderRadius;

  const AppRippleWidget({
    Key? key,
    this.onTap,
    this.onLongPress,
    required this.child,
    this.radius = AppDimensions.radius10,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        radius: radius,
        borderRadius: borderRadius ??
            BorderRadius.all(
              Radius.circular(
                radius ?? AppDimensions.zero,
              ),
            ),
        onTap: onTap,
        onLongPress: onLongPress,
        child: child,
      ),
    );
  }
}
