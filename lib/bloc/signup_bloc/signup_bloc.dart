import 'package:bloc/bloc.dart';
import 'package:sky_fare/bloc/signup_bloc/signup_event.dart';
import 'package:sky_fare/bloc/signup_bloc/signup_state.dart';
import 'package:sky_fare/data/enum.dart';
import 'package:sky_fare/respository/auth/signup_repository.dart';

class SignupBloc extends Bloc<signup_event,signup_state> {
  SignupRepository signupRepository;

  SignupBloc({required this.signupRepository}) :super(const signup_state()) {
    on<EmailChanged>(_onEmailChanged);
    on<NameChanged>(_onNameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<OTPChanged>(_onOTPChanged);
    on<SendOTP>(_onSendOTP);
    on<verifyOTP>(_verifyOTP);
    on<ResetState>(_resetState);
  }

  void _onNameChanged(NameChanged event, Emitter<signup_state> emit) {
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }

  void _onEmailChanged(EmailChanged event, Emitter<signup_state> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }


  void _onPasswordChanged(PasswordChanged event, Emitter<signup_state> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }
  void _onOTPChanged(OTPChanged event, Emitter<signup_state> emit) {
    print("OTP in changed ${event.OTP}");
    emit(
      state.copyWith(
        OTP: event.OTP,
      ),
    );
  }
  void _onSendOTP(SendOTP event,Emitter<signup_state>emit) async{
    Map data={
      "name":state.name,
      "email":state.email,
      "password":state.password
    };
    print(data);
    emit(
      state.copyWith(
        signupStatus: SignupStatus.loading
      )
    );
    await signupRepository.signupApi(data).then((value){
      if(value.success)
        {
          emit(
            state.copyWith(
              signupStatus: SignupStatus.success,
              message: value.message
            )
          );
        }
      else{
        emit(
          state.copyWith(
            signupStatus: SignupStatus.error,
            message: value.message
          )
        );
      }
    }).onError((error, stackTrace){
      emit(
          state.copyWith(
              signupStatus: SignupStatus.error,
              message: error.toString()
          )
      );
    });
  }
 void _resetState(ResetState event,Emitter<signup_state>emit)
 {
   emit(
     state.copyWith(
       email: "",
       password: "",
       OTP: "",
       signupStatus: SignupStatus.initial,
       name:"",
       message: ""
     )
   );
 }
  void _verifyOTP(verifyOTP event,Emitter<signup_state>emit) async{
    Map data={
      "email":state.email,
      "otp":state.OTP
    };
    print(data);
    emit(
      state.copyWith(
        signupStatus: SignupStatus.loading,
      )
    );
    await signupRepository.verifyOTP(data).then((value){
      if(value.success)
        {
          emit(
            state.copyWith(
              signupStatus: SignupStatus.verified,
              message: value.message
            )
          );
        }
      else
        {
          emit(
            state.copyWith(
              signupStatus: SignupStatus.error,
              message: value.message
            )
          );
        }
    }).onError(( Error,StackTrace){
      emit(
          state.copyWith(
              signupStatus: SignupStatus.error,
              message: Error.toString()
          )
      );
    });
  }
}