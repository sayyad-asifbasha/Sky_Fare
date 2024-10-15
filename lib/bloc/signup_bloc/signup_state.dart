import 'package:equatable/equatable.dart';
import 'package:sky_fare/data/enum.dart';

class signup_state extends Equatable
{
  const signup_state({
    this.email="",
    this.password="",
    this.message="",
    this.name="",
    this.signupStatus=SignupStatus.initial,
    this.OTP=""
  });
  final String email;
  final String password;
  final String message;
  final String name;
  final String OTP;
  final SignupStatus signupStatus;


  signup_state copyWith({
     String ? email,
     String ? password,
     String ? message,
     String ? OTP,
     String ?name,
     SignupStatus ? signupStatus,
}){
    return signup_state(
      email: email??this.email,
      password: password??this.password,
      message: message??this.message,
      OTP: OTP??this.OTP,
      name: name??this.name,
      signupStatus: signupStatus??this.signupStatus,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email,password,message,OTP,signupStatus,name];
}