// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.10.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

enum ErrorType {
  /// user passed invalid filepath
  invalidFilename,

  /// no free filepath could be found
  noFilePathFound,

  /// failed connecting to rendezvous server
  connectionError,

  /// error while requesting a file transfer
  fileRequestError,

  /// error while opening the receive file
  fileOpen,

  /// error during file transfer
  transferError,

  /// error while connecting clients
  transferConnectionError,

  /// error creating zip temp file
  zipFileError,
}
