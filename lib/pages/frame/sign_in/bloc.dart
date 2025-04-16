import 'package:bloc/bloc.dart';

part 'event.dart';
part 'state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  void _onEmailChanged(
      EmailChanged event,
      Emitter<SignInState> emit,
      ) {
    emit(state.copyWith(email: event.email));
  }
  void _onPasswordChanged(
      PasswordChanged event,
      Emitter<SignInState> emit,
      ) {
    emit(state.copyWith(password: event.password));
  }
}
