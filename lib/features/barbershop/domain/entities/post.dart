import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String description,
    required int createdAt,
    required String photoUrl,
  }) = _Post;
}
