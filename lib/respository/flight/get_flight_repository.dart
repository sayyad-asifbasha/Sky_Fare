import 'package:sky_fare/config/AppUrl.dart';
import 'package:sky_fare/data/network/network_services_api.dart';
import 'package:sky_fare/model/get_flight/get_flight_model.dart';

class GetFlightRepository {
  final _api = NetworkServicesApi();
  Future<GetFlightModel> getFlightApi(String url) async {
    final response = await _api.getAPI(AppUrl.getFlightURL + url);
    return GetFlightModel.fromJson(response);
  }

  Future<GetFlightModel> getFlightSourceList()async
  {
    final response=await _api.getAPI(AppUrl.getSourceList);
    return GetFlightModel.fromJson(response);
  }
  Future<GetFlightModel> getFlightDestinationList()async
  {
    final response=await _api.getAPI(AppUrl.getDestinationList);
    return GetFlightModel.fromJson(response);
  }
}
