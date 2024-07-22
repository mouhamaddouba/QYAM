import 'dart:io';

import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:qyam_novers_mobile/app/core/values/app_dimensions.dart';

class AppImagePreviewWidget extends StatelessWidget {
  final String path;
  final dynamic tag;

  const AppImagePreviewWidget({
    Key? key,
    required this.path,
    this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late ImageProvider image;
    if (path.contains("http")) {
      image = CachedNetworkImageProvider(
        path,
      );
    } else if (path.startsWith("asset") == true) {
      image = AssetImage(
        path,
      );
    } else {
      image = FileImage(
        File(
          path,
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          //systemOverlayStyle: AppThemes.systemUiOverlayStyle,
        ),
        body: Container(
          color: Colors.black,
          child: PhotoView(
            heroAttributes: PhotoViewHeroAttributes(
              tag: tag ?? UniqueKey(),
            ),
            loadingBuilder: (context, event) => Center(
              child: SizedBox(
                width: AppDimensions.width20,
                height: AppDimensions.height20,
                child: CircularProgressIndicator(
                  value: event == null
                      ? AppDimensions.zero
                      : event.cumulativeBytesLoaded.toDouble() /
                          (event.expectedTotalBytes ?? AppDimensions.zero),
                ),
              ),
            ),
            imageProvider: image,
          ),
        ),
      ),
    );
  }
}
