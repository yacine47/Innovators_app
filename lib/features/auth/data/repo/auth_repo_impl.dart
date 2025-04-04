import 'package:dartz/dartz.dart';
import 'package:linkdin_app/core/errors/failures.dart';
import 'package:linkdin_app/features/auth/data/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseClient _client;

  AuthRepoImpl(this._client);

  @override
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        return right(response.user!.id);
      } else {
        return left(ServiceFailure('Login failed: No user returned'));
      }
    } on AuthException catch (e) {
      print(e.toString());

      return left(ServiceFailure(e.message));
    } catch (e) {
      print(e.toString());

      return left(ServiceFailure('An unexpected error occurred during login'));
    }
  }

  @override
  Future<Either<Failure, String>> signUp({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      return left(ServiceFailure("Passwords don't match"));
    }

    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        return right(response.user!.id);
      } else {
        return left(ServiceFailure('Signup failed: No user returned'));
      }
    } on AuthException catch (e) {
      return left(ServiceFailure(e.message));
    } catch (e) {
      return left(ServiceFailure('An unexpected error occurred during signup'));
    }
  }
}
