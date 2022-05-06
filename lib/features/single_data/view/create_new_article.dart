import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cms/utils/datetime_util.dart';
import 'package:intl/intl.dart';
import 'package:flutter_cms/common_widgets/create_button.dart';
import 'package:flutter_cms/features/single_data/common_widgets/text_insert_block.dart';
import 'package:flutter_cms/features/single_data/repository/cloud_firestore_repository.dart';

class CreateNewArticle extends StatelessWidget {
  CreateNewArticle({Key? key}) : super(key: key);
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("新規記事作成"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextInsertBlock(focusNode: focusNode),
              TextInsertBlock(focusNode: focusNode),
              TextInsertBlock(focusNode: focusNode),
              TextInsertBlock(focusNode: focusNode),
              CreateButton(
                text: const Text("新規作成"),
                onPressed: () async {
                  print("onpressed");
                  CloudFirestoreRepository rep = CloudFirestoreRepository();
                  //await rep.addArticleAboutGame(gameTitle: "GUNDAM EVOLUTION", userId: "user05");
                  CollectionReference collection = FirebaseFirestore.instance.collection('game_title').doc("GUNDAM EVOLUTION").collection("article").doc("user03").collection("article");
                  QuerySnapshot<Object?> data = await rep.getArticleList(collection: collection);
                  List<QueryDocumentSnapshot<Object?>> docs = data.docs;
                  for (QueryDocumentSnapshot<Object?> doc in docs) {
                    print(doc.data() as Map<String, dynamic>);
                  }
                  print("SUCCEED");
                  var data2 = await FirebaseFirestore.instance.collection('game_title').doc("GUNDAM EVOLUTION").collection("article").doc("user03").collection("article").doc("1651740483330").get();
                  Map<String, dynamic> data3 = data2.data() as Map<String, dynamic>;
                  print(data3);
                },
              ),
              CreateButton(
                text: const Text("時刻"),
                onPressed: () async {
                  print("onpressed");
                  print(DateTime.now());
                  print(DateFormat("yyyyMMddHHMMss").format(DateTime.now()).toString());
                  print(DatetimeUtil.dateTimeConvertToUnixTime(DateTime.now()));
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
