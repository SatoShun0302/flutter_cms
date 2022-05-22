import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_cms/features/single_data/repository/cloud_firestore_repository.dart';
import 'package:flutter_cms/firebase_options.dart';

class ViewArticle extends StatelessWidget {
  const ViewArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('game_title').doc("GUNDAM EVOLUTION").collection("article").doc("user01").collection("article");
    print(users);
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
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc("1651735672143").get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              print(data['body']["1"]["text"] = "テストタイトル（更新2）");
              print(data['body']);
              print(data['tag']);
              Map<String, Object?> object = {};
              object = {
                'author': data['author'],
                'title': data['title'],
                'body': data['body'],
                'tag':data['tag']
              };
              CloudFirestoreRepository rep = CloudFirestoreRepository();
              rep.updateArticle(users.doc("1651735672143"), object, null, null);
              return Text("Title: ${data['title']} ${data['author']}");
            }

            return Text("loading");
          },
        ),
      ),
    );
    return Text("data");
  }
}
