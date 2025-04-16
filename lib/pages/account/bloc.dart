import 'package:bloc/bloc.dart';
import 'package:app/common/entities/entities.dart';

part 'event.dart';
part 'state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState()) {
    on<UserProfileChanged>(_onUserProfileChanged);
  }
  void _onUserProfileChanged(
      UserProfileChanged event,
      Emitter<AccountState> emit,
      ) {
    emit(state.copyWith(userProfile: event.userProfile));
  }
}
