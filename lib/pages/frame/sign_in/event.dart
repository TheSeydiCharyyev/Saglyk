part of 'bloc.dart';

abstract class SignInEvent {
  const SignInEvent();
}

class EmailChanged extends SignInEvent {
  final String email;
  const EmailChanged(this.email);
}
class PasswordChanged extends SignInEvent {
  final String password;
  const PasswordChanged(this.password);
}