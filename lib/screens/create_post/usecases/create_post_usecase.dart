import 'package:dartz/dartz.dart';
import '../../../core/classes/post.dart';
import '../../../core/classes/user.dart';
import '../../../core/error/failures.dart';

import '../../../core/interfaces/request.dart';
import '../../../core/interfaces/usecase.dart';
import '../create_post_repository.dart';

class CreatePostUseCase extends UseCase<Post, CreatePostRequest> {
  final CreatePostRepository repository;

  CreatePostUseCase({required this.repository});

  @override
  Future<Either<Failure, Post>> call({required CreatePostRequest request}) {
    return repository.createPost(request);
  }
}

class CreatePostRequest extends Request {
  CreatePostRequest({required this.postID});

  final String postID;

  @override
  Map<String, dynamic> toJson() => {};
}
