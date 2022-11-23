import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cms/features/multi_data/repository/cloud_firestore_repository.dart';
import 'package:flutter_cms/utils/cloud_firestore_util.dart';

class ArticleService {

  /// 特定のユーザーの記事一覧を取得する.
  Future<List<Map<String, Map<String, dynamic>>>> getOneUsersAllArticle(
      {String userId = "testUser",
        List<Map<String, dynamic>> queryMapList = const [],
        int limit = CloudFirestoreUtil.limit}) async {

    CollectionReference collection =
      FirebaseFirestore.instance.collection('game_title').doc(CloudFirestoreUtil.gameTitle).collection("article").doc(userId).collection("article");
    for (Map<String, dynamic> queryMap in queryMapList) {
      CloudFirestoreUtil.addQuery(collection: collection, queryMap: queryMap);
    }

    CloudFirestoreRepository repository = CloudFirestoreRepository();
    QuerySnapshot<Object?> data = await repository.getArticleList(collection: collection);

    return _formatDocuments(data);
  }

  /// QuerySnapshotを成型する.
  ///
  /// ドキュメントのIdをkey, ドキュメントの中身をvalueとしたMapを作成し、Listに格納する.
  List<Map<String, Map<String, dynamic>>> _formatDocuments(QuerySnapshot<Object?> data) {
    List<Map<String, Map<String, dynamic>>> formattedDocs = [];

    for (QueryDocumentSnapshot<Object?> doc in data.docs) {
      Map<String, Map<String, dynamic>> map = {};
      map[doc.id] = doc.data() as Map<String, dynamic>;
      formattedDocs.add(map);
    }

    return formattedDocs;
  }
}
