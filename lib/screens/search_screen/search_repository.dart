import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import 'data_sources/search_remote_ds.dart';
import 'interfaces/search_repository_interface.dart';

class SearchRepository implements SearchRepositoryInterface {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepository({required this.searchRemoteDataSource});
}
