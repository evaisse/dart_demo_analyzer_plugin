import 'package:analyzer_plugin/utilities/assist/assist.dart';

class ClassNameContributor extends AssistContributor {
  String path;

  ClassNameContributor(this.path);

  @override
  Future<void> computeAssists(covariant AssistRequest request, AssistCollector collector) {
    // TODO: implement computeAssists
    throw UnimplementedError();
  }
}
