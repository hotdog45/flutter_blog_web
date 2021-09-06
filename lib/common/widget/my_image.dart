import 'dart:math';

import 'package:flutter/material.dart';

String testImage =
    "https://bing.ioliu.cn/v1/rand?key=person&w=${Random().nextInt(700)}&h=${Random().nextInt(700)}";
String testImage2 =
    "https://picsum.photos/${Random().nextInt(700)}/${Random().nextInt(700)}/";

/// 网络图片加载
class MyImage extends StatelessWidget {
  final String imageUrl;
  final String? placeholder;
  final BoxFit? fit;

  final Widget? child;
  final Color borderColor;

  final bool isAssetImage;
  final bool isOval;
  final bool hasBorder;

  final double borderWidth;
  final double radius;
  final double? height;
  final double? width;

  final progressIndicatorBuilder;
  final errorWidget;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongPress;
  final GestureTapCallback? onDoubleTap;

  const MyImage(this.imageUrl,
      {Key? key,
      this.placeholder,
      this.child,
      this.fit =  BoxFit.cover,
      this.width,
      this.isAssetImage = false,
      this.isOval = false,
      this.hasBorder = false,
      this.borderColor = Colors.transparent,
      this.borderWidth = 0.5,
      this.radius = 0,
      this.height,
      this.onTap,
      this.onLongPress,
      this.onDoubleTap,
      this.padding,
      this.margin,
      this.progressIndicatorBuilder,
      this.errorWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 占位图
    // Widget placeholderWidget = Container();
    Widget imageWidget;

    if (isAssetImage) {
      imageWidget = Image.asset(
        "" + imageUrl,
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      String img = imageUrl;
      if (img == null || img.length < 5) {
        img =  "https://picsum.photos/${Random().nextInt(700) + 600}/${Random().nextInt(700) + 600}/";
      } else {
        if (!imageUrl.startsWith("http") && !imageUrl.startsWith("https://")) {
          img = "https://" + img;
        }
      }
      imageWidget = Image.network(img,width: width,height: height,fit: fit);
    }

    if (padding != null) {
      imageWidget = Padding(padding: padding!, child: imageWidget);
    }

    if (radius > 0) {
      imageWidget = ClipRRect(
          borderRadius: BorderRadius.circular(radius), child: imageWidget);
    }
    if (isOval) {
      imageWidget = ClipOval(child: imageWidget);
    }
    if (child != null) {
      imageWidget = Stack(children: [imageWidget, child!]);
    }
    if (onTap != null || onDoubleTap != null || onLongPress != null) {
      imageWidget = InkWell(
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          highlightColor: Colors.transparent,
          radius: 0.0,
          child: imageWidget);
    }

    imageWidget = Container(
      margin: margin,
      child: imageWidget,
      decoration: BoxDecoration(
        border: hasBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
        borderRadius:
            BorderRadius.all(Radius.circular(isOval ? width! / 2 : radius)),
      ),
    );
    return imageWidget;
  }
}
