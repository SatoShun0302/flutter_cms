// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'article_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleBlock {
  articleBlockType get type => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  File? get sourcePath => throw _privateConstructorUsedError;
  String? get fileName => throw _privateConstructorUsedError;
  LinkedHashMap<dynamic, dynamic>? get body =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleBlockCopyWith<ArticleBlock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleBlockCopyWith<$Res> {
  factory $ArticleBlockCopyWith(
          ArticleBlock value, $Res Function(ArticleBlock) then) =
      _$ArticleBlockCopyWithImpl<$Res>;
  $Res call(
      {articleBlockType type,
      String? text,
      String? url,
      File? sourcePath,
      String? fileName,
      LinkedHashMap<dynamic, dynamic>? body});
}

/// @nodoc
class _$ArticleBlockCopyWithImpl<$Res> implements $ArticleBlockCopyWith<$Res> {
  _$ArticleBlockCopyWithImpl(this._value, this._then);

  final ArticleBlock _value;
  // ignore: unused_field
  final $Res Function(ArticleBlock) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? text = freezed,
    Object? url = freezed,
    Object? sourcePath = freezed,
    Object? fileName = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as articleBlockType,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePath: sourcePath == freezed
          ? _value.sourcePath
          : sourcePath // ignore: cast_nullable_to_non_nullable
              as File?,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as LinkedHashMap<dynamic, dynamic>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ArticleBlockCopyWith<$Res>
    implements $ArticleBlockCopyWith<$Res> {
  factory _$$_ArticleBlockCopyWith(
          _$_ArticleBlock value, $Res Function(_$_ArticleBlock) then) =
      __$$_ArticleBlockCopyWithImpl<$Res>;
  @override
  $Res call(
      {articleBlockType type,
      String? text,
      String? url,
      File? sourcePath,
      String? fileName,
      LinkedHashMap<dynamic, dynamic>? body});
}

/// @nodoc
class __$$_ArticleBlockCopyWithImpl<$Res>
    extends _$ArticleBlockCopyWithImpl<$Res>
    implements _$$_ArticleBlockCopyWith<$Res> {
  __$$_ArticleBlockCopyWithImpl(
      _$_ArticleBlock _value, $Res Function(_$_ArticleBlock) _then)
      : super(_value, (v) => _then(v as _$_ArticleBlock));

  @override
  _$_ArticleBlock get _value => super._value as _$_ArticleBlock;

  @override
  $Res call({
    Object? type = freezed,
    Object? text = freezed,
    Object? url = freezed,
    Object? sourcePath = freezed,
    Object? fileName = freezed,
    Object? body = freezed,
  }) {
    return _then(_$_ArticleBlock(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as articleBlockType,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcePath: sourcePath == freezed
          ? _value.sourcePath
          : sourcePath // ignore: cast_nullable_to_non_nullable
              as File?,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as LinkedHashMap<dynamic, dynamic>?,
    ));
  }
}

/// @nodoc

class _$_ArticleBlock with DiagnosticableTreeMixin implements _ArticleBlock {
  const _$_ArticleBlock(
      {required this.type,
      this.text,
      this.url,
      this.sourcePath,
      this.fileName,
      this.body});

  @override
  final articleBlockType type;
  @override
  final String? text;
  @override
  final String? url;
  @override
  final File? sourcePath;
  @override
  final String? fileName;
  @override
  final LinkedHashMap<dynamic, dynamic>? body;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArticleBlock(type: $type, text: $text, url: $url, sourcePath: $sourcePath, fileName: $fileName, body: $body)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArticleBlock'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('sourcePath', sourcePath))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('body', body));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleBlock &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other.sourcePath, sourcePath) &&
            const DeepCollectionEquality().equals(other.fileName, fileName) &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(sourcePath),
      const DeepCollectionEquality().hash(fileName),
      const DeepCollectionEquality().hash(body));

  @JsonKey(ignore: true)
  @override
  _$$_ArticleBlockCopyWith<_$_ArticleBlock> get copyWith =>
      __$$_ArticleBlockCopyWithImpl<_$_ArticleBlock>(this, _$identity);
}

abstract class _ArticleBlock implements ArticleBlock {
  const factory _ArticleBlock(
      {required final articleBlockType type,
      final String? text,
      final String? url,
      final File? sourcePath,
      final String? fileName,
      final LinkedHashMap<dynamic, dynamic>? body}) = _$_ArticleBlock;

  @override
  articleBlockType get type => throw _privateConstructorUsedError;
  @override
  String? get text => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  File? get sourcePath => throw _privateConstructorUsedError;
  @override
  String? get fileName => throw _privateConstructorUsedError;
  @override
  LinkedHashMap<dynamic, dynamic>? get body =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleBlockCopyWith<_$_ArticleBlock> get copyWith =>
      throw _privateConstructorUsedError;
}
