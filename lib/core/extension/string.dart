extension StringExtension on String {
  String get lowerCaseFirst {
    if (isEmpty) return this;
    return this[0].toLowerCase() + substring(1);
  }
}