import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cms/features/single_data/service/article_service.dart';
import 'package:flutter_cms/utils/cloud_firestore_util.dart';

class CloudFirestoreRepository {
  /// 祖先要素(ドキュメント),親要素(コレクション)を指定し、記事を作成する.
  ///
  /// [document] 新規追加するdocumentの祖先.
  /// [collection] 新規追加するdocumentの親.
  /// [documentId] 新規追加するドキュメントに付与するID.
  /// [data] 新規追加するドキュメントの構造体.
  /// [successHandler] 新規作成成功時のコールバック処理.
  /// [errorHandler] 新規作成失敗時のコールバック処理.
  /// [checkDoc] 祖先要素のdocumentの存在チェックを行うか否かのフラグ.
  ///
  /// [document]-[collection]-新規作成するドキュメント の関係になる。
  Future<void> createArticle(
      {required DocumentReference<Map<String, dynamic>> document,
      required CollectionReference collection,
      required String documentId,
      required Object data,
      Function? successHandler,
      Function? errorHandler,
      bool checkDoc = true}) async {
    final DocumentSnapshot _document = await document.get();
    final CollectionReference _collection = collection;
    if (checkDoc) {
      if (!_document.exists) {
        document.set({});
        _collection
            .doc(documentId)
            .set(data)
            .then((value) => successHandler)
            .catchError((error) => errorHandler);
        return;
      }
    }
    _collection
        .doc(documentId)
        .set(data)
        .then((value) => successHandler)
        .catchError((error) => errorHandler);
  }

  /// 複数記事を取得する.
  Future<QuerySnapshot<Object?>> getArticleList(
      {required CollectionReference collection,
      List<Map<String, dynamic>> queryList = const [],
      int limit = CloudFirestoreUtil.limit,
      String? orderBy}) async {
    CollectionReference _collection = collection;
    if (queryList.isNotEmpty) {
      for (Map<String, dynamic> queryMap in queryList) {
        _collection = CloudFirestoreUtil.addQuery(collection: _collection, queryMap: queryMap);
      }
    }
    return _collection.limit(limit).get();
  }

  /// 記事を更新する.
  ///
  /// [document] 更新するドキュメント.
  /// [data] 更新するフィールドと更新後の値を保持するマップ.
  /// [successHandler] 更新成功時のコールバック処理.
  /// [errorHandler] 更新失敗時のコールバック処理.
  Future<void> updateArticle(
      DocumentReference<Map<String, dynamic>> document,
      Map<String, Object?> data,
      Function? successHandler,
      Function? errorHandler) {
    return document
        .update(data)
        .then((value) => successHandler)
        .catchError((error) => errorHandler);
  }

  /// 記事を削除する.
  ///
  /// [document] 削除するドキュメント.
  /// [successHandler] 更新成功時のコールバック処理.
  /// [errorHandler] 更新失敗時のコールバック処理.
  Future<void> deleteArticle(DocumentReference<Map<String, dynamic>> document,
      Function? successHandler, Function? errorHandler) {
    return document
        .delete()
        .then((value) => successHandler)
        .catchError((error) => errorHandler);
  }
}
