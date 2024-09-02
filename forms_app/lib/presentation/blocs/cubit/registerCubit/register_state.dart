part of 'register_cubit.dart';

enum FormStatus { valid, invalid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String userName;
  final String email;
  final String password;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.userName = '',
      this.email = '',
      this.password = ''});

  RegisterFormState copyWith(
          {FormStatus? formStatus,
          String? userName,
          String? email,
          String? password}) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          userName: userName ?? this.userName,
          email: email ?? this.email,
          password: password ?? this.password);

  @override
  List<Object?> get props => [formStatus, userName, email, password];
}
