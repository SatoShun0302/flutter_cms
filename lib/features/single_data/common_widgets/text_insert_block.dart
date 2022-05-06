import 'package:flutter/material.dart';
import 'package:flutter_cms/common_widgets/wrapped_card.dart';
import 'package:flutter_cms/utils/screen_env.dart';

/// 記事新規作成,更新時用ウィジェット[テキストブロック].
class TextInsertBlock extends StatelessWidget {
  TextInsertBlock({Key? key, this.focusNode}) : super(key: key);
  FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return WrappedCard(
      widget: SizedBox(
        height: ScreenEnv.deviceWidth * 0.4,
        child: TextFormField(
          expands: true,
          maxLines: null,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: "テキストを入力",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.grey,
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
      ),
    );
  }
}
