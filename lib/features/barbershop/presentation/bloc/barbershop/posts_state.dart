import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../failures/failure.dart';
import '../../../domain/entities/post.dart';

part 'posts_state.freezed.dart';

@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial() = _Initial;
  const factory PostsState.loadInProgress() = _LoadInProgress;
  const factory PostsState.loadSuccess(List<Post> posts) = _LoadSuccess;
  const factory PostsState.loadFailure(Failure failure) = _LoadFailure;
}
