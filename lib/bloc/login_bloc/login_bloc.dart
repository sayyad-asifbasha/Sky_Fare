import 'package:bloc/bloc.dart';
import 'package:sky_fare/bloc/login_bloc/login_state.dart';
import 'package:sky_fare/bloc/login_bloc/login_event.dart';
import 'package:sky_fare/respository/auth/login_repository.dart';
import 'package:sky_fare/data/enum.dart';
class LoginBloc extends Bloc<login_event, login_state> {
  LoginRepository loginRepository=LoginRepository();
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
  void _onSubmit(SubmitButton event,Emitter<login_state>emit)async{
    Map data={
      "email":state.email,
      "password":state.password
    };
    emit(
      state.copyWith(loginStatus: LoginStatus.loading)
    );
   await loginRepository.loginApi(data).then((value){
      if(value.token.isNotEmpty)
        {
          emit(
          state.copyWith(message: "Login Successfully",loginStatus:LoginStatus.success)
          );
        }
      else
        {
          emit(
          state.copyWith(message: value.message,loginStatus:LoginStatus.error)
          );
        }
    }).onError((error,StackTrace){
     emit(
         state.copyWith(
           message:error.toString()
         )
     );
   });

}
}
