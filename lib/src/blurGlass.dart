// ignore_for_file: file_names

import 'dart:ui';
import 'package:flutter/material.dart';

class BlurGlass extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double outBorderRadius;
  final double inBorderRadius;
  final double filterX;
  final double filterY;
  const BlurGlass(
      {Key? key,
      required this.child,
      this.margin,
      this.padding,
      this.color,
      this.outBorderRadius = 20.0,
      this.inBorderRadius = 30.0,
      this.filterX = 10.0,
      this.filterY = 10.0})
      : super(key: key);

  @override
  _BlurGlassState createState() => _BlurGlassState();
}

class _BlurGlassState extends State<BlurGlass> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.outBorderRadius),
      child: BackdropFilter(
        //背景滤镜器
        filter:
            ImageFilter.blur(sigmaX: widget.filterX, sigmaY: widget.filterY),
        //图片模糊过滤，横向竖向都设置5.0
        child: Container(
          margin: widget.margin, //EdgeInsets.all(widget.marginValue),
          padding: widget.padding, //EdgeInsets.all(widget.paddingValue),
          decoration: BoxDecoration(
            color: widget.color ??
                Theme.of(context).colorScheme.surface.withValues(alpha: .82),
            borderRadius: BorderRadius.circular(widget.inBorderRadius),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
