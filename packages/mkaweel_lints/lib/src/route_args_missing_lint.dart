import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class RouteArgsMissingLint extends DartLintRule {
  const RouteArgsMissingLint() : super(code: _code);

  static const LintCode _code = LintCode(
    name: 'route_args_missing',
    problemMessage: 'Missing args',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(CustomLintResolver resolver, ErrorReporter reporter, CustomLintContext context) {
    context.registry.addInstanceCreationExpression((node) {
      final typeName = node.constructorName.type.name2.lexeme;

      // Only care about *Route classes
      if (!typeName.endsWith('Route')) return;

      // Skip if arguments were actually provided (excluding children)
      final args = node.argumentList.arguments
          .where((a) => !(a is NamedExpression && a.name.label.name == 'children'))
          .toList();
      if (args.isNotEmpty) return;

      final expectedArgsClass = typeName.replaceFirst('Route', 'RouteArgs');
      if (args.isEmpty) {
        reporter.reportErrorForNode(
          _code,
          node,
          [typeName, expectedArgsClass],
        );
      }
    });
  }
}
