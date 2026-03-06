import 'package:flutter/material.dart';

extension ContextExtention on BuildContext {
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;

  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
}
