import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cms/features/single_data/common_widgets/image_insert_block.dart';
import 'package:flutter_cms/features/single_data/common_widgets/image_view_block.dart';
import 'package:flutter_cms/features/single_data/common_widgets/title_insert_block.dart';
import 'package:flutter_cms/features/single_data/model/article_block.dart';
import 'package:flutter_cms/features/single_data/service/article_service.dart';
import 'package:flutter_cms/utils/datetime_util.dart';
import 'package:flutter_cms/utils/screen_env.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:flutter_cms/common_widgets/create_button.dart';
import 'package:flutter_cms/features/single_data/common_widgets/text_insert_block.dart';
import 'package:flutter_cms/features/single_data/repository/cloud_firestore_repository.dart';

class CreateNewArticle extends StatelessWidget {
  CreateNewArticle({Key? key}) : super(key: key);
  final _form = GlobalKey<FormState>();
  final LinkedHashMap<int, ArticleBlock> bodyMap = LinkedHashMap();

  @override
  Widget build(BuildContext context) {
    final storageRef = FirebaseStorage.instance.ref();
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
          child: Form(
            key: _form,
            child: Column(
              children: [
                TitleInsertBlock(i11: 0, bodyMap: bodyMap),
                TextInsertBlock(i11: 1, bodyMap: bodyMap),
                TextInsertBlock(i11: 2, bodyMap: bodyMap),
                TextInsertBlock(i11: 3, bodyMap: bodyMap),
                ImageInsertBlock(i11: 4,bodyMap: bodyMap),
                Column(
                  children: [
                    CreateButton(
                      text: const Text("新規作成"),
                      onPressed: () async {
                        print("onpressed");
                        CloudFirestoreRepository rep = CloudFirestoreRepository();
                        //await rep.addArticleAboutGame(gameTitle: "GUNDAM EVOLUTION", userId: "user05");
                        CollectionReference collection = FirebaseFirestore.instance.collection('game_title').doc("GUNDAM EVOLUTION").collection("article").doc("user03").collection("article");
                        QuerySnapshot<Object?> data = await rep.getArticleList(collection: collection);
                        //List<QueryDocumentSnapshot<Object?>> docs = data.docs;
                        print(data.docs);
                        for (QueryDocumentSnapshot<Object?> doc in data.docs) {
                          print(doc.id);
                          print(doc.data() as Map<String, dynamic>);
                        }
                        print("SUCCEED");
                        // var data2 = await FirebaseFirestore.instance.collection('game_title').doc("GUNDAM EVOLUTION").collection("article").doc("user03").collection("article").doc("1651740483330").get();
                        // Map<String, dynamic> data3 = data2.data() as Map<String, dynamic>;
                        // print(data3);
                      },
                    ),
                    CreateButton(
                      text: const Text("追加"),
                      onPressed: () async {
                        print("onpressed");
                      },
                    ),
                    CreateButton(
                      text: const Text("画像表示"),
                      onPressed: () async {
                        final storageRef = FirebaseStorage.instance.ref();
                        final imageUrl =
                        await storageRef.child("images/test2.jpg").getDownloadURL();
                        print("画像のurlは$imageUrl");
                      },
                    ),
                    // FutureBuilder<String>(
                    //   future: FirebaseStorage.instance.ref().child("images/test2.jpg").getDownloadURL(),
                    //   builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    //     if (snapshot.hasError) {
                    //       return Text("Something went wrong");
                    //     }
                    //     if (snapshot.connectionState == ConnectionState.done) {
                    //       return ImageViewBlock(url: snapshot.data!);
                    //       return Image(
                    //         image: NetworkImage(snapshot.data!),
                    //       );
                    //     }
                    //     return Text("loading");
                    //   },
                    // ),
                    CreateButton(
                      onPressed: () {
                        _form.currentState?.save();
                        ArticleService service = ArticleService();
                        service.createArticle(bodyMap);
                        print("saved");
                      }, text: Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
