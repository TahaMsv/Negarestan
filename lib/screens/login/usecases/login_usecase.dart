import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';

import '../../../core/interfaces/request.dart';
import '../../../core/interfaces/usecase.dart';
import '../login_repository.dart';

class LoginUseCase extends UseCase<String, LoginRequest> {
  final LoginRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call({required LoginRequest request}) {
    return repository.login(request);
  }
}

class LoginRequest extends Request {
  LoginRequest({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  Map<String, dynamic> toJson() => {
        "Body": {
          "Execution": "[OnlineCheckin].[Authenticate]",
          "Token": null,
          "Request": {
            "Code": password,
            "Code2": username,
            "UrlType": 1,
          },
        },
      };
}
