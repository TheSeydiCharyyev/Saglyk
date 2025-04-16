part of 'bloc.dart';

abstract class ChangePasswordEvent {
  const ChangePasswordEvent();
}


class PasswordChanged extends ChangePasswordEvent {
  const PasswordChanged(this.password);
  final String password;
}

class RePasswordChanged extends ChangePasswordEvent {
  const RePasswordChanged(this.repassword);
  final String repassword;
}