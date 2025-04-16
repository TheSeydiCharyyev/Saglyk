part of 'bloc.dart';
class AccountState {
  const AccountState({
    this.userProfile,
  });
  final UserItem? userProfile;

  AccountState copyWith({
    UserItem? userProfile,
  }) {
    return AccountState(
      userProfile: userProfile ?? this.userProfile,
    );
  }
}
