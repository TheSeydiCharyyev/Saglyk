
part of 'bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class UserProfileChanged extends ProfileEvent {
  const UserProfileChanged(this.userProfile);

  final UserItem userProfile;

}
