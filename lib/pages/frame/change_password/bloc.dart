import 'package:bloc/bloc.dart';

part 'event.dart';
part 'state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePasswordState()) {
    on<PasswordChanged>((_onPasswordChanged));
    on<RePasswordChanged>((_onRePasswordChanged));
  }

  void _onPasswordChanged(
      PasswordChanged event,
      Emitter<ChangePasswordState> emit,
      ) {
    emit(state.copyWith(password: event.password));
  }

  void _onRePasswordChanged(
      RePasswordChanged event,
      Emitter<ChangePasswordState> emit,
      ) {
    emit(state.copyWith(repassword: event.repassword));
  }
}
