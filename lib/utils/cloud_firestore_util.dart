import 'package:cloud_firestore/cloud_firestore.dart';

/// Cloud Firestoreで使用するクエリの一覧
enum FirestoreQuery {
  isEqualTo,
  isNotEqualTo,
  whereIn,
  whereNotIn,
  isNull,
  isLessThan,
  isLessThanOrEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
  arrayContains,
  arrayContainsAny
}

/// Cloud Firestoreの処理で使用する定数、関数を定義したクラス
class CloudFirestoreUtil {

  /// ゲームタイトル. スネークケースを用いる.
  static const String gameTitle = "gundam_evolution";

  /// 一度に取得するデータの件数.
  static const int limit = 10;

  ///
  static addQuery(
      {required CollectionReference collection, required Map<String, dynamic> queryMap}) {
    switch (queryMap["queryType"]) {
      case FirestoreQuery.isEqualTo:
        isEqualTo(collection: collection, equalQueryMap: queryMap);
        break;
      case FirestoreQuery.isNotEqualTo:
        isNotEqualTo(collection: collection, notEqualQueryMap: queryMap);
        break;
      case FirestoreQuery.whereIn:
        whereIn(collection: collection, whereInQueryMap: queryMap);
        break;
      case FirestoreQuery.whereNotIn:
        break;
      case FirestoreQuery.isNull:
        break;
      case FirestoreQuery.isLessThan:
        break;
      case FirestoreQuery.isLessThanOrEqualTo:
        break;
      case FirestoreQuery.isGreaterThan:
        break;
      case FirestoreQuery.isGreaterThanOrEqualTo:
        break;
      case FirestoreQuery.arrayContains:
        break;
      case FirestoreQuery.arrayContainsAny:
        break;
    }
  }

  /// CollectionReferenceにwhere句(isEqualTo)を付与する.
  static isEqualTo({required CollectionReference collection, required Map<String, dynamic> equalQueryMap}) {
    return collection.where(equalQueryMap["fieldName"], isEqualTo: equalQueryMap["value"]);
  }

  /// [CloudFirestoreUtil.isEqualTo]で使用するマップを作成する.
  static Map<String, dynamic> isEqualToQueryMap({required String fieldName, required value}) {
    return {
      'queryType': FirestoreQuery.isEqualTo,
      'fieldName': fieldName,
      'value': value
    };
  }

  /// CollectionReferenceにwhere句(isNotEqualTo)を付与する.
  static isNotEqualTo({required CollectionReference collection, required Map<String, dynamic> notEqualQueryMap}) {
    collection.where(notEqualQueryMap["fieldName"], isNotEqualTo: notEqualQueryMap["value"]);
  }

  /// [CloudFirestoreUtil.isNotEqualTo]で使用するマップを作成する.
  static Map<String, dynamic> isNotEqualToQueryMap({required String fieldName, required value}) {
    return {
      'queryType': FirestoreQuery.isNotEqualTo,
      'fieldName': fieldName,
      'value': value
    };
  }

  /// CollectionReferenceにwhere句(whereIn)を付与する.
  static whereIn({required CollectionReference collection, required Map<String, dynamic> whereInQueryMap}) {
    return collection.where(whereInQueryMap["fieldName"], whereIn: whereInQueryMap["value"]);
  }

  /// [CloudFirestoreUtil.whereIn]で使用するマップを作成する.
  static Map<String, dynamic> whereInQueryMap({required String fieldName, required value}) {
    return {
      'queryType': FirestoreQuery.whereIn,
      'fieldName': fieldName,
      'value': value
    };
  }
}
