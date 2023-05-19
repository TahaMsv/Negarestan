import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import '../../core/platform/network_info.dart';
import 'data_sources/people_remote_ds.dart';
import 'interfaces/people_repository_interface.dart';

class PeopleRepository implements PeopleRepositoryInterface {
  final PeopleRemoteDataSource peopleRemoteDataSource;
  final NetworkInfo? networkInfo;
  PeopleRepository({required this.peopleRemoteDataSource, required this.networkInfo, });

}
