import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import 'data_sources/people_remote_ds.dart';
import 'interfaces/people_repository_interface.dart';

class PeopleRepository implements PeopleRepositoryInterface {
  final PeopleRemoteDataSource peopleRemoteDataSource;

  PeopleRepository({required this.peopleRemoteDataSource});
}
