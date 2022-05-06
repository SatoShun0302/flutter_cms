
class DatetimeUtil {
  /// DateTime型の日付をunixTimeに変換して返す.
  ///
  /// @param dateTime.
  /// @return unixTime.
  static int dateTimeConvertToUnixTime(DateTime dateTime) {
    return dateTime.toUtc().millisecondsSinceEpoch;
  }
}