import 'dart:isolate';

import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer_plugin/starter.dart';
import 'src/basic_analyzer_plugin.dart';

void start(Iterable<String> args, SendPort sendPort) {
  ServerPluginStarter(BasicAnalyzerPlugin(
    PhysicalResourceProvider.INSTANCE,
  )).start(sendPort);
}
