import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/models/user_model.dart';

import 'package:linkdin_app/features/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    // var result = await authRepo.login(email: email, password: password);

    UserModel? userModel;

    List<UserModel> users = Hive.box<UserModel>(kUsersBox).values.toList();
    users.where((e) => e.email == email).forEach((element) {
      if (element.password == password) {
        userModel = element;
      }
    });
    if (userModel == null) {
      emit(LoginFailure('Somthing is wrong'));
    } else {
      await Hive.box(kSettingsBox).put(
        'user',
        UserModel(
            id: userModel!.id,
            name: userModel!.name,
            email: userModel!.email,
            password: userModel!.password,
            profileImageUrl: userModel!.profileImageUrl),
      );
      emit(LoginSuccess(userModel!));
    }

    // result.fold(
    //   (failure) => emit(LoginFailure(failure.error)),
    //   (userId) async {
    //     final session = Supabase.instance.client.auth.currentSession;
    //     if (session != null) {
    //       await getIt<SecureStorageService>()
    //           .saveToken(session.refreshToken ?? '');
    //     }
    //     emit(LoginSuccess(userId));
    //   },
    // );
  }
}
