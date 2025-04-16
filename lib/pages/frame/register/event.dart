part of 'bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameChanged extends RegisterEvent {
  const UserNameChanged(this.username);
  final String username;
}

class EmailChanged extends RegisterEvent {
  const EmailChanged(this.email);
  final String email;
}

class PasswordChanged extends RegisterEvent {
  const PasswordChanged(this.password);
  final String password;
}

class RePasswordChanged extends RegisterEvent {
  const RePasswordChanged(this.repassword);
  final String repassword;
}