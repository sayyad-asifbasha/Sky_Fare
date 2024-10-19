import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sky_fare/data/enum.dart';
class get_flight_state extends Equatable
{

  const get_flight_state({
    this.source="",
    this.destination="",
    this.message="",
    this.fromDate=  DateTime.now(),
    this.toDate=  DateTime.now(),
    this.getFlightStatus=GetFlightStatus.initial
});
  final String source;
  final String destination;
  final String message;
  final DateTime fromDate;
  final DateTime toDate;
  final GetFlightStatus getFlightStatus;

  get_flight_state copyWith({
    String ? source,
    String ? destination,
    String ? message,
    DateTime ? fromDate,
    DateTime ? toDate,
    GetFlightStatus ? getFlightStatus,
}){
    return get_flight_state(
      source: source??this.source,
      destination: destination??this.destination,
      message: message??this.message,
      fromDate: fromDate??this.fromDate,
      toDate: toDate??this.toDate,
      getFlightStatus: getFlightStatus??this.getFlightStatus,
    );
  }

  @override
  List<Object> get props=>[source,destination,message,fromDate,toDate,getFlightStatus];
}