// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetFlightModelImpl _$$GetFlightModelImplFromJson(Map<String, dynamic> json) =>
    _$GetFlightModelImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      flights: (json['flights'] as List<dynamic>?)
              ?.map((e) => FlightDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GetFlightModelImplToJson(
        _$GetFlightModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'flights': instance.flights,
    };

_$FlightDetailsImpl _$$FlightDetailsImplFromJson(Map<String, dynamic> json) =>
    _$FlightDetailsImpl(
      airline: json['airline'] as String? ?? '',
      from: json['from'] as String? ?? '',
      to: json['to'] as String? ?? '',
      departureTime:
          const DateTimeConverter().fromJson(json['departureTime'] as String),
      arrivalTime:
          const DateTimeConverter().fromJson(json['arrivalTime'] as String),
      price: (json['price'] as num?)?.toInt() ?? 0,
      fromAirport: json['fromAirport'] as String? ?? '',
      toAirport: json['toAirport'] as String? ?? '',
      seatsAvailable: (json['seatsAvailable'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FlightDetailsImplToJson(_$FlightDetailsImpl instance) =>
    <String, dynamic>{
      'airline': instance.airline,
      'from': instance.from,
      'to': instance.to,
      'departureTime': const DateTimeConverter().toJson(instance.departureTime),
      'arrivalTime': const DateTimeConverter().toJson(instance.arrivalTime),
      'price': instance.price,
      'fromAirport': instance.fromAirport,
      'toAirport': instance.toAirport,
      'seatsAvailable': instance.seatsAvailable,
    };
