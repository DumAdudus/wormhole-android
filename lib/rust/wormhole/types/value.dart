// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.9.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'error_types.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
part 'value.freezed.dart';

enum ConnectionType {
  relay,
  direct,
  ;
}

@freezed
sealed class Value with _$Value {
  const Value._();

  /// Integer value
  const factory Value.int(
    int field0,
  ) = Value_Int;

  /// String value
  const factory Value.string(
    String field0,
  ) = Value_String;

  /// Error value with message
  const factory Value.errorValue(
    ErrorType field0,
    String field1,
  ) = Value_ErrorValue;

  /// Plain error
  const factory Value.error(
    ErrorType field0,
  ) = Value_Error;

  /// Type of connection with corresponding ip/url
  const factory Value.connectionType(
    ConnectionType field0,
    String field1,
  ) = Value_ConnectionType;
}
