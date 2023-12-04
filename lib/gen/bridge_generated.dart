// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.82.4.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'bridge_generated.io.dart'
    if (dart.library.html) 'bridge_generated.web.dart';

class NativeImpl implements Native {
  final NativePlatform _platform;
  factory NativeImpl(ExternalLibrary dylib) =>
      NativeImpl.raw(NativePlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory NativeImpl.wasm(FutureOr<WasmModule> module) =>
      NativeImpl(module as ExternalLibrary);
  NativeImpl.raw(this._platform);
  Future<void> init({required String tempFilePath, dynamic hint}) {
    var arg0 = _platform.api2wire_String(tempFilePath);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_init(port_, arg0),
      parseSuccessData: _wire2api_unit,
      parseErrorData: null,
      constMeta: kInitConstMeta,
      argValues: [tempFilePath],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kInitConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "init",
        argNames: ["tempFilePath"],
      );

  Stream<TUpdate> sendFiles(
      {required List<String> filePaths,
      required String name,
      required int codeLength,
      required ServerConfig serverConfig,
      dynamic hint}) {
    var arg0 = _platform.api2wire_StringList(filePaths);
    var arg1 = _platform.api2wire_String(name);
    var arg2 = api2wire_u8(codeLength);
    var arg3 = _platform.api2wire_box_autoadd_server_config(serverConfig);
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_send_files(port_, arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_t_update,
      parseErrorData: null,
      constMeta: kSendFilesConstMeta,
      argValues: [filePaths, name, codeLength, serverConfig],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSendFilesConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "send_files",
        argNames: ["filePaths", "name", "codeLength", "serverConfig"],
      );

  Stream<TUpdate> sendFolder(
      {required String folderPath,
      required String name,
      required int codeLength,
      required ServerConfig serverConfig,
      dynamic hint}) {
    var arg0 = _platform.api2wire_String(folderPath);
    var arg1 = _platform.api2wire_String(name);
    var arg2 = api2wire_u8(codeLength);
    var arg3 = _platform.api2wire_box_autoadd_server_config(serverConfig);
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_send_folder(port_, arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_t_update,
      parseErrorData: null,
      constMeta: kSendFolderConstMeta,
      argValues: [folderPath, name, codeLength, serverConfig],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSendFolderConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "send_folder",
        argNames: ["folderPath", "name", "codeLength", "serverConfig"],
      );

  Stream<TUpdate> requestFile(
      {required String passphrase,
      required String storageFolder,
      required ServerConfig serverConfig,
      dynamic hint}) {
    var arg0 = _platform.api2wire_String(passphrase);
    var arg1 = _platform.api2wire_String(storageFolder);
    var arg2 = _platform.api2wire_box_autoadd_server_config(serverConfig);
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_request_file(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_t_update,
      parseErrorData: null,
      constMeta: kRequestFileConstMeta,
      argValues: [passphrase, storageFolder, serverConfig],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kRequestFileConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "request_file",
        argNames: ["passphrase", "storageFolder", "serverConfig"],
      );

  Future<String> getPassphraseUri(
      {required String passphrase, String? rendezvousServer, dynamic hint}) {
    var arg0 = _platform.api2wire_String(passphrase);
    var arg1 = _platform.api2wire_opt_String(rendezvousServer);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_get_passphrase_uri(port_, arg0, arg1),
      parseSuccessData: _wire2api_String,
      parseErrorData: null,
      constMeta: kGetPassphraseUriConstMeta,
      argValues: [passphrase, rendezvousServer],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGetPassphraseUriConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_passphrase_uri",
        argNames: ["passphrase", "rendezvousServer"],
      );

  Future<BuildInfo> getBuildTime({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_get_build_time(port_),
      parseSuccessData: _wire2api_build_info,
      parseErrorData: null,
      constMeta: kGetBuildTimeConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGetBuildTimeConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "get_build_time",
        argNames: [],
      );

  Future<String> defaultRendezvousUrl({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_default_rendezvous_url(port_),
      parseSuccessData: _wire2api_String,
      parseErrorData: null,
      constMeta: kDefaultRendezvousUrlConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDefaultRendezvousUrlConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "default_rendezvous_url",
        argNames: [],
      );

  Future<String> defaultTransitUrl({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_default_transit_url(port_),
      parseSuccessData: _wire2api_String,
      parseErrorData: null,
      constMeta: kDefaultTransitUrlConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDefaultTransitUrlConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "default_transit_url",
        argNames: [],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  bool _wire2api_bool(dynamic raw) {
    return raw as bool;
  }

  BuildInfo _wire2api_build_info(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 3)
      throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
    return BuildInfo(
      buildTime: _wire2api_u64(arr[0]),
      devBuild: _wire2api_bool(arr[1]),
      version: _wire2api_String(arr[2]),
    );
  }

  ConnectionType _wire2api_connection_type(dynamic raw) {
    return ConnectionType.values[raw as int];
  }

  ErrorType _wire2api_error_type(dynamic raw) {
    return ErrorType.values[raw as int];
  }

  Events _wire2api_events(dynamic raw) {
    return Events.values[raw as int];
  }

  int _wire2api_i32(dynamic raw) {
    return raw as int;
  }

  TUpdate _wire2api_t_update(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return TUpdate(
      event: _wire2api_events(arr[0]),
      value: _wire2api_value(arr[1]),
    );
  }

  int _wire2api_u64(dynamic raw) {
    return castInt(raw);
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }

  void _wire2api_unit(dynamic raw) {
    return;
  }

  Value _wire2api_value(dynamic raw) {
    switch (raw[0]) {
      case 0:
        return Value_Int(
          _wire2api_i32(raw[1]),
        );
      case 1:
        return Value_String(
          _wire2api_String(raw[1]),
        );
      case 2:
        return Value_ErrorValue(
          _wire2api_error_type(raw[1]),
          _wire2api_String(raw[2]),
        );
      case 3:
        return Value_Error(
          _wire2api_error_type(raw[1]),
        );
      case 4:
        return Value_ConnectionType(
          _wire2api_connection_type(raw[1]),
          _wire2api_String(raw[2]),
        );
      default:
        throw Exception("unreachable");
    }
  }
}

// Section: api2wire

@protected
int api2wire_u8(int raw) {
  return raw;
}

// Section: finalizer
