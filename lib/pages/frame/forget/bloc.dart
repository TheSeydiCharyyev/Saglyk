import 'package:bloc/bloc.dart';

part 'event.dart';
part 'state.dart';

class ForgetBloc extends Bloc<ForgetEvent, ForgetState> {
  ForgetBloc() : super(const ForgetState()) {
    on<EmailChanged>(_onEmailChanged);
  }

  void _onEmailChanged(
      EmailChanged event,
      Emitter<ForgetState> emit,
      ) {
    emit(state.copyWith(email: event.email));
  }

}
