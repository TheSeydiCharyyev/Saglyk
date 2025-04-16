part of 'bloc.dart';

abstract class AccountEvent {
  const AccountEvent();
}

class UserProfileChanged extends AccountEvent {
  const UserProfileChanged(this.userProfile);

  final UserItem userProfile;

}