import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

// ─── Plugin Entry Point ───────────────────────────────────────────────────────
PluginBase createPlugin() => _MkaweelLinter();

class _MkaweelLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const RouteArgsMissingLint(),
      ];
}

// ─── Lint Rule ─────────────────────────────────────────────────────────────────
/// Detects calls to AutoRoute classes whose names end with "Route" and
/// that pass no positional/named arguments, when the corresponding
/// *RouteArgs class is declared in the same library.
///
/// Example violation:
///   context.router.replace(MainHomeRoute()); // ← no args, but MainHomeRouteArgs exists
///
/// Fix:
///   context.router.replace(MainHomeRoute(args: MainHomeRouteArgs(title: '...')));
class RouteArgsMissingLint extends DartLintRule {
  const RouteArgsMissingLint() : super(code: _code);

  static const LintCode _code = LintCode(
    name: 'route_args_missing',
    problemMessage:
        "'{0}' requires a '{1}' argument but none was provided. "
        "The route will crash at runtime.",
    correctionMessage:
        "Pass the required args: {0}(args: {1}(...))",
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addInstanceCreationExpression((node) {
      final typeName = node.constructorName.type.name2.lexeme;

      // Only care about *Route classes
      if (!typeName.endsWith('Route')) return;

      // Skip if arguments were actually provided (excluding children)
      final args = node.argumentList.arguments
          .where((a) => !(a is NamedExpression && a.name.label.name == 'children'))
          .toList();
      if (args.isNotEmpty) return;

      // The expected args class name
      final expectedArgsClass = typeName.replaceFirst('Route', 'RouteArgs');

      // Check if *RouteArgs exists in any imported/visible library
      final element = node.constructorName.staticElement;
      if (element == null) return;

      final library = element.library;
      if (library == null) return;

      // Look through all top-level elements for the args class
      final argsClassExists = library.topLevelElements.any(
        (e) => e.name == expectedArgsClass,
      );

      if (argsClassExists) {
        reporter.atNode(
          node,
          _code,
          arguments: [typeName, expectedArgsClass],
        );
      }
    });
  }
}
