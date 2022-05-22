
import 'dart:collection';
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cms/utils/article_util.dart';

part 'article_block.freezed.dart';

@JsonSerializable(explicitToJson: true)
@freezed
class ArticleBlock with _$ArticleBlock {
  const factory ArticleBlock({
    required articleBlockType type,
    String? text,
    String? url,
    File? sourcePath,
    String? fileName,
    LinkedHashMap? body
  }) = _ArticleBlock;

  //factory ArticleBlock.fromJson(Map<String, dynamic> json) => _$ArticleBlockFromJson(json);
}