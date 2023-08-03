import 'package:analyzer/dart/analysis/analysis_context.dart' as analyzer;
import 'package:analyzer/file_system/file_system.dart' as analyzer;
import 'package:analyzer_plugin/plugin/assist_mixin.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart';
import 'package:analyzer_plugin/utilities/assist/assist.dart';
import 'contributors/class/classname_contributor.dart';

///
/// @see https://github.com/dart-lang/sdk/blob/main/pkg/analyzer_plugin/doc/tutorial/tutorial.md
///
class BasicAnalyzerPlugin extends ServerPlugin with AssistsMixin, DartAssistsMixin {
  BasicAnalyzerPlugin(
    final analyzer.ResourceProvider resourceProvider,
  ) : super(resourceProvider: resourceProvider);

  @override
  List<String> get fileGlobsToAnalyze => const <String>['**/*.dart'];

  @override
  String get name => 'demo_analyzer_plugin';
  String get displayName => '$name v$version';

  @override
  String get contactInfo => 'https://github.com/evaisse/dart_demo_analyzer_plugin';

  @override
  String get version => '1.0.0';

  @override
  Future<void> analyzeFile({
    required analyzer.AnalysisContext analysisContext,
    required String path,
  }) async {
    if (path.isEmpty) return Future.value();

    // final resolvedUnitResult = await getResolvedUnitResult(path);
    //
    // try {
    //   throw 'this is a demo';
    // } catch (e, stackTrace) {
    //   channel.sendNotification(
    //     PluginErrorParams(
    //       false,
    //       'Unexpected error: ${e.toString()}',
    //       stackTrace.toString(),
    //     ).toNotification(),
    //   );
    // }

    channel.sendNotification(
      AnalysisErrorsParams(
        path,
        [
          AnalysisError(
            AnalysisErrorSeverity.ERROR,
            AnalysisErrorType.LINT,
            Location(path, 0, 1, 0, 1),
            "bla bla bla",
            "xxxcode",
          )
        ],
      ).toNotification(),
    );
  }

  @override
  List<AssistContributor> getAssistContributors(String path) {
    return <AssistContributor>[
      // Class contributors
      ClassNameContributor(path),
    ];
  }

// @override
// Future<PluginShutdownResult> handlePluginShutdown(PluginShutdownParams parameters) async {
// _logger.notification('Shutting down $displayName');
// await _logger.dispose();
// return await super.handlePluginShutdown(parameters);
// }

// @override
// void onError(Object exception, StackTrace stackTrace) {
// _logger.exception(exception, stackTrace);
// }
}
