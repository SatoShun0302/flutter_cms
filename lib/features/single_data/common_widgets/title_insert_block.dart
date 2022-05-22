import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_cms/common_widgets/wrapped_card.dart';
import 'package:flutter_cms/features/single_data/model/article_block.dart';
import 'package:flutter_cms/utils/screen_env.dart';
import 'package:flutter_cms/utils/article_util.dart';

/// 記事新規作成,更新時用ウィジェット[テキストブロック].

class TitleInsertBlock extends StatelessWidget {
  const TitleInsertBlock({Key? key, this.hintText = "タイトルを入力", this.onSavedFunction, required this.i11, this.top, this.right, this.bottom, this.left, required this.bodyMap}) : super(key: key);
  final String hintText;
  final Function? onSavedFunction;
  final int i11;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final LinkedHashMap<int, ArticleBlock> bodyMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: top ?? ScreenEnv.deviceWidth * 0.05,
          right: right ?? ScreenEnv.deviceWidth * 0.02,
          bottom: bottom ?? ScreenEnv.deviceWidth * 0.05,
          left: left ?? ScreenEnv.deviceWidth * 0.02),
      child: TextFormField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        // onFieldSubmitted: (_) {
        //   FocusScope.of(context).requestFocus(_passwordFocusNode);
        // },
        onSaved: (value) {
          print(i11);
          print(value);
          ArticleBlock articleBlock = ArticleBlock(type: articleBlockType.title, text: value);
          bodyMap[i11] = articleBlock;
        },
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.black12,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
