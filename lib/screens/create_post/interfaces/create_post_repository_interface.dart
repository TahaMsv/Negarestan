import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/user_details/usecases/user_details_usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../core/classes/post.dart';
import '../../../core/classes/user.dart';
import '../usecases/create_post_usecase.dart';

abstract class CreatePostRepositoryInterface {
   Future<Either<Failure, Post>> createPost(CreatePostRequest request);
}
