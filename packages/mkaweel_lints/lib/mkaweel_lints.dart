import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'src/route_args_missing_lint.dart';

PluginBase createPlugin() => _MkaweelLintsPlugin();

class _MkaweelLintsPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const RouteArgsMissingLint(),
      ];
}
