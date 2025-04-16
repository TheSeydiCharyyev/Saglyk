part of 'bloc.dart';

class RegisterState {
  const RegisterState({
    this.username = "",
    this.email = "",
    this.password = "",
    this.repassword = "",
  });

  final String username;
  final String email;
  final String password;
  final String repassword;

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? repassword,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      repassword: repassword ?? this.repassword,
    );
  }
}
