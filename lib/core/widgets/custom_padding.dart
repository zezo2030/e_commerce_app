import 'package:flutter/material.dart';

/// Extension on [Widget] to add convenient padding methods
extension CustomPadding on Widget {
  /// Adds equal padding on all sides
  Widget paddingAll(double value) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  /// Adds horizontal padding (left and right)
  Widget paddingHorizontal(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  /// Adds vertical padding (top and bottom)
  Widget paddingVertical(double value) {
    return Padding(padding: EdgeInsets.symmetric(vertical: value), child: this);
  }

  /// Adds padding with custom values for each side
  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  /// Adds padding with specific values for each axis
  Widget paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  /// Adds standard small padding (8.0) on all sides
  Widget paddingSmall() {
    return paddingAll(8.0);
  }

  /// Adds standard medium padding (16.0) on all sides
  Widget paddingMedium() {
    return paddingAll(16.0);
  }

  /// Adds standard large padding (24.0) on all sides
  Widget paddingLarge() {
    return paddingAll(24.0);
  }
}
