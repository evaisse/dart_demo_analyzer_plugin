import 'dart:isolate';
import 'plugin.dart' as plg;

void main() {
  /// Where I listen to the message from Mike's port
  ReceivePort myReceivePort = ReceivePort();
  var isolate = plg.main([], myReceivePort.sendPort);
}
