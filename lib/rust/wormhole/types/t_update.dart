// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.9.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'error_types.dart';
import 'events.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'value.dart';

class TUpdate {
  final Events event;
  final Value value;

  const TUpdate({
    required this.event,
    required this.value,
  });

  @override
  int get hashCode => event.hashCode ^ value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TUpdate &&
          runtimeType == other.runtimeType &&
          event == other.event &&
          value == other.value;
}
