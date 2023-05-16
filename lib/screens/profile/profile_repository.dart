import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import 'data_sources/profile_remote_ds.dart';
import 'interfaces/profile_repository_interface.dart';

class ProfileRepository implements ProfileRepositoryInterface {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepository({required this.profileRemoteDataSource});
}
