import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:negarestan/core/classes/post.dart';
import 'package:negarestan/screens/post_details/usecases/post_details_usecase.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import 'data_sources/post_details_remote_ds.dart';
import 'interfaces/post_details_repository_interface.dart';

class PostDetailsRepository implements PostDetailsRepositoryInterface {
  final PostDetailsRemoteDataSource postDetailsRemoteDataSource;

  PostDetailsRepository({required this.postDetailsRemoteDataSource});

  @override
  Future<Either<Failure, Post>> postDetails(PostDetailsRequest request) {
    // TODO: implement postDetails
    throw UnimplementedError();
  }


}
