/// switch_types.dart
///
/// Switches the declared type of specific fields in Dart source files.
///
/// Usage:
///   dart tool/switch_types.dart <directory> --fields <f1,f2,...> --from <type> --to <type> [--dry-run]
///
/// Examples:
///   dart tool/switch_types.dart lib/features --fields id,count --from int --to int? --dry-run
///   dart tool/switch_types.dart lib/             --fields status  --from String? --to String
///   dart tool/switch_types.dart lib/features/screens/market_prices --fields construction_materials_count --from int --to int?

import 'dart:io';

// ─── ANSI colours ──────────────────────────────────────────────────────────
const _reset = '\x1B[0m';
const _bold = '\x1B[1m';
const _green = '\x1B[32m';
const _yellow = '\x1B[33m';
const _cyan = '\x1B[36m';
const _red = '\x1B[31m';
const _dim = '\x1B[2m';
//# Make a single field nullable
// dart tool/switch_types.dart lib/ --fields construction_materials_count --from int --to "int?"
//
// # Make multiple fields nullable at once
// dart tool/switch_types.dart lib/ --fields id,count,total --from int --to "int?"
//
// # Change a type completely
// dart tool/switch_types.dart lib/features/screens/market_prices --fields status --from String --to bool
//
// # Always dry-run first to preview!
// dart tool/switch_types.dart lib/ --fields id --from int --to "int?" --dry-run
void main(List<String> rawArgs
    ) {
  // ── Parse arguments ───────────────────────────────────────────────────────
  final args = _Args.parse(rawArgs);
  if (args == null) {
    _printUsage();
    exit(1);
  }

  final dir = Directory(args.directory);
  if (!dir.existsSync()) {
    _err('Directory not found: ${args.directory}');
    exit(1);
  }

  _printBanner(args);

  // ── Collect .dart files (skip generated files) ───────────────────────────
  final files = dir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) =>
          f.path.endsWith('.dart') &&
          !f.path.endsWith('.freezed.dart') &&
          !f.path.endsWith('.g.dart') &&
          !f.path.endsWith('.gr.dart'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  if (files.isEmpty) {
    _warn('No Dart source files found in ${args.directory}');
    exit(0);
  }

  int totalFiles = 0;
  int totalReplacements = 0;

  for (final file in files) {
    final result = _processFile(file, args);
    if (result.replacements > 0) {
      totalFiles++;
      totalReplacements += result.replacements;
      _printFileResult(file.path, result, args.dryRun);
    }
  }

  // ── Summary ───────────────────────────────────────────────────────────────
  print('\n$_bold──────────────────────────────────────────$_reset');
  if (totalReplacements == 0) {
    _warn('No matches found for fields [${args.fields.join(', ')}] '
        'with type "${args.from}" in ${files.length} file(s).');
  } else {
    final action = args.dryRun ? '${_yellow}Would change$_reset' : '${_green}Changed$_reset';
    print('$action $_bold$totalReplacements$_reset replacement(s) '
        'across $_bold$totalFiles$_reset file(s).');
    if (args.dryRun) {
      print('${_yellow}Dry-run mode — no files were written.$_reset');
      print('Run without --dry-run to apply changes.');
    } else {
      print('${_dim}Run build_runner to regenerate .freezed.dart / .g.dart files:$_reset');
      print('  ${_cyan}dart run build_runner build --force-jit$_reset');
    }
  }
  print('$_bold──────────────────────────────────────────$_reset\n');
}

// ─── Core processing ─────────────────────────────────────────────────────────

class _FileResult {
  final int replacements;
  final List<_Change> changes;
  _FileResult(this.replacements, this.changes);
}

class _Change {
  final int lineNumber;
  final String before;
  final String after;
  _Change(this.lineNumber, this.before, this.after);
}

_FileResult _processFile(File file, _Args args) {
  final original = file.readAsStringSync();
  final lines = original.split('\n');
  final changes = <_Change>[];
  final newLines = <String>[];

  for (var i = 0; i < lines.length; i++) {
    final line = lines[i];
    String updated = line;

    for (final field in args.fields) {
      // Match patterns like:
      //   required int id,
      //   required int? count,
      //   final int id;
      //   int id =
      //   int id,
      // Handles optional leading whitespace, required keyword, const/final.
      //
      // The regex captures the exact fromType followed by word boundary then
      // the field name so we don't accidentally match substrings.
      final escapedFrom = RegExp.escape(args.from);
      final escapedField = RegExp.escape(field);

      // Pattern: <fromType><whitespace><fieldName><non-word or end>
      final pattern = RegExp(
        r'(\brequired\s+|\bfinal\s+|\bconst\s+)?'    // optional keyword
        '($escapedFrom)'                               // the FROM type
        r'(\s+)'                                       // whitespace
        '($escapedField)'                              // field name
        r'(?=\s*[,;=)\n]|$)',                          // followed by , ; = ) newline or EOL
      );

      final replaced = updated.replaceAllMapped(pattern, (m) {
        return '${m[1] ?? ''}${args.to}${m[3]}${m[4]}';
      });

      if (replaced != updated) {
        changes.add(_Change(i + 1, updated.trim(), replaced.trim()));
        updated = replaced;
      }
    }

    newLines.add(updated);
  }

  if (changes.isNotEmpty && !args.dryRun) {
    file.writeAsStringSync(newLines.join('\n'));
  }

  return _FileResult(changes.length, changes);
}

// ─── Output helpers ──────────────────────────────────────────────────────────

void _printFileResult(String path, _FileResult result, bool dryRun) {
  final tag = dryRun ? '${_yellow}[dry-run]$_reset' : '${_green}[updated]$_reset';
  print('\n$tag $_bold${_relativePath(path)}$_reset  '
      '(${result.replacements} replacement(s))');
  for (final c in result.changes) {
    print('  ${_dim}L${c.lineNumber}$_reset');
    print('    ${_red}- ${c.before}$_reset');
    print('    ${_green}+ ${c.after}$_reset');
  }
}

void _printBanner(_Args args) {
  print('\n$_bold$_cyan switch_types$_reset');
  print('  directory : ${args.directory}');
  print('  fields    : [${args.fields.join(', ')}]');
  print('  from      : ${_red}${args.from}$_reset');
  print('  to        : ${_green}${args.to}$_reset');
  print('  dry-run   : ${args.dryRun}');
  print('');
}

void _printUsage() {
  print('''
${_bold}Usage:$_reset
  dart tool/switch_types.dart <directory> --fields <f1,f2,...> --from <type> --to <type> [--dry-run]

${_bold}Arguments:$_reset
  <directory>   Path to the directory to scan (recursive, skips .freezed/.g/.gr.dart)
  --fields      Comma-separated list of field names to target
  --from        The current declared type of the field
  --to          The desired new type
  --dry-run     Preview changes without writing any files

${_bold}Examples:$_reset
  dart tool/switch_types.dart lib/ --fields id,count --from int --to int? --dry-run
  dart tool/switch_types.dart lib/ --fields status   --from String? --to String
  dart tool/switch_types.dart lib/features/screens/market_prices \\
      --fields construction_materials_count --from int --to int?
''');
}

String _relativePath(String path) {
  final cwd = Directory.current.path;
  if (path.startsWith(cwd)) return path.substring(cwd.length + 1).replaceAll(r'\', '/');
  return path;
}

void _err(String msg) => stderr.writeln('$_red[error]$_reset $msg');
void _warn(String msg) => stderr.writeln('$_yellow[warn]$_reset $msg');

// ─── Argument parser ─────────────────────────────────────────────────────────

class _Args {
  final String directory;
  final List<String> fields;
  final String from;
  final String to;
  final bool dryRun;

  _Args({
    required this.directory,
    required this.fields,
    required this.from,
    required this.to,
    required this.dryRun,
  });

  static _Args? parse(List<String> raw) {
    if (raw.isEmpty) return null;

    String? directory;
    List<String>? fields;
    String? from;
    String? to;
    bool dryRun = false;

    // First positional arg = directory
    if (!raw[0].startsWith('--')) {
      directory = raw[0];
      raw = raw.sublist(1);
    }

    for (var i = 0; i < raw.length; i++) {
      switch (raw[i]) {
        case '--fields':
          if (i + 1 >= raw.length) { _err('--fields requires a value'); return null; }
          fields = raw[++i].split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
        case '--from':
          if (i + 1 >= raw.length) { _err('--from requires a value'); return null; }
          from = raw[++i];
        case '--to':
          if (i + 1 >= raw.length) { _err('--to requires a value'); return null; }
          to = raw[++i];
        case '--dry-run':
        case '--dryrun':
          dryRun = true;
        default:
          if (directory == null && !raw[i].startsWith('--')) {
            directory = raw[i];
          } else {
            _err('Unknown argument: ${raw[i]}');
            return null;
          }
      }
    }

    if (directory == null) { _err('Missing required argument: <directory>'); return null; }
    if (fields == null || fields.isEmpty) { _err('Missing required argument: --fields'); return null; }
    if (from == null) { _err('Missing required argument: --from'); return null; }
    if (to == null) { _err('Missing required argument: --to'); return null; }

    return _Args(directory: directory, fields: fields, from: from, to: to, dryRun: dryRun);
  }
}
