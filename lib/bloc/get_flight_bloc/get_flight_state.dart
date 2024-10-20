import 'package:equatable/equatable.dart';
import 'package:sky_fare/model/get_flight/get_flight_model.dart';
import 'package:sky_fare/data/enum.dart';

class get_flight_state extends Equatable {
  get_flight_state(
      {this.source = "",
      this.destination = "",
      this.message = "",
      DateTime? fromDate,
      DateTime? toDate,
        this.sourceList = const [],
        this.destinationList = const [],

      this.flights = const [],
      this.getFlightStatus = GetFlightStatus.initial})
      : fromDate = fromDate ?? DateTime.now(),
        toDate = toDate ?? DateTime.now();
  final String source;
  final String destination;
  final String message;
  final DateTime fromDate;
  final DateTime toDate;
  final List<String> sourceList;
  final List<String> destinationList;
  final List<FlightDetails> flights;
  final GetFlightStatus getFlightStatus;
  get_flight_state copyWith({
    String? source,
    String? destination,
    String? message,
    DateTime? fromDate,
    DateTime? toDate,
    GetFlightStatus? getFlightStatus,
    List<FlightDetails>? flights,
    List<String>? sourceList,
    List<String>? destinationList,

  }) {
    return get_flight_state(
      source: source ?? this.source,
      destination: destination ?? this.destination,
      message: message ?? this.message,
      fromDate: fromDate ?? this.fromDate,
      flights: flights ?? this.flights,
      sourceList: sourceList ?? this.sourceList,
      destinationList: destinationList ?? this.destinationList,
      toDate: toDate ?? this.toDate,
      getFlightStatus: getFlightStatus ?? this.getFlightStatus,
    );
  }

  @override
  List<Object> get props =>
      [source, destination, message, fromDate, toDate, getFlightStatus];
}
