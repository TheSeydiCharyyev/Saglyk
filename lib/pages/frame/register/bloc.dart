import 'package:bloc/bloc.dart';

part 'event.dart';
part 'state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UserNameChanged>((_onUserNameChanged));
    on<EmailChanged>((_onEmailChanged));
    on<PasswordChanged>((_onPasswordChanged));
    on<RePasswordChanged>((_onRePasswordChanged));
  }

  void _onUserNameChanged(
      UserNameChanged event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(username: event.username));
  }

  void _onEmailChanged(
      EmailChanged event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
      PasswordChanged event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(password: event.password));
  }

  void _onRePasswordChanged(
      RePasswordChanged event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(repassword: event.repassword));
  }
}
