import 'package:equatable/equatable.dart';
import 'package:sky_fare/data/enum.dart';
class login_state extends Equatable
{
  const login_state({
    this.email="",
    this.password="",
    this.message="",
    this.loginStatus=LoginStatus.initial
  });
  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;

  login_state copyWith({
    String ?email,
    String ?password,
    String ?message,
    LoginStatus ?loginStatus,
  }){
    return login_state(
      email: email??this.email,
      password: password??this.password,
      message: message??this.message,
      loginStatus: loginStatus??this.loginStatus
    );
  }

  @override
  List<Object> get props=>[email,password,message,loginStatus];
}
