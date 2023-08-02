import 'dart:isolate';

import 'package:demo_analyzer_plugin/demo_analyzer_plugin.dart';

void main(List<String> args, SendPort sendPort) {
  start(args, sendPort);
}
