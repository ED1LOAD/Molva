import 'package:flutter/material.dart';

const blue1 = Color(0xFF0582EE);
const blue2 = Color(0xFF37ADF5);
const gradient = RadialGradient(
  center: Alignment.center,
  colors: [Color(0xFF07B7F8), Color(0xFF0582EE)],
);

const customTheme = TextTheme(
  bodySmall: TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w100,
    fontSize: 16,
  ),
  bodyMedium: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  ),
  bodyLarge: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  ),
);

class Button extends MaterialButton {
  final RadialGradient? gradient;
  const Button({
    super.key,
    this.gradient,
    required super.onPressed,
    super.onLongPress,
    super.onHighlightChanged,
    super.mouseCursor,
    super.textTheme,
    super.textColor,
    super.disabledTextColor,
    super.color,
    super.disabledColor,
    super.focusColor,
    super.hoverColor,
    super.highlightColor,
    super.splashColor,
    super.colorBrightness,
    super.elevation,
    super.focusElevation,
    super.hoverElevation,
    super.highlightElevation,
    super.disabledElevation,
    super.padding,
    super.visualDensity,
    super.shape,
    super.clipBehavior = Clip.none,
    super.focusNode,
    super.autofocus = false,
    super.materialTapTargetSize,
    super.animationDuration,
    super.minWidth,
    super.height,
    super.enableFeedback = true,
    super.child,
  })  : assert(elevation == null || elevation >= 0.0),
        assert(focusElevation == null || focusElevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        assert(highlightElevation == null || highlightElevation >= 0.0),
        assert(disabledElevation == null || disabledElevation >= 0.0);

  @override
  Widget build(BuildContext context) {
    if (gradient == null) {
      return super.build(context);
    }
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: super.build(context),
    );
  }
}
