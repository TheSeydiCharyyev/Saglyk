import 'package:bloc/bloc.dart';
import 'package:app/common/entities/entities.dart';

part 'event.dart';
part 'state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<UserProfileChanged>(_onUserProfileChanged);
  }

  void _onUserProfileChanged(
      UserProfileChanged event,
      Emitter<ProfileState> emit,
      ) {
    emit(state.copyWith(userProfile: event.userProfile));
  }

}
