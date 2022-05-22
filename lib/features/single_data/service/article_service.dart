import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cms/features/single_data/model/article_block.dart';
import 'package:flutter_cms/features/single_data/repository/cloud_firestore_repository.dart';
import 'package:flutter_cms/features/single_data/repository/cloud_storage_repository.dart';
import 'package:flutter_cms/utils/cloud_firestore_util.dart';
import 'package:flutter_cms/utils/cloud_storage_util.dart';
import 'package:flutter_cms/utils/datetime_util.dart';
import 'package:flutter_cms/utils/article_util.dart';

/// 記事新規作成,更新時
class ArticleService {

  String title = "";
  List<String> tags = [];

  /// 本文エリアにブロックを挿入する.
  List<Widget> addArticleBlock() {
    return [];
  }

  /// 記事をアップロードする
  void createArticle(LinkedHashMap<int, ArticleBlock> bodyMap) {
    CloudFirestoreRepository cloudFirestoreRepository = CloudFirestoreRepository();
    DocumentReference<Map<String, dynamic>> document = FirebaseFirestore.instance.collection('game_title').doc(CloudFirestoreUtil.gameTitle).collection("article").doc("user0002");
    CollectionReference collection = FirebaseFirestore.instance.collection('game_title').doc(CloudFirestoreUtil.gameTitle).collection("article").doc("user0002").collection("article");
    Map<String, Object?> data = _getObjectToSetDoc(bodyMap);
    cloudFirestoreRepository.createArticle(document: document, collection: collection, documentId: _getDocumentId(), data: data);
  }

  /// ドキュメントIDを生成.
  ///
  /// 現在時刻をunixTimeで返す.
  String _getDocumentId() {
    return DatetimeUtil.dateTimeConvertToUnixTime(DateTime.now()).toString();
  }

  /// Authorを生成.
  ///
  /// users/userId
  /// ToDo 引数の初期値を消す
  String _getAuthor({String userId = "testUser"}) {
    return "users/$userId";
  }

  /// 本文エリアのウィジェットからMapを生成する.
  ///
  /// Cloud Firestoreに追加するドキュメントのbodyに対応するMap.
  /// ToDo childの生成を修正
  Map<String, Map<String, dynamic>> _getArticleBodyMap({String userId = "testUser", required LinkedHashMap<int, ArticleBlock> bodyMap}) {
    // Firestoreへ格納するドキュメントのbody部分(マップ)のkeyはString型でないとエラーになる
    Map<String, Map<String, dynamic>> map = {};

    for (int key in bodyMap.keys) {
      ArticleBlock articleBlock = bodyMap[key]!;

      switch(articleBlock.type) {
        case articleBlockType.header:
          map[key.toString()] = _getHeaderBodyMap(articleBlock);
          break;
        case articleBlockType.text:
          map[key.toString()] = _getTextBodyMap(articleBlock);
          break;
        case articleBlockType.picture:
          // 画像を含む場合、Cloud Storageへのアップロードを先に行う
          CloudStorageRepository cloudStorageRepository = CloudStorageRepository();
          String filePath = CloudStorageUtil.articleRef + userId + "/" +  articleBlock.fileName!;
          cloudStorageRepository.uploadArticlePicture(filePath: filePath, sourcePath: articleBlock.sourcePath!);
          map[key.toString()] = _getPictureBodyMap(articleBlock, filePath);
          break;
        case articleBlockType.list:
          break;
        case articleBlockType.numberList:
          break;
        case articleBlockType.point:
          break;
        case articleBlockType.youtubeVideo:
          break;
      }
    }
    return map;
  }

  /// ウィジェット全体からObjectを生成する.
  ///
  /// Cloud Firestoreに追加するドキュメント全体に対応するObject.
  Map<String, Object?> _getObjectToSetDoc(LinkedHashMap<int, ArticleBlock> bodyMap) {
    Map<String, Object?> data = {};
    data = {
      'author': _getAuthor(),
      'title': bodyMap[0]!.text,
      'body': _getArticleBodyMap(bodyMap: bodyMap),
      'tag':tags
    };
    return data;
  }

  /// Cloud Firestoreに追加するドキュメントのbodyに対応するMapのフィールドとして格納するMap. ヘッダー.
  Map<String, dynamic> _getHeaderBodyMap(ArticleBlock articleBlock) {
    Map<String, dynamic> child = {};
    child["type"] = articleBlock.type.name;
    child["text"] = articleBlock.text;
    child["color"] = "#000000";
    return child;
  }

  /// Cloud Firestoreに追加するドキュメントのbodyに対応するMapのフィールドとして格納するMap. テキスト.
  Map<String, dynamic> _getTextBodyMap(ArticleBlock articleBlock) {
    Map<String, dynamic> child = {};
    child["type"] = articleBlock.type.name;
    child["text"] = articleBlock.text;
    child["color"] = "#000000";
    return child;
  }

  /// Cloud Firestoreに追加するドキュメントのbodyに対応するMapのフィールドとして格納するMap. 画像.
  Map<String, dynamic> _getPictureBodyMap(ArticleBlock articleBlock, String url) {
    Map<String, dynamic> child = {};
    child["type"] = articleBlock.type.name;
    child["url"] = url;
    return child;
  }
}