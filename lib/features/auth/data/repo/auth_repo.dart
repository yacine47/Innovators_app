import 'package:dartz/dartz.dart';
import 'package:linkdin_app/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signUp({
    required String email,
    required String password,
    required String confirmPassword,
  });
}
