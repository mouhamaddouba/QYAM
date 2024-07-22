import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:qyam_novers_mobile/app/core/values/app_colors.dart';
import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';
import 'package:qyam_novers_mobile/app/global_widgets/app_ripple_widget.dart';

class AppDropDownWidget<T> extends StatefulWidget {
  final bool isEnabled;

  final Widget selectedItem;
  final List<T> items;
  final Widget Function(BuildContext, int) builder;

  final T? value;
  final ValueChanged<T?>? onChange;

  final double radius;

  const AppDropDownWidget({
    Key? key,
    this.isEnabled = true,
    required this.selectedItem,
    required this.items,
    required this.builder,
    this.value,
    this.onChange,
    this.radius = AppDimensions.radius08,
  }) : super(key: key);

  @override
  _AppDropDownWidgetState<T> createState() => _AppDropDownWidgetState<T>();
}

class _AppDropDownWidgetState<T> extends State<AppDropDownWidget<T>> {
  final GlobalKey _key = GlobalKey();
  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();

  T? selected;

  bool isHovered = false;
  bool isFocused = false;

  bool _isOverlayShown = false;
  OverlayEntry? _overlay;
  FocusScopeNode? _focusScopeNode;

  @override
  void initState() {
    super.initState();
    if (widget.items.isNotEmpty) {
      selected = widget.value == null
          ? widget.items.first
          : widget.items.firstWhereOrNull(
              (item) => item == widget.value,
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: widget.isEnabled ? _onTap : null,
        child: FocusableActionDetector(
          focusNode: _focusNode,
          mouseCursor: SystemMouseCursors.click,
          actions: {
            ActivateIntent: CallbackAction<Intent>(
              onInvoke: (_) => _onTap(),
            ),
          },
          onShowFocusHighlight: (isFocused) => setState(
            () => isFocused = isFocused,
          ),
          onShowHoverHighlight: (isHovered) => setState(
            () => isHovered = isHovered,
          ),
          child: Container(
            key: _key,
            // _isHovered || _isFocused || _isOverlayShown ? AppColors.primary : AppColors.black02
            child: widget.selectedItem,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _focusNode.dispose();
    // _focusScopeNode?.dispose();
  }

  OverlayEntry _createOverlay() {
    _focusScopeNode = FocusScopeNode();
    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _removeOverlay,
        child: Stack(
          children: [
            CompositedTransformFollower(
              offset: const Offset(
                0,
                AppDimensions.paddingOrMargin6,
              ),
              link: _layerLink,
              showWhenUnlinked: false,
              targetAnchor: Alignment.bottomLeft,
              followerAnchor: Alignment.topLeft,
              child: Material(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    widget.radius,
                  ),
                ),
                elevation: AppDimensions.elevation04,
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      widget.radius,
                    ),
                  ),
                  child: FocusScope(
                    node: _focusScopeNode,
                    child: _createListItems(),
                    onKey: (node, event) {
                      if (event.logicalKey == LogicalKeyboardKey.escape) {
                        _removeOverlay();
                      }
                      return KeyEventResult.ignored;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _removeOverlay() {
    _overlay!.remove();
    _isOverlayShown = false;
    _focusScopeNode!.dispose();
    FocusScope.of(context).nextFocus();
  }

  Widget _createListItems() {
    double menuHeight = widget.items.length >= 4
        ? 4 * AppDimensions.height40
        : widget.items.length * AppDimensions.height40;

    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;

    return Container(
      margin: const EdgeInsets.only(
        top: AppDimensions.zero,
      ),
      height: menuHeight,
      width: renderBox.size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            widget.radius,
          ),
        ),
        color: AppColors.white01,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          for (int i = 0; i < widget.items.length; i++)
            AppRippleWidget(
              onTap: () {
                // (widget.items[i] as AppTextWidget).onWidgetTap!();
                _onListItemTap(
                  widget.items[i],
                );
              },
              child: widget.builder(
                context,
                i,
              ),
            ),
        ],
      ),
    );
  }

  void _onTap() {
    if (_isOverlayShown) {
      _removeOverlay();
    } else {
      _overlay = _createOverlay();
      Overlay.of(context).insert(_overlay!);
      _isOverlayShown = true;
      FocusScope.of(context).setFirstFocus(_focusScopeNode!);
    }

    /// [Error_Notes]
    //AppUiUtils.unFocusAll(Get.context);
  }

  void _onListItemTap(T item) {
    _removeOverlay();
    setState(() {
      selected = item;
    });

    widget.onChange?.call(item);
  }
}
