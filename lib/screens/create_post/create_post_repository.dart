import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:negarestan/core/classes/post.dart';
import 'package:negarestan/screens/create_post/usecases/create_post_usecase.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import 'data_sources/create_post_remote_ds.dart';
import 'interfaces/create_post_repository_interface.dart';

class CreatePostRepository implements CreatePostRepositoryInterface {
  final CreatePostRemoteDataSource createPostRemoteDataSource;

  CreatePostRepository({required this.createPostRemoteDataSource});

  @override
  Future<Either<Failure, Post>> createPost(CreatePostRequest request) {
    // TODO: implement createDetails
    throw UnimplementedError();
  }
}
