import 'package:flutter/material.dart';
import 'package:flutter_cms/utils/datetime_util.dart';

/// 記事新規作成,更新時
class ArticleService {

  String title = "";
  List<String> tags = [];

  /// 本文エリアにブロックを挿入する.
  List<Widget> addArticleBlock() {
    return [];
  }

  /// ドキュメントIDを生成.
  ///
  /// 現在時刻をunixTimeで返す.
  String getDocumentId() {
    return DatetimeUtil.dateTimeConvertToUnixTime(DateTime.now()).toString();
  }

  /// Authorを生成.
  ///
  /// users/userId
  /// ToDo 引数の初期値を消す
  String getAuthor({String userId = "testUser"}) {
    return "users/$userId";
  }

  /// 本文エリアのウィジェットからMapを生成する.
  ///
  /// Cloud Firestoreに追加するドキュメントのbodyに対応するMap.
  /// ToDo childの生成を修正
  Map<String, Map<String, dynamic>> getArticleBodyMap() {
    Map<String, Map<String, dynamic>> map = {};
    Map<String, dynamic> child = {};
    child["type"] = "text";
    child["text"] = "テスト挿入用の本文です。from Service";
    child["color"] = "#000000";
    map["1"] = child;
    Map<String, dynamic> child2 = {};
    child2["type"] = "header";
    child2["text"] = "テストタイトル from Service";
    child2["color"] = "#000000";
    map["2"] = child2;
    return map;
  }

  /// ウィジェット全体からObjectを生成する.
  ///
  /// Cloud Firestoreに追加するドキュメント全体に対応するObject.
  Object getObjectToSetDoc() {
    Object data = {};
    data = {
      'author': getAuthor(),
      'title': title,
      'body': getArticleBodyMap(),
      'tag':tags
    };

    return data;
  }
}