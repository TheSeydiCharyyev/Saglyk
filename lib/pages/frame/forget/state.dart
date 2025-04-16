part of 'bloc.dart';

class ForgetState {
  const ForgetState({
    this.email="",
  });

  final String email;

  ForgetState copyWith({
    String? email,
  }) {
    return ForgetState(
      email: email ?? this.email,
    );
  }

}
