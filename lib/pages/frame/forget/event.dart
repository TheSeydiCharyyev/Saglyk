part of 'bloc.dart';

abstract class ForgetEvent {
  const ForgetEvent();

}

class EmailChanged extends ForgetEvent {
  const EmailChanged(this.email);

  final String email;

}