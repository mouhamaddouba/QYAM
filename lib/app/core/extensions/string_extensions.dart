extension StringExtension on String {
  String trimLength(int maxLength) =>
      length > maxLength ? '${substring(0, maxLength)}...' : this;
}
