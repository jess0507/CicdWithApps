extension IntExtension on int {
  String toDayOfWeekString() {
    switch (this) {
      case 1:
        return '每週一';
      case 2:
        return '每週二';
      case 3:
        return '每週三';
      case 4:
        return '每週四';
      case 5:
        return '每週五';
      case 6:
        return '每週六';
      case 7:
        return '每週日';
      default:
        return '';
    }
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
