import 'package:sky_fare/config/AppUrl.dart';
import 'package:sky_fare/data/network/network_services_api.dart';
import 'package:sky_fare/model/signup/signup_model.dart';

class SignupRepository{
  final _api=NetworkServicesApi();
  Future<SignupModel> signupApi(dynamic data) async{

    final response=await _api.postAPI(AppUrl.singupURL, data);
    return SignupModel.fromJson(response);
  }
  Future<SignupModel> verifyOTP(dynamic data)async
  {
    final response=await _api.postAPI(AppUrl.verifyOTPURl, data);
    return SignupModel.fromJson(response);
  }
}