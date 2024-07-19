import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

typedef BindingCreator<S extends Bindings> = S Function();

abstract class BaseWidget<Binding extends Bindings, Controller>
    extends GetView<Controller> {
  final BindingCreator<Binding>? bindingCreator;

  const BaseWidget({
    Key? key,
    required this.bindingCreator,
  }) : super(
          key: key,
        );

  Widget view(BuildContext context);

  @override
  @nonVirtual
  Widget build(BuildContext context) {
    _createBinding();
    return view(context);
  }

  void _createBinding() {
    Binding? binding = bindingCreator?.call();
    binding?.dependencies();
  }
}
