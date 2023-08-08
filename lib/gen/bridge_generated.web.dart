// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.79.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'bridge_generated.dart';
export 'bridge_generated.dart';

class NativePlatform extends FlutterRustBridgeBase<NativeWire>
    with FlutterRustBridgeSetupMixin {
  NativePlatform(FutureOr<WasmModule> dylib) : super(NativeWire(dylib)) {
    setupMixinConstructor();
  }
  Future<void> setup() => inner.init;

// Section: api2wire

  @protected
  String api2wire_String(String raw) {
    return raw;
  }

  @protected
  List<String> api2wire_StringList(List<String> raw) {
    return raw;
  }

  @protected
  List<dynamic> api2wire_box_autoadd_server_config(ServerConfig raw) {
    return api2wire_server_config(raw);
  }

  @protected
  String? api2wire_opt_String(String? raw) {
    return raw == null ? null : api2wire_String(raw);
  }

  @protected
  List<dynamic> api2wire_server_config(ServerConfig raw) {
    return [api2wire_String(raw.rendezvousUrl), api2wire_String(raw.relayUrl)];
  }

  @protected
  Uint8List api2wire_uint_8_list(Uint8List raw) {
    return raw;
  }
// Section: finalizer
}

// Section: WASM wire module

@JS('wasm_bindgen')
external NativeWasmModule get wasmModule;

@JS()
@anonymous
class NativeWasmModule implements WasmModule {
  external Object /* Promise */ call([String? moduleName]);
  external NativeWasmModule bind(dynamic thisArg, String moduleName);
  external dynamic /* void */ wire_init(
      NativePortType port_, String temp_file_path);

  external dynamic /* void */ wire_send_files(
      NativePortType port_,
      List<String> file_paths,
      String name,
      int code_length,
      List<dynamic> server_config);

  external dynamic /* void */ wire_send_folder(
      NativePortType port_,
      String folder_path,
      String name,
      int code_length,
      List<dynamic> server_config);

  external dynamic /* void */ wire_request_file(NativePortType port_,
      String passphrase, String storage_folder, List<dynamic> server_config);

  external dynamic /* void */ wire_get_passphrase_uri(
      NativePortType port_, String passphrase, String? rendezvous_server);

  external dynamic /* void */ wire_get_build_time(NativePortType port_);

  external dynamic /* void */ wire_default_rendezvous_url(NativePortType port_);

  external dynamic /* void */ wire_default_relay_url(NativePortType port_);
}

// Section: WASM wire connector

class NativeWire extends FlutterRustBridgeWasmWireBase<NativeWasmModule> {
  NativeWire(FutureOr<WasmModule> module)
      : super(WasmModule.cast<NativeWasmModule>(module));

  void wire_init(NativePortType port_, String temp_file_path) =>
      wasmModule.wire_init(port_, temp_file_path);

  void wire_send_files(NativePortType port_, List<String> file_paths,
          String name, int code_length, List<dynamic> server_config) =>
      wasmModule.wire_send_files(
          port_, file_paths, name, code_length, server_config);

  void wire_send_folder(NativePortType port_, String folder_path, String name,
          int code_length, List<dynamic> server_config) =>
      wasmModule.wire_send_folder(
          port_, folder_path, name, code_length, server_config);

  void wire_request_file(NativePortType port_, String passphrase,
          String storage_folder, List<dynamic> server_config) =>
      wasmModule.wire_request_file(
          port_, passphrase, storage_folder, server_config);

  void wire_get_passphrase_uri(
          NativePortType port_, String passphrase, String? rendezvous_server) =>
      wasmModule.wire_get_passphrase_uri(port_, passphrase, rendezvous_server);

  void wire_get_build_time(NativePortType port_) =>
      wasmModule.wire_get_build_time(port_);

  void wire_default_rendezvous_url(NativePortType port_) =>
      wasmModule.wire_default_rendezvous_url(port_);

  void wire_default_relay_url(NativePortType port_) =>
      wasmModule.wire_default_relay_url(port_);
}
