import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sky_fare/data/exceptions/app_exceptions.dart';
import 'package:sky_fare/data/network/base_api_services.dart';

class NetworkServicesApi implements BaseApiServices
{
  dynamic jsonResponse;
  @override
  Future<dynamic> getAPI(String url) async{
    try{
      final response=await http.get(Uri.parse(url));
      jsonResponse=returnResponse(response);
      return jsonResponse;
    }on SocketException{
      throw NoInternetException('');
    }catch(error)
    {
      throw error;
    }
  }
  @override
  Future<dynamic> postAPI(String url,var data)async {
    try{
      final response=await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data), );
      jsonResponse=returnResponse(response);
      return jsonResponse;
    }on SocketException{
      throw NoInternetException('');
    }catch(error)
    {
      throw error;
    }
  }


  dynamic returnResponse(http.Response response)
  {
    switch(response.statusCode)
    {
      case 200:
        dynamic res=jsonDecode(response.body);
        return res;
      case 201:
        dynamic res=jsonDecode(response.body);
        return res;
      case 400:
        dynamic res=jsonDecode(response.body);
        return res;
      case 403:
        dynamic res=jsonDecode(response.body);
        return res;
      case 500:
        throw FetechDataException('');
      case 401:
        throw UnauthorisedException();
      case 404:
        dynamic res=jsonDecode(response.body);
        return res;
      default:
        throw UnauthorisedException();
    }
  }
}