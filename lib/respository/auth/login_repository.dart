import 'package:sky_fare/config/AppUrl.dart';
import 'package:sky_fare/data/network/network_services_api.dart';
import 'package:sky_fare/model/user/user_model.dart';

class LoginRepository{
  final _api=NetworkServicesApi();
  Future<UserModel> loginApi(dynamic data) async{

    final response=await _api.postAPI(AppUrl.loginURL, data);
    return UserModel.fromJson(response);
  }
}