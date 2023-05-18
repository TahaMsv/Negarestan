import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';

import '../../../core/interfaces/request.dart';
import '../../../core/interfaces/usecase.dart';
import '../login_repository.dart';

class LogOutUseCase extends UseCase<bool, LogOutRequest> {
  final LoginRepository repository;

  LogOutUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call({required LogOutRequest request}) {
    return repository.logOut(request);
  }
}

class LogOutRequest extends Request {
  LogOutRequest();

  @override
  Map<String, dynamic> toJson() => {};
}
