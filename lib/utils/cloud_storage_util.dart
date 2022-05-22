
import 'package:flutter_cms/utils/datetime_util.dart';

class CloudStorageUtil {
  /// 記事作成時の画像アップロードに使用. 末尾にuserIdとfileNameを結合する. article/images/.
  static const String articleRef = "article/images/";

  /// fileパスから拡張子を取得
  static validateFormat(String? filePath) {
    if(filePath != null) {
      final array = filePath.split(".");
      print(array.last);
      if(array.last == "jpg" || array.last == "png" || array.last == "jpeg") {
        return DatetimeUtil.dateTimeConvertToUnixTime(DateTime.now()).toString() + "." + array.last;
      }
    }
    return null;
  }
}