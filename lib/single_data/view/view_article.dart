import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_cms/firebase_options.dart';

class ViewArticle extends StatelessWidget {
  const ViewArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
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
          future: users.doc("NfvzjcJpgKPoc9McqlHa").get(),
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
              return Text("Full Name: ${data['full_name']} ${data['last_name']}");
            }

            return Text("loading");
          },
        ),
      ),
    );
    return Text("data");
  }
}
