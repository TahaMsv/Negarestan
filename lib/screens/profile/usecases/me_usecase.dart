import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/profile/profile_repository.dart';
import '../../../core/classes/user.dart';
import '../../../core/error/failures.dart';

import '../../../core/interfaces/request.dart';
import '../../../core/interfaces/usecase.dart';

class MeUseCase extends UseCase<User, MeRequest> {
  final ProfileRepository repository;

  MeUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call({required MeRequest request}) {
    return repository.me(request);
  }
}

class MeRequest extends Request {
  MeRequest();

  @override
  Map<String, dynamic> toJson() => {};
}
