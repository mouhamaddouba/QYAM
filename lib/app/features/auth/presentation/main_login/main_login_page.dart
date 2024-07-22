import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:qyam_novers_mobile/app/core/values/export/export_values.dart';

import 'package:qyam_novers_mobile/app/features/auth/presentation/main_login/main_login_controller.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/main_login/widgets/views/main_login_logo_view.dart';
import 'package:qyam_novers_mobile/app/features/auth/presentation/main_login/widgets/views/main_login_buttons_view.dart';

class MainLoginPage extends GetView<MainLoginController> {
  const MainLoginPage({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Logo
          MainLoginLogoView(),

          // Space
          SizedBox(
            height: AppDimensions.paddingOrMargin100,
          ),

          // Buttons
          MainLoginButtonsView(),
        ],
      ),
    );
  }
}
