
/// 画面に関する設定値
class ScreenEnv {
  // Main起動後にデバイスから算出した数値に更新する
  static double deviceWidth = 0;
  static double deviceHeight = 0;

  // デバイスサイズからmargin, padding等を算出する際に使用する乗数(deviceWidth * 乗数)
  static double multiplierTop = 0.05;
  static double multiplierBottom = 0.0;
  static double multiplierRight = 0.02;
  static double multiplierLeft = 0.02;
}