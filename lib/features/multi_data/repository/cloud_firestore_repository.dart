import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cms/utils/cloud_firestore_util.dart';

class CloudFirestoreRepository {

  /// 複数記事を取得する.
  Future<QuerySnapshot<Object?>> getArticleList(
      {required CollectionReference collection,
        int limit = CloudFirestoreUtil.limit,
        String? orderBy}) async {
    CollectionReference _collection = collection;
    return _collection.get();
  }
}