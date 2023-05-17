import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';

import '../../../core/interfaces/request.dart';
import '../../../core/interfaces/usecase.dart';
import '../login_repository.dart';

class LogOutUseCase extends UseCase<String, LogOutRequest> {
  final LoginRepository repository;

  LogOutUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call({required LogOutRequest request}) {
    return repository.logOut(request);
  }
}

class LogOutRequest extends Request {
  LogOutRequest({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  Map<String, dynamic> toJson() => {
    "Body": {
      "username": username,
      "password": password,
    },
  };
}
