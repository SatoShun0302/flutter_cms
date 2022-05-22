import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_cms/utils/cloud_storage_util.dart';

class CloudStorageRepository {

  uploadArticlePicture({required String filePath, required File sourcePath}) {
    final storageRef = FirebaseStorage.instance.ref();
    Reference? imagesRef = storageRef.child(filePath);
    imagesRef.putFile(sourcePath);
  }
}