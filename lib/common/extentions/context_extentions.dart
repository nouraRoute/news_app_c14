import 'package:flutter/material.dart';

extension ContextExtentions on BuildContext {
  TextTheme getTextThemes() {
    return Theme.of(this).textTheme;
  }

  Size getScreenSize() {
    return MediaQuery.of(this).size;
  }

  ColorScheme getColorSceem() {
    return Theme.of(this).colorScheme;
  }
}
//context.getTextThemes
