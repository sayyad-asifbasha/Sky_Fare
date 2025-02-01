import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:bloc/bloc.dart';
import 'package:sky_fare/bloc/login_bloc/login_state.dart';
import 'package:sky_fare/bloc/login_bloc/login_event.dart';
import 'package:sky_fare/respository/auth/login_repository.dart';
import 'package:sky_fare/data/enum.dart';
import 'package:sky_fare/services/session_manager/session_controller.dart';

class LoginBloc extends Bloc<login_event, login_state> {
  LoginRepository loginRepository = LoginRepository();
  LoginBloc() : super(const login_state()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SubmitButton>(_onSubmit);
  }

  void _onEmailChanged(EmailChanged event, Emitter<login_state> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<login_state> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void _onSubmit(SubmitButton event, Emitter<login_state> emit) async {
    Map data = {"email": state.email, "password": state.password};
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    await loginRepository.loginApi(data).then((value) async {
      if (value.token.isNotEmpty) {
        final jwt = JWT.verify(value.token, SecretKey('asif@4873'));
        var user = {
          "token": value.token,
          "isLogin": true,
          "isAdmin": jwt.payload['isAdmin'],
          "name": jwt.payload['name']
        };
        await SessionController().saveUserInPreference(user);
        emit(state.copyWith(
            message: "Login Successfully", loginStatus: LoginStatus.success));

      var val=  await SessionController().getUserInPreference('name');
      } else {
        emit(state.copyWith(
            message: value.message, loginStatus: LoginStatus.error));
      }
    }).onError((error, StackTrace) {
      emit(state.copyWith(
          message: error.toString(), loginStatus: LoginStatus.error));
    });
  }
}
