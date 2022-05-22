import 'dart:collection';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cms/common_widgets/create_button.dart';
import 'package:flutter_cms/features/single_data/model/article_block.dart';
import 'package:flutter_cms/utils/cloud_storage_util.dart';
import 'package:flutter_cms/utils/screen_env.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_cms/utils/article_util.dart';

/// 記事新規作成,更新時用ウィジェット[画像ブロック].
class ImageInsertBlock extends StatefulWidget {
  const ImageInsertBlock({Key? key, this.hintText = "テキストを入力", this.onSavedFunction, required this.i11, this.top, this.right, this.bottom, this.left, required this.bodyMap}) : super(key: key);
  final String hintText;
  final Function? onSavedFunction;
  final int i11;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final LinkedHashMap<int, ArticleBlock> bodyMap;

  @override
  _ImageInsertBlockState createState() => _ImageInsertBlockState();
}

class _ImageInsertBlockState extends State<ImageInsertBlock> {
  File? image;
  String? fileName;
  final picker = ImagePicker();

  // ローカルデバイスから画像を取得
  Future getImage() async {
    final XFile? _image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (_image != null) {
        fileName = CloudStorageUtil.validateFormat(_image.path);
        if (fileName != null) {
          image = File(_image.path);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: widget.top ?? ScreenEnv.deviceWidth * 0.05,
          right: widget.right ?? ScreenEnv.deviceWidth * 0.02,
          bottom: widget.bottom ?? 0.0,
          left: widget.left ?? ScreenEnv.deviceWidth * 0.02),
      child: ImageFormField(
        bodyMap: widget.bodyMap,
        i11: widget.i11,
        fileName: fileName,
        sourcePath: image,
        widget:
        image == null ?
        CreateButton(
          text: const Text("画像追加"),
          onPressed: () async {
            getImage();
          },
        ) : Image.file(image!, fit: BoxFit.cover),
      ),
    );
  }
}

class ImageFormField extends FormField {
  ImageFormField({Key? key, required Widget widget, Function? onSavedFunction, String? fileName, File? sourcePath, required LinkedHashMap<int, ArticleBlock> bodyMap, required int i11}) : super(key: key,
    builder: (_) {
      return widget;
    },
    onSaved: (value) async {
      if (sourcePath != null) {
        ArticleBlock articleBlock = ArticleBlock(type: articleBlockType.picture, sourcePath: sourcePath, fileName: fileName);
        bodyMap[i11] = articleBlock;
      }
      // if (image != null) {
      //   final storageRef = FirebaseStorage.instance.ref();
      //   Reference? imagesRef = storageRef.child("images/test3.jpg");
      //   await imagesRef.putFile(image);
      // }
    }
  );
}