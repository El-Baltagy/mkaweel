/// switch_types.dart
///
/// Switches the declared type of specific fields in Dart source files,
/// deletes stale generated files (.freezed.dart / .g.dart / .gr.dart),
/// then runs build_runner with --build-filter for only the affected files.
///
/// Usage:
///   dart lib/core/tools/model_creation/switch_types.dart <directory>
///       --fields <f1,f2,...> --from <type> --to <type> [--dry-run] [--build]
///
/// Examples:
///   # Preview only — nothing is written
///   dart lib/core/tools/model_creation/switch_types.dart \
///       lib/features/screens/market_prices/data/model/catogeries_res \
///       --fields construction_materials_count --from int --to "int?" --dry-run
///
///   # Apply changes + delete generated files + run build_runner automatically
///   dart lib/core/tools/model_creation/switch_types.dart \
///       lib/features/screens/market_prices/data/model/catogeries_res \
///       --fields construction_materials_count --from int --to "int?" --build

import 'dart:convert';
import 'dart:io';

// ─── ANSI colours ──────────────────────────────────────────────────────────
const _reset  = '\x1B[0m';
const _bold   = '\x1B[1m';
const _green  = '\x1B[32m';
const _yellow = '\x1B[33m';
const _cyan   = '\x1B[36m';
const _red    = '\x1B[31m';
const _dim    = '\x1B[2m';

void main(List<String> rawArgs) async {
  // ── Parse arguments ───────────────────────────────────────────────────────
  final args = _Args.parse(rawArgs);
  if (args == null) { _printUsage(); exit(1); }

  final dir = Directory(args.directory);
  if (!dir.existsSync()) {
    _err('Directory not found: ${args.directory}');
    exit(1);
  }

  _printBanner(args);

  // ── Collect .dart source files (always skip generated files) ─────────────
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

  // ── Apply type replacements ───────────────────────────────────────────────
  int totalFiles        = 0;
  int totalReplacements = 0;
  final modifiedFiles   = <File>[];

  for (final file in files) {
    final result = _processFile(file, args);
    if (result.replacements > 0) {
      totalFiles++;
      totalReplacements += result.replacements;
      _printFileResult(file.path, result, args.dryRun);
      if (!args.dryRun) modifiedFiles.add(file);
    }
  }

  // ── Summary ───────────────────────────────────────────────────────────────
  print('\n$_bold──────────────────────────────────────────$_reset');

  if (totalReplacements == 0) {
    _warn('No matches found for fields [${args.fields.join(', ')}] '
        'with type "${args.from}" in ${files.length} file(s).');
    exit(0);
  }

  final action = args.dryRun
      ? '${_yellow}Would change$_reset'
      : '${_green}Changed$_reset';
  print('$action $_bold$totalReplacements$_reset replacement(s) '
      'across $_bold$totalFiles$_reset file(s).');

  if (args.dryRun) {
    print('${_yellow}Dry-run — no files were written.$_reset');
    print('Remove --dry-run to apply, or add --build to apply + regenerate.');
    print('$_bold──────────────────────────────────────────$_reset\n');
    exit(0);
  }

  // ── Delete stale generated files for each modified source ─────────────────
  print('');
  final buildFilters = <String>[];

  for (final src in modifiedFiles) {
    // Strip .dart suffix to get the base path
    final base = src.path.replaceAll(r'\', '/').replaceFirst(RegExp(r'\.dart$'), '');

    for (final ext in ['.freezed.dart', '.g.dart', '.gr.dart']) {
      final generated = File('$base$ext');
      if (generated.existsSync()) {
        generated.deleteSync();
        print('  ${_red}deleted$_reset  ${_relativePath(generated.path)}');
      }
      // Always add as build-filter so build_runner regenerates it
      buildFilters.add('--build-filter=$base$ext');
    }
  }

  // ── Run build_runner ─────────────────────────────────────────────────────
  if (args.runBuild) {
    print('');
    print('${_cyan}${_bold}Running build_runner...$_reset');
    print('$_bold──────────────────────────────────────────$_reset\n');
    await _runBuildRunner(buildFilters);
  } else {
    print('');
    print('${_dim}Run build_runner to regenerate the deleted files:$_reset');
    print('  ${_cyan}dart run build_runner build --force-jit$_reset');
    print('');
    print('${_dim}Or re-run this script with --build to do it automatically.$_reset');
    print('$_bold──────────────────────────────────────────$_reset\n');
  }
}

// ─── build_runner ────────────────────────────────────────────────────────────

Future<void> _runBuildRunner(List<String> buildFilters) async {
  final process = await Process.start(
    'flutter',
    [
      'pub', 'run', 'build_runner', 'build',
      '--delete-conflicting-outputs',
      ...buildFilters,
    ],
    runInShell: true,
  );

  process.stdout.transform(const SystemEncoding().decoder).listen(stdout.write);
  process.stderr.transform(const SystemEncoding().decoder).listen(stderr.write);

  final exitCode = await process.exitCode;
  if (exitCode == 0) {
    print('\n${_green}$_bold✓ build_runner finished successfully.$_reset');
    print('${_dim}.freezed.dart and .g.dart files have been regenerated.$_reset\n');
  } else {
    _err('build_runner exited with code $exitCode.');
    exit(exitCode);
  }
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
  final lines    = original.split('\n');
  final changes  = <_Change>[];
  final newLines = <String>[];

  for (var i = 0; i < lines.length; i++) {
    final line = lines[i];
    String updated = line;

    for (final field in args.fields) {
      final escapedFrom  = RegExp.escape(args.from);
      final escapedField = RegExp.escape(field);

      // Matches: [required|final|const] <fromType> <fieldName>  followed by , ; = ) or EOL
      final pattern = RegExp(
        r'(\brequired\s+|\bfinal\s+|\bconst\s+)?'
        '($escapedFrom)'
        r'(\s+)'
        '($escapedField)'
        r'(?=\s*[,;=)\n]|$)',
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
  print('\n$tag $_bold${_relativePath(path)}$_reset  (${result.replacements} replacement(s))');
  for (final c in result.changes) {
    print('  ${_dim}L${c.lineNumber}$_reset');
    print('    ${_red}- ${c.before}$_reset');
    print('    ${_green}+ ${c.after}$_reset');
  }
}

void _printBanner(_Args args) {
  print('\n$_bold${_cyan}switch_types$_reset');
  print('  directory : ${args.directory}');
  print('  fields    : [${args.fields.join(', ')}]');
  print('  from      : ${_red}${args.from}$_reset');
  print('  to        : ${_green}${args.to}$_reset');
  print('  dry-run   : ${args.dryRun}');
  print('  --build   : ${args.runBuild}');
  print('');
}

void _printUsage() {
  print('''
${_bold}Usage:$_reset
  dart lib/core/tools/model_creation/switch_types.dart <directory>
      --fields <f1,f2,...> --from <type> --to <type> [--dry-run] [--build]

${_bold}Arguments:$_reset
  <directory>   Directory to scan (recursive; .freezed/.g/.gr.dart are always skipped)
  --fields      Comma-separated field names to change
  --from        Current declared type  (e.g. int)
  --to          New declared type      (e.g. int?)
  --dry-run     Preview changes only — nothing is written, build_runner NOT run
  --build       After applying changes:
                  1. Delete .freezed.dart / .g.dart / .gr.dart for each changed file
                  2. Run: flutter pub run build_runner build
                          --delete-conflicting-outputs
                          --build-filter=<each changed file>

${_bold}Examples:$_reset
  # Preview only
  dart lib/core/tools/model_creation/switch_types.dart \\
      lib/features/screens/market_prices/data/model/catogeries_res \\
      --fields construction_materials_count --from int --to "int?" --dry-run

  # Apply + delete generated + regenerate in one command
  dart lib/core/tools/model_creation/switch_types.dart \\
      lib/features/screens/market_prices/data/model/catogeries_res \\
      --fields construction_materials_count --from int --to "int?" --build
''');
}

String _relativePath(String path) {
  final normalized = path.replaceAll(r'\', '/');
  final cwd = Directory.current.path.replaceAll(r'\', '/');
  if (normalized.startsWith(cwd)) {
    return normalized.substring(cwd.length + 1);
  }
  return normalized;
}

void _err(String msg)  => stderr.writeln('$_red[error]$_reset $msg');
void _warn(String msg) => stderr.writeln('$_yellow[warn]$_reset $msg');

// ─── Argument parser ─────────────────────────────────────────────────────────

class _Args {
  final String       directory;
  final List<String> fields;
  final String       from;
  final String       to;
  final bool         dryRun;
  final bool         runBuild;

  _Args({
    required this.directory,
    required this.fields,
    required this.from,
    required this.to,
    required this.dryRun,
    required this.runBuild,
  });

  static _Args? parse(List<String> raw) {
    if (raw.isEmpty) return null;

    String?       directory;
    List<String>? fields;
    String?       from;
    String?       to;
    bool          dryRun   = false;
    bool          runBuild = false;

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
        case '--build':
          runBuild = true;
        default:
          if (directory == null && !raw[i].startsWith('--')) {
            directory = raw[i];
          } else {
            _err('Unknown argument: ${raw[i]}');
            return null;
          }
      }
    }

    if (directory == null)                { _err('Missing: <directory>'); return null; }
    if (fields == null || fields.isEmpty) { _err('Missing: --fields');    return null; }
    if (from == null)                     { _err('Missing: --from');       return null; }
    if (to == null)                       { _err('Missing: --to');         return null; }

    if (dryRun && runBuild) {
      _err('--dry-run and --build cannot be used together.');
      return null;
    }

    return _Args(
      directory: directory,
      fields:    fields,
      from:      from,
      to:        to,
      dryRun:    dryRun,
      runBuild:  runBuild,
    );
  }
}
//dart run lib/core/tools/model_creation/switch_types.dart lib/features/screens/market_prices/data/model/sub_catogeries_data --fields image_path --from dynamic --to "String?" --build