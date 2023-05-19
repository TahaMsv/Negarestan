import 'package:dartz/dartz.dart';
import '../../../core/classes/user.dart';
import '../../../core/error/failures.dart';
import 'package:intl/intl.dart';
import '../../../core/interfaces/request.dart';
import '../../../core/interfaces/usecase.dart';
import '../login_repository.dart';

class SignUpUseCase extends UseCase<User, SignUpRequest> {
  final LoginRepository repository;

  SignUpUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call({required SignUpRequest request}) {
    return repository.signUp(request);
  }
}

class SignUpRequest extends Request {
  SignUpRequest({
    required this.gender,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.bio,
    required this.skills,
    required this.institutions,
    required this.birthDay,
  });

  final String username;
  final String firstname;
  final String lastname;
  final String password;
  final String email;
  final String phoneNumber;
  final String country;
  final String city;
  final String bio;
  final List<String> skills;
  final List<String> institutions;
  final DateTime birthDay;
  final String gender;

  @override
  Map<String, dynamic> toJson() => {
        "username": username,
        "first_name": firstname,
        "last_name": lastname,
        "password": password,
        "email": email,
        "phone_number": phoneNumber,
        "country": country,
        "city": city,
        "bio": bio,
        "skills": skills,
        "institutions": institutions,
        "birthday": DateFormat('yyyy-MM-dd').format(birthDay),
        "gender": gender,
      };
}
