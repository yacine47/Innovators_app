part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserModel userModel;

  SignUpSuccess(this.userModel);
}

class SignUpFailure extends SignUpState {
  final String errMessage;

  SignUpFailure(this.errMessage);
}
