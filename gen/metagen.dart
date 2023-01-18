import 'dart:io';

import 'package:yaml/yaml.dart';

void main() {
  print('generating version file');
  MetaUpdate('../pubspec.yaml').writeMetaDartFile('../lib/gen/meta.dart');
}

class MetaUpdate {
  String pathToYaml = '';
  String metaDartFileContents = '';
  MetaUpdate(this.pathToYaml);

  void writeMetaDartFile(String metaDartFilePath) {
    File metaDartFile = File(metaDartFilePath);

    final version = getPubSpec('version');
    final time = DateTime.now().millisecondsSinceEpoch;
    print('Version: $version');
    print('BuildTime: $time');

    String metaDartFileContents = """
/// DO NOT EDIT THIS FILE EXCEPT TO ENTER INITIAL VERSION AND OTHER META INFO
/// THIS FILE IS AUTOMATICALLY OVERWRITTEN

class Meta {
  static const String version = '$version';
  static const int buildTime = $time;
  static const bool devBuild = false;
}
  """;

    metaDartFile.writeAsStringSync(metaDartFileContents);
  }

  String getPubSpec(String pubSpecParam) {
    File f = File(pathToYaml);

    String yamlText = f.readAsStringSync();
    // ignore: always_specify_types
    Map yaml = loadYaml(yamlText);

    return yaml[pubSpecParam];
  }
}
