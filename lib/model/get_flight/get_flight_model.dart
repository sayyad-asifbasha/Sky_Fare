import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_flight_model.g.dart';
part 'get_flight_model.freezed.dart';

@freezed
class GetFlightModel with _$GetFlightModel {
  factory GetFlightModel({
    @Default(false) @JsonKey(name: 'success') bool success,
    @Default('') @JsonKey(name: 'message') String message,
    @Default([]) @JsonKey(name: 'flights') List<FlightDetails> flights,
    @Default([])@JsonKey(name: 'sources') List<String> sources,
    @Default([])@JsonKey(name: 'destinations') List<String> destinations,

  }) = _GetFlightModel;

  factory GetFlightModel.fromJson(Map<String, dynamic> json) =>
      _$GetFlightModelFromJson(json);
}

@freezed
class FlightDetails with _$FlightDetails {
  factory FlightDetails({
    @Default('') @JsonKey(name: 'airline') String airline,
    @Default('') @JsonKey(name: 'from') String from,
    @Default('') @JsonKey(name: 'to') String to,
    @DateTimeConverter() @JsonKey(name: 'departureTime') required DateTime departureTime,
    @DateTimeConverter() @JsonKey(name: 'arrivalTime') required DateTime arrivalTime,
    @Default(0) @JsonKey(name: 'price') int price,
    @Default('') @JsonKey(name: 'fromAirport') String fromAirport,
    @Default('') @JsonKey(name: 'toAirport') String toAirport,
    @Default(0) @JsonKey(name: 'seatsAvailable') int seatsAvailable,
  }) = _FlightDetails;

  factory FlightDetails.fromJson(Map<String, dynamic> json) =>
      _$FlightDetailsFromJson(json);
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}
