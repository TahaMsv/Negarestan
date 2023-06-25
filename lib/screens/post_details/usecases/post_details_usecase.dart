import 'package:dartz/dartz.dart';
import '../../../core/classes/post.dart';
import '../../../core/classes/user.dart';
import '../../../core/error/failures.dart';

import '../../../core/interfaces/request.dart';
import '../../../core/interfaces/usecase.dart';
import '../post_details_repository.dart';

class PostDetailsUseCase extends UseCase<Post, PostDetailsRequest> {
  final PostDetailsRepository repository;

  PostDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, Post>> call({required PostDetailsRequest request}) {
    return repository.postDetails(request);
  }
}

class PostDetailsRequest extends Request {
  PostDetailsRequest({required this.postID});

  final String postID;

  @override
  Map<String, dynamic> toJson() => {};
}
