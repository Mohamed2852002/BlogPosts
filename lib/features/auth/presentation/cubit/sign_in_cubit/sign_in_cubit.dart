import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/auth/domain/entities/user_entity.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  SignInCubit({required this.authRepo}) : super(SignInInitial());

  login({required String username, required String password}) async {
    emit(SignInLoading());
    final result = await authRepo.login(username: username, password: password);
    result.fold(
      (failure) => emit(SignInFailure(errorMessage: failure.errorMessage)),
      (user) => emit(SignInSuccess(userEntity: user)),
    );
  }
}
