part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity userEntity;
  const SignInSuccess({required this.userEntity});
}

class SignInFailure extends SignInState {
  final String errorMessage;
  const SignInFailure({required this.errorMessage});
}
