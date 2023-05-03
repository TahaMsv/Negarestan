import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import 'data_sources/projects_remote_ds.dart';
import 'interfaces/projects_repository_interface.dart';

class ProjectsRepository implements ProjectsRepositoryInterface {
  final ProjectsRemoteDataSource projectsRemoteDataSource;

  ProjectsRepository({required this.projectsRemoteDataSource});
}
