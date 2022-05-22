import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_cms/features/single_data/common_widgets/image_view_block.dart';
import 'package:flutter_cms/features/single_data/common_widgets/title_view_block.dart';
import 'package:flutter_cms/features/single_data/repository/cloud_firestore_repository.dart';
import 'package:flutter_cms/features/single_data/repository/cloud_storage_repository.dart';
import 'package:flutter_cms/firebase_options.dart';

class ViewArticle extends StatelessWidget {
  const ViewArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CloudFirestoreRepository rep = CloudFirestoreRepository();
    CloudStorageRepository cloudStorageRepository = CloudStorageRepository();
    CollectionReference articles = FirebaseFirestore.instance.collection('game_title').doc("gundam_evolution").collection("article").doc("user0002").collection("article");
    // return FutureBuilder(
    //   // Initialize FlutterFire
    //   future: Firebase.initializeApp(
    //     name: "flutter-cms-demo",
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   ),
    //   builder: (context, snapshot) {
    //     // Check for errors
    //     if (snapshot.hasError) {
    //       return Text("error");
    //     }
    //
    //     // Once complete, show your application
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       return Text("done");
    //     }
    //
    //     // Otherwise, show something whilst waiting for initialization to complete
    //     return Text("waiting");
    //   },
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: Center(
        child: FutureBuilder<QuerySnapshot<Object?>>(
          future: rep.getArticleList(collection: articles),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (!snapshot.hasData) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              List<Widget> list = [];
              // for (QueryDocumentSnapshot<Object?> doc in snapshot.data!.docs) {
              //   var map = doc.data() as Map<String, dynamic>;
              // }
              var doc = snapshot.data!.docs[3];
              var title = doc["title"];
              list.add(TitleViewBlock(text: title));
              LinkedHashMap<String, dynamic> body = doc["body"];
              for (var key in body.keys) {
                var map = body[key];
                if (map["type"] == "text") {
                  list.add(Text(map["text"]));
                } else if (map["type"] == "picture") {
                  list.add(
                      ImageViewBlock(rep: cloudStorageRepository, url: map["url"])
                  );
                }
              }
              return Column(children: list);
            }
            return Text("loading");
          },
        ),
      ),
    );
    return Text("data");
  }
}
