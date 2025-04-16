part of 'bloc.dart';

class ChangePasswordState {

  const ChangePasswordState({
    this.password = "",
    this.repassword = "",
  });

  final String password;
  final String repassword;

  ChangePasswordState copyWith({
    String? password,
    String? repassword,
  }) {
    return ChangePasswordState(
      password: password ?? this.password,
      repassword: repassword ?? this.repassword,
    );
  }
}
