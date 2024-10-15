// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';
// import 'package:sky_fare/bloc/signup_bloc/signup_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sky_fare/bloc/signup_bloc/signup_event.dart';
// import 'package:sky_fare/bloc/signup_bloc/signup_state.dart';
// import 'package:sky_fare/config/routes/routes_name.dart';
// import 'package:sky_fare/data/enum.dart';
// import 'package:sky_fare/utils/flushbar_helper.dart';
// import 'package:sky_fare/components/loading_animation.dart';
//
// class OtpVerification extends StatefulWidget {
//   const OtpVerification({super.key});
//
//   @override
//   State<OtpVerification> createState() => _OtpVerificationState();
// }
//
// class _OtpVerificationState extends State<OtpVerification> {
//   late SignupBloc _signupBloc;
//   @override
//   void initState() {
//     super.initState();
//     _signupBloc = BlocProvider.of<SignupBloc>(context);
//   }
//   void dispose() {
//     _signupBloc.close();  // Only if you manually manage it
//     super.dispose();
//   }
//
//
//   final defaultPinTheme = PinTheme(
//       width: 60,
//       height: 45,
//       textStyle: const TextStyle(
//         fontSize: 20,
//         color: Colors.black,
//       ),
//       decoration: BoxDecoration(
//           color: const Color(0xFFBCCEF8),
//           borderRadius: BorderRadius.circular(4),
//           border: Border.all(color: Colors.transparent)));
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//           leading: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.arrow_back_ios_new_rounded)))),
//       body: SafeArea(
//         child: Center(
//
//           child:BlocProvider(create: (_)=>_signupBloc,
//             child:  Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 const SizedBox(height: 40),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25),
//                   child: Text(
//                     "Verification",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     textAlign: TextAlign.center, // Centered text
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25),
//                   child: Text(
//                     "We have sent the verification code \n to your email address",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                       height: 1.2,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 BlocBuilder<SignupBloc, signup_state>(
//                     builder: (context, state) {
//                       return Container(
//                         padding: const EdgeInsets.all(25),
//                         child: Pinput(
//                             length: 6,
//                             defaultPinTheme: defaultPinTheme,
//                             focusedPinTheme: defaultPinTheme.copyWith(
//                               decoration: defaultPinTheme.decoration?.copyWith(
//                                   border: Border.all(color: Colors.black),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                         color: Colors.black,
//                                         offset: Offset(1, 1),
//                                         blurRadius: 5,
//                                         blurStyle: BlurStyle.inner)
//                                   ]),
//                             ),
//                             onChanged: (value) => {
//                               context
//                                   .read<SignupBloc>()
//                                   .add(OTPChanged(OTP: value))
//                             }),
//                       );
//                     }),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.center, // Center aligned row
//                     children: <Widget>[
//                       const Text(
//                         "Didn't receive your code? ",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey,
//                           height: 1.2,
//                         ),
//                       ),
//                       BlocListener<SignupBloc,signup_state>(
//                         listener: (context,state){
//                           if(state.signupStatus==SignupStatus.success)
//                           {
//                             FlushBarHelper.flushBarSuccessMessage(state.message, context);
//                           }
//                           else if(state.signupStatus==SignupStatus.error)
//                           {
//
//                             FlushBarHelper.flushBarWarningMessage(state.message, context);
//                           }
//                         },
//                         child: BlocBuilder<SignupBloc,signup_state>(builder: (context,state){
//                           return InkWell(
//                             onTap: () {
//                               (context).read<SignupBloc>().add(SendOTP());
//                             },
//                             child: Text(
//                               "Resend code",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.blue[900],
//                                 decoration: TextDecoration.underline,
//                                 height: 1.2,
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 BlocListener<SignupBloc, signup_state>(
//                   listenWhen: (current,previous)=>current.signupStatus!=previous.signupStatus,
//                   listener: (context, state) {
//                     if (state.signupStatus == SignupStatus.verified) {
//                       FlushBarHelper.flushBarSuccessMessage(
//                           state.message, context);
//                       Navigator.pushNamedAndRemoveUntil(context, RoutesNames.loginScreen, (Route<dynamic>route)=>false);
//                     } else if (state.signupStatus == SignupStatus.error) {
//                       FlushBarHelper.flushBarWarningMessage(
//                           state.message, context);
//                     }
//                   },
//                   child: BlocBuilder<SignupBloc, signup_state>(
//                       buildWhen: (current,previous)=>current.signupStatus!=previous.signupStatus,
//                       builder: (context, state) {
//                         return Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             ElevatedButton(
//                               onPressed:  () {
//                                 context.read<SignupBloc>().add(verifyOTP());
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 elevation: 10,
//                                 minimumSize: const Size(200, 50),
//                                 backgroundColor: Colors.black,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               child:  SizedBox(
//                                 width: 100,  // Set a fixed width for the child content
//                                 child: state.signupStatus == SignupStatus.loading
//                                     ?const  Loader(size: 30, color: Colors.white)
//                                     :const  Text(
//                                   "Verify OTP",
//                                   textAlign: TextAlign.center,  // Center align the text
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         );
//                       }),
//                 ),
//               ],
//             ),
//           )
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sky_fare/bloc/signup_bloc/signup_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_fare/bloc/signup_bloc/signup_event.dart';
import 'package:sky_fare/bloc/signup_bloc/signup_state.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
import 'package:sky_fare/data/enum.dart';
import 'package:sky_fare/utils/flushbar_helper.dart';
import 'package:sky_fare/components/loading_animation.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  final defaultPinTheme = PinTheme(
    width: 60,
    height: 45,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: const Color(0xFFBCCEF8),
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Colors.transparent),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Verification",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "We have sent the verification code \n to your email address",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                BlocBuilder<SignupBloc, signup_state>(
                  builder: (context, state) {
                    return Container(
                      padding: const EdgeInsets.all(25),
                      child: Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration?.copyWith(
                            border: Border.all(color: Colors.black),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(1, 1),
                                blurRadius: 5,
                                blurStyle: BlurStyle.inner,
                              ),
                            ],
                          ),
                        ),
                        onChanged: (value) {
                          context.read<SignupBloc>().add(OTPChanged(OTP: value));
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Didn't receive your code? ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          height: 1.2,
                        ),
                      ),
                      BlocListener<SignupBloc, signup_state>(
                          listenWhen: (current,previous)=>current.signupStatus!=previous.signupStatus,
                        listener: (context, state) {
                          if (state.signupStatus == SignupStatus.success) {
                            FlushBarHelper.flushBarSuccessMessage(
                                state.message, context);
                          } else if (state.signupStatus == SignupStatus.error) {
                            FlushBarHelper.flushBarWarningMessage(
                                state.message, context);
                          }
                        },
                        child: BlocBuilder<SignupBloc, signup_state>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                (context).read<SignupBloc>().add(SendOTP());
                              },
                              child: Text(
                                "Resend code",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue[900],
                                  decoration: TextDecoration.underline,
                                  height: 1.2,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                BlocListener<SignupBloc, signup_state>(
                  listenWhen: (current, previous) =>
                  current.signupStatus != previous.signupStatus,
                  listener: (context, state) async{
                    if (state.signupStatus == SignupStatus.verified) {
                     await FlushBarHelper.flushBarSuccessMessage(
                          state.message, context);
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesNames.loginScreen,
                            (Route<dynamic> route) => false,
                      );
                    } else if (state.signupStatus == SignupStatus.error) {
                      FlushBarHelper.flushBarWarningMessage(
                          state.message, context);
                    }
                  },
                  child: BlocBuilder<SignupBloc, signup_state>(
                    buildWhen: (current, previous) =>
                    current.signupStatus != previous.signupStatus,
                    builder: (context, state) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              context.read<SignupBloc>().add(verifyOTP());
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              minimumSize: const Size(200, 50),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: SizedBox(
                              width: 100,
                              child: state.signupStatus == SignupStatus.loading
                                  ? const Loader(size: 30, color: Colors.white)
                                  : const Text(
                                "Verify OTP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
