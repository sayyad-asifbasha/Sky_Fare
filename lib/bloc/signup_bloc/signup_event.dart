import 'package:equatable/equatable.dart';
abstract class signup_event extends Equatable
{
  const signup_event();
  @override
  List<Object> get props=>[];
}
class EmailChanged extends signup_event
{
  const EmailChanged({required this.email});
  final String email;
  @override
  List<Object> get props=>[email];
}

class NameChanged extends signup_event
{
  const NameChanged({required this.name});
  final String name;
  @override
  List<Object> get props=>[name];
}


class PasswordChanged extends signup_event
{
  const PasswordChanged({required this.password});
  final String password;
  @override
  List<Object> get props=>[password];
}

class OTPChanged extends signup_event
{
  const OTPChanged({required this.OTP});
  final String OTP;
  @override
  List<Object> get props=>[OTP];
}

class ResetState extends signup_event{}


class SendOTP extends signup_event{}

class verifyOTP extends signup_event{}
