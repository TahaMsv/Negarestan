import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/user_details/usecases/user_details_usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../core/classes/post.dart';
import '../../../core/classes/user.dart';
import '../usecases/post_details_usecase.dart';

abstract class PostDetailsRepositoryInterface {
   Future<Either<Failure, Post>> postDetails(PostDetailsRequest request);
}
