import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/inputs/inputs.dart';
import 'package:formz/formz.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterFormState> {
  RegisterCubit() : super(const RegisterFormState());

  void onSubmit() {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        userName: UserName.dirty(state.userName.value),
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate(
          [
            state.userName,
            state.email,
            state.password,
          ],
        )));
    log(name: 'onSubmit state', state.toString());
  }

  void userNameChanged(String value) {
    final userName = UserName.dirty(value);
    final List<FormzInput> inputs = [userName, state.email, state.password];
    emit(state.copyWith(
      userName: userName,
      isValid: Formz.validate(inputs),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    final List<FormzInput> inputs = [email, state.userName, state.password];
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate(inputs),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final List<FormzInput> inputs = [password, state.userName, state.email];
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate(inputs),
    ));
  }
}
