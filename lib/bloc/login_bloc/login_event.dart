import 'package:equatable/equatable.dart';
abstract class login_event extends Equatable{
  const login_event();
  @override
  List<Object> get props =>[];
}

class EmailChanged extends login_event
{
  const EmailChanged({required this.email});
  final String email;
  @override
  List<Object> get props=>[email];
}


class PasswordChanged extends login_event
{
  const PasswordChanged({required this.password});
  final String password;
  @override
  List<Object> get props=>[password];
}

class SubmitButton extends login_event{}