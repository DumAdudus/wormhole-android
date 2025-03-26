import 'package:logging/logging.dart';

final logger = Logger('[wormhole]');

Future initLogging() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print(
        '${record.loggerName} ${record.level.name} ${record.time}: ${record.message}');
  });
}
