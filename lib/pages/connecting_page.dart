import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

import '../navigation/back_pop_context.dart';
import '../navigation/disallow_pop_context.dart';
// import '../gen/ffi.dart' if (dart.library.html) 'ffi_web.dart';
import '../rust/wormhole/types/error_types.dart';
import '../rust/wormhole/types/events.dart';
import '../rust/wormhole/types/t_update.dart';
import '../rust/wormhole/types/value.dart';
import '../utils/log.dart';
import 'transfer_widgets/transfer_code.dart';
import 'transfer_widgets/transfer_connecting.dart';
import 'transfer_widgets/transfer_error.dart';
import 'transfer_widgets/transfer_progress.dart';
import 'transfer_widgets/transfer_zip_progress.dart';
import 'type_helpers.dart';

class ConnectingPage extends StatefulWidget {
  const ConnectingPage({super.key, required this.stream, required this.finish});

  final Stream<TUpdate> stream;
  final Widget Function(String file) finish;

  @override
  State<ConnectingPage> createState() => _ConnectingPageState();
}

class _ConnectingPageState extends State<ConnectingPage> {
  int? total;
  int? totalFileNr;
  ConnectionType? connectionType;
  String? connectionTypeName;

  late StreamController<TUpdate> controller =
      StreamController<TUpdate>.broadcast()..addStream(widget.stream);

  @override
  void initState() {
    super.initState();
    controller.stream.listen((e) {
      logger.config('stream event: ${e.event}');
      switch (e.event) {
        case Events.total:
          total = e.getValue();
          logger.config('total size: $total');
          break;
        case Events.connectionType:
          connectionType = (e.value as Value_ConnectionType).field0;
          connectionTypeName = (e.value as Value_ConnectionType).field1;
          logger.config('connectionType: $connectionTypeName');
          break;
        case Events.zipFilesTotal:
          totalFileNr = e.getValue();
          logger.config('file count: $totalFileNr');
          break;
        default:
          logger.config('unknown event: ${e.event}');
          break;
      }
    });
  }

  Widget _handleEvent(TUpdate event) {
    logger.config('new event: ${event.event}');
    switch (event.event) {
      case Events.connecting:
        return const TransferConnecting();
      case Events.code:
        return BackPopContext(child: TransferCode(data: event));
      case Events.startTransfer:
      case Events.connectionType:
      case Events.total:
      case Events.sent:
        return DisallowPopContext(
          child: TransferProgress(
            data: event,
            total: total,
            linkType: connectionType,
            linkName: connectionTypeName,
          ),
        );
      case Events.error:
        return BackPopContext(
          child: TransferError(
            error: event.value.field0 as ErrorType,
            message:
                event.value is Value_ErrorValue
                    ? (event.value as Value_ErrorValue).field1
                    : null,
          ),
        );
      case Events.finished:
        Vibration.vibrate();
        return BackPopContext(child: widget.finish(event.getValue()));
      case Events.zipFilesTotal:
      case Events.zipFiles:
        return DisallowPopContext(
          child: TransferZipProgress(data: event, totalFileNr: totalFileNr),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TUpdate>(
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const DisallowPopContext(child: TransferConnecting());
          case ConnectionState.waiting:
            return const DisallowPopContext(child: TransferConnecting());
          case ConnectionState.active:
            final d = snapshot.data!;
            return _handleEvent(d);
          case ConnectionState.done:
            return const BackPopContext(
              child: TransferError(
                error: ErrorType.connectionError,
                message: 'Connection Stream closed',
              ),
            );
        }
      },
      stream: controller.stream,
    );
  }
}
