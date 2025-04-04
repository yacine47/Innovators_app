import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/models/user_model.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  Future<void> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    emit(SignUpLoading());

    // var result = await authRepo.login(email: email, password: password);

    UserModel? userModel;
    Hive.box<UserModel>(kPostsBox).add(UserModel(
      id: '1',
      name: fullName,
      email: email,
      password: password,
      profileImageUrl:
          'https://static.vecteezy.com/system/resources/previews/020/911/740/non_2x/user-profile-icon-profile-avatar-user-icon-male-icon-face-icon-profile-icon-free-png.png',
    ));

    users.where((e) => e.email == email).forEach((element) {
      if (element.password == password) {
        userModel = element;
      }
    });
    if (userModel == null) {
      emit(SignUpFailure('Somthing is wrong'));
    } else {
      Hive.box(kSettingsBox).put(
        'user',
        userModel,
      );
      emit(SignUpSuccess(userModel!));
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
