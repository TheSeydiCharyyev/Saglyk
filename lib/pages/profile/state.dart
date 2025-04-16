part of 'bloc.dart';


class ProfileState {
  const ProfileState({
    this.userProfile,
  });
  final UserItem? userProfile;

  ProfileState copyWith({
    UserItem? userProfile,
  }) {
    return ProfileState(
      userProfile: userProfile ?? this.userProfile,
    );
  }
}
