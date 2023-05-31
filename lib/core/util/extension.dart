extension StringExtension on String {
  String capitalize() {
    if (this == null) {
      return "";
    } else {
      return isEmpty ? "" : "${this[0].toUpperCase()}${substring(1)}";
    }
  }

  String toUpperCamelCase() {
    return replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.capitalize()).join(" ");
  }

  String clearEmoticon() {
    return replaceAll(
        RegExp(
            '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        '');
  }
}
