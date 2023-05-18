import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';

import '../../../core/interfaces/request.dart';
import '../../../core/interfaces/usecase.dart';
import '../people_repository.dart';

class FollowUseCase extends UseCase<bool, FollowRequest> {
  final PeopleRepository repository;

  FollowUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call({required FollowRequest request}) {
    return repository.follow(request);
  }
}

class FollowRequest extends Request {
  FollowRequest({
    required this.userId,
  });

  final String userId;

  @override
  Map<String, dynamic> toJson() => {
        "Body": {
          "user_id": userId,
        },
      };
}
