import 'dart:io';

void main() {
  final csvLines = File('assets/l10n/translations.csv').readAsLinesSync();
  final Map<String, String> arToKey = {};
  for (var line in csvLines.skip(1)) {
    final parts = line.split(',');
    if (parts.length >= 3) {
      final key = parts[0];
      final ar = parts[2];
      if (ar.isNotEmpty) arToKey[ar] = key;
    }
  }

  final dir = Directory('lib/features/screens');
  final files = dir.listSync(recursive: true).whereType<File>().where((f) => f.path.endsWith('.dart'));

  for (var file in files) {
    String content = file.readAsStringSync();
    bool changed = false;

    for (var entry in arToKey.entries) {
      final ar = entry.key;
      final key = entry.value;

      final target1 = "'$ar'";
      final replacement1 = "'$key'.tr()";
      
      final target2 = '"$ar"';
      final replacement2 = "'$key'.tr()";

      if (content.contains(target1)) {
        content = content.replaceAll(target1, replacement1);
        changed = true;
      }
      if (content.contains(target2)) {
        content = content.replaceAll(target2, replacement2);
        changed = true;
      }
    }

    if (changed) {
      if (!content.contains("import 'package:easy_localization/easy_localization.dart';")) {
        content = "import 'package:easy_localization/easy_localization.dart';\n$content";
      }
      file.writeAsStringSync(content);
     }
  }
}
