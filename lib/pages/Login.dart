import 'package:flutter/material.dart';
import 'package:sky_fare/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_fare/bloc/login_bloc/login_event.dart';
import 'package:sky_fare/bloc/login_bloc/login_state.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
import 'package:sky_fare/data/enum.dart';
import 'package:sky_fare/utils/flushbar_helper.dart';
import 'package:sky_fare/components/loading_animation.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<Login> {
  late LoginBloc _loginBloc;
  @override
  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child:GestureDetector(
          child:SingleChildScrollView(
            child:  Container(
              width: double.infinity,
              height:  MediaQuery.of(context).size.height,
              color: Color(0xFFBCCEF8),
              child: BlocProvider(create: (_)=>_loginBloc,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 10,
                                spreadRadius: 4,
                                offset: Offset(5, -3)
                            )]
                        ),
                        child: Padding(
                          padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Login",
                                style: TextStyle(
                                    fontSize: 25,
                                    color:Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "alex"
                                ),
                              ),
                              const SizedBox(height: 50),
                              BlocBuilder<LoginBloc,login_state>(
                                buildWhen: (current,previous)=>current.email!=previous.email,
                                builder: (context,state){
                                  return TextField(
                                    onChanged: (value){
                                      context.read<LoginBloc>().add(EmailChanged(email: value));
                                    },
                                    decoration: InputDecoration(
                                      labelText:"Email ID",
                                      labelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      hintText: "Enter the email ID",
                                      suffixIcon:const  Icon(Icons.email_outlined),
                                      suffixIconColor: Colors.black,
                                      enabledBorder:const  UnderlineInputBorder(),
                                      focusedBorder: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(1),
                                          borderSide:const  BorderSide(
                                            color: Colors.black,
                                            width: 1.5,
                                          )
                                      ),
                                    ),
                                    style:const  TextStyle(
                                      fontSize: 16,
                                    ),
                                    cursorColor: Colors.black,
                                    cursorHeight: 25,
                                  );
                                },

                              ),

                              const  SizedBox(height: 20,),
                              BlocBuilder<LoginBloc,login_state>(
                                  buildWhen: (current,previous)=>current.password!=previous.password,
                                  builder: (context,state){

                                    return TextField(
                                      onChanged: (value)
                                      {
                                        context.read<LoginBloc>().add(PasswordChanged(password: value));
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          labelText:"Password",
                                          labelStyle:const  TextStyle(
                                            color: Colors.black,
                                          ),
                                          hintText: "Enter the password",
                                          suffixIcon:const  Icon(Icons.security_rounded),
                                          suffixIconColor: Colors.black,
                                          enabledBorder: const UnderlineInputBorder(),
                                          focusedBorder: UnderlineInputBorder(
                                              borderRadius: BorderRadius.circular(1),
                                              borderSide:const  BorderSide(
                                                  color: Colors.black,
                                                  width: 1.5
                                              )
                                          )
                                      ),
                                      style:const  TextStyle(
                                        fontSize: 18,
                                      ),
                                      cursorColor: Colors.black,
                                      cursorHeight: 25,
                                    );
                                  }),

                              const  SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  InkWell(
                                    child:const  Text(
                                      "Forgot Password ?",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                    onTap: (){print("forgot password");},
                                  )
                                ],
                              ),
                              const SizedBox(height: 20,),
                              BlocListener<LoginBloc,login_state>(
                                listenWhen: (current,previous)=> current.loginStatus!=previous.loginStatus,
                                listener: (context,state){
                                  if(state.loginStatus==LoginStatus.error)
                                  {
                                    FlushBarHelper.flushBarWarningMessage(state.message, context);
                                  }
                                  if(state.loginStatus==LoginStatus.success)
                                  {
                                    FlushBarHelper.flushBarSuccessMessage("Logged in Successfully", context);
                                  }
                                },
                                child: BlocBuilder<LoginBloc, login_state>(
                                  buildWhen: (current, previous) => current.loginStatus != previous.loginStatus,
                                  builder: (context, state) {
                                    return ElevatedButton(
                                      onPressed: state.loginStatus == LoginStatus.loading
                                          ? (){}  // Disable button when loading
                                          : () {
                                        context.read<LoginBloc>().add(SubmitButton());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 10,
                                        minimumSize:const  Size(200, 50),
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      ),
                                      child:  SizedBox(
                                        width: 100,  // Set a fixed width for the child content
                                        child: state.loginStatus == LoginStatus.loading
                                            ? const Loader(size: 30, color: Colors.white)
                                            : const Text(
                                          "Login",
                                          textAlign: TextAlign.center,  // Center align the text
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                              ),
                              const SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  const Text(
                                    "Don`t have an account ",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  InkWell(
                                    child: const Text("Sign Up",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.pushNamedAndRemoveUntil(context, RoutesNames.signupScreen, (Route<dynamic> route) => false;
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              )
            ),
          ),
          onTap: () {
            FocusScope.of(context).unfocus();
          },
      ),
      ),
    );
  }
}
