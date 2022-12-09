import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../constants/firebase_storage_paths.dart';
import '../../../../injection.dart';
import '../../domain/entities/post.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    @JsonKey(ignore: true) String? id,
    required String description,
    required int createdAt,
    @JsonKey(ignore: true) String? photoUrl,
  }) = _PostModel;

  const PostModel._();

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  factory PostModel.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) =>
      PostModel.fromJson(doc.data()!).copyWith(id: doc.id);

  Future<Post> toDomain() async {
    final photoUrl = await getIt<FirebaseStorage>()
        .ref(FirebaseStoragePaths.posts)
        .child('$id.jpg')
        .getDownloadURL();

    return Post(
      id: id!,
      description: description,
      createdAt: createdAt,
      photoUrl: photoUrl,
    );
  }
}
