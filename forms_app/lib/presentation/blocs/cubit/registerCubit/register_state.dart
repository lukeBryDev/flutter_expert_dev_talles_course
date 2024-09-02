part of 'register_cubit.dart';

enum FormStatus { valid, invalid, validating, posting }

class RegisterFormState extends Equatable {
  final bool isValid;
  final FormStatus formStatus;
  final UserName userName;
  final Email email;
  final Password password;

  const RegisterFormState(
      {this.isValid = false,
      this.formStatus = FormStatus.invalid,
      this.userName = const UserName.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  RegisterFormState copyWith(
          {bool? isValid,
          FormStatus? formStatus,
          UserName? userName,
          Email? email,
          Password? password}) =>
      RegisterFormState(
          isValid: isValid ?? this.isValid,
          formStatus: formStatus ?? this.formStatus,
          userName: userName ?? this.userName,
          email: email ?? this.email,
          password: password ?? this.password);

  @override
  List<Object?> get props => [formStatus, userName, email, password];
}
