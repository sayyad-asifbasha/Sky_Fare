import 'package:flutter/material.dart';
import 'package:sky_fare/bloc/signup_bloc/signup_bloc.dart';
import 'package:sky_fare/bloc/signup_bloc/signup_state.dart';
import 'package:sky_fare/bloc/signup_bloc/signup_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
import 'package:sky_fare/data/enum.dart';
import 'package:sky_fare/utils/flushbar_helper.dart';
import 'package:sky_fare/components/loading_animation.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late SignupBloc _signupBloc;

  @override
  void initState() {
    super.initState();
    _signupBloc = BlocProvider.of<SignupBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFBCCEF8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocProvider(
                  create: (_) => _signupBloc,
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 10,
                                spreadRadius: 4,
                                offset: const Offset(5, -3))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Signup",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "alex"),
                              ),
                              const SizedBox(height: 50),
                              BlocBuilder<SignupBloc, signup_state>(
                                  buildWhen: (current, previous) =>
                                      current.name != previous.name,
                                  builder: (context, state) {
                                    return TextFormField(
                                      onChanged: (value) {
                                        context
                                            .read<SignupBloc>()
                                            .add(NameChanged(name: value));
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return '*required';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        labelText: "Name",
                                        labelStyle: const TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: "Ex : Joe",
                                        suffixIcon: const Icon(Icons.person),
                                        suffixIconColor: Colors.black,
                                        enabledBorder:
                                            const UnderlineInputBorder(),
                                        focusedBorder: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(1),
                                            borderSide: const BorderSide(
                                              color: Colors.black,
                                              width: 1.5,
                                            )),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                      cursorColor: Colors.black,
                                      cursorHeight: 25,
                                    );
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              BlocBuilder<SignupBloc, signup_state>(
                                  builder: (context, state) {
                                return TextFormField(
                                  onChanged: (value) {
                                    context
                                        .read<SignupBloc>()
                                        .add(EmailChanged(email: value));
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '*required';
                                    } else if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(value)) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    hintText: "Joe@gmail.com",
                                    suffixIcon: const Icon(Icons.email_rounded),
                                    suffixIconColor: Colors.black,
                                    enabledBorder: const UnderlineInputBorder(),
                                    focusedBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(1),
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                          width: 1.5,
                                        )),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                  cursorColor: Colors.black,
                                  cursorHeight: 25,
                                );
                              }),
                              const SizedBox(
                                height: 20,
                              ),
                              BlocBuilder<SignupBloc, signup_state>(
                                  buildWhen: (current, previous) =>
                                      current.password != previous.password,
                                  builder: (context, state) {
                                    return TextFormField(
                                      onChanged: (value) {
                                        context.read<SignupBloc>().add(
                                            PasswordChanged(password: value));
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return '*required';
                                        } else if (value.length < 8) {
                                          return 'Password must be at least 8 characters long';
                                        } else if (!RegExp(r'[A-Z]')
                                            .hasMatch(value)) {
                                          return 'Password must contain at least one uppercase letter';
                                        } else if (!RegExp(r'[a-z]')
                                            .hasMatch(value)) {
                                          return 'Password must contain at least one lowercase letter';
                                        } else if (!RegExp(r'[0-9]')
                                            .hasMatch(value)) {
                                          return 'Password must contain at least one number';
                                        } else if (!RegExp(r'[!@#\$&*~]')
                                            .hasMatch(value)) {
                                          return 'Password must contain at least one special character (e.g. @, #, &)';
                                        }
                                        return null;
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          labelText: "Password",
                                          labelStyle: const TextStyle(
                                            color: Colors.black,
                                          ),
                                          hintText: "Enter the password",
                                          suffixIcon: const Icon(
                                              Icons.security_rounded),
                                          suffixIconColor: Colors.black,
                                          enabledBorder: UnderlineInputBorder(),
                                          focusedBorder: UnderlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(1),
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.5))),
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                      cursorColor: Colors.black,
                                      cursorHeight: 25,
                                    );
                                  }),
                              const SizedBox(
                                height: 20,
                              ),
                              BlocListener<SignupBloc, signup_state>(
                                listenWhen: (current, previous) =>
                                    current.signupStatus !=
                                    previous.signupStatus,
                                listener: (context, state) async {
                                  if (state.signupStatus ==
                                      SignupStatus.success) {
                                    await FlushBarHelper.flushBarSuccessMessage(
                                        state.message, context);
                                    _formKey.currentState!.reset();

                                    Navigator.pushNamed(
                                        context, RoutesNames.OTPscreen,
                                        arguments: state.email);
                                  } else if (state.signupStatus ==
                                      SignupStatus.error) {
                                    FlushBarHelper.flushBarWarningMessage(
                                        state.message, context);
                                    _formKey.currentState!.reset();
                                  }
                                },
                                child: BlocBuilder<SignupBloc, signup_state>(
                                    buildWhen: (current, previous) =>
                                        current.signupStatus !=
                                        previous.signupStatus,
                                    builder: (context, state) {
                                      return ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            context
                                                .read<SignupBloc>()
                                                .add(SendOTP());
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 10,
                                          minimumSize: Size(200, 50),
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        child: SizedBox(
                                          width: 100,
                                          // Set a fixed width for the child content
                                          child: state.signupStatus ==
                                                  SignupStatus.loading
                                              ? const Loader(
                                                  size: 30, color: Colors.white)
                                              : const Text(
                                                  "Send OTP",
                                                  textAlign: TextAlign.center,
                                                  // Center align the text
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                        ),
                                      );
                                    }),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  const Text(
                                    "Already have an account ",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  InkWell(
                                    child: const Text(
                                      "Signin",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          RoutesNames.loginScreen,
                                          (Route<dynamic> route) => false);
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                )
              ],
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
