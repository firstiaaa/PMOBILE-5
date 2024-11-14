import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({
    super.key,
    required Widget child,
    required ValueNotifier<List<Plan>> notifier,
  }) : super(child: child, notifier: notifier);

  static ValueNotifier<List<Plan>> of(BuildContext context) {
  final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
  if (provider != null) {
    return provider.notifier!;
  } else {
    throw Exception('PlanProvider not found in the widget tree');
  }
}
}