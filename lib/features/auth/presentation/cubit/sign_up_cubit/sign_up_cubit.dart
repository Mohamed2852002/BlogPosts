import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/auth/domain/entities/user_entity.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());

  register({
    required String username,
    required String email,
    required String password,
    required String password2,
    required String firstName,
    required String lastName,
  }) async {
    emit(SignUpLoading());
    final result = await authRepo.register(
      username: username,
      email: email,
      password: password,
      password2: password2,
      firstName: firstName,
      lastName: lastName,
    );
    result.fold(
      (failure) => emit(SignUpFailure(errorMessage: failure.errorMessage)),
      (user) => emit(SignUpSuccess(userEntity: user)),
    );
  }
}
