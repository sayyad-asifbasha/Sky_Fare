import 'package:equatable/equatable.dart';
abstract class get_flight_event extends Equatable
{
  const get_flight_event();
  @override
  List<Object> get props=>[];
}
class SourceChanged extends get_flight_event
{
  const SourceChanged({required this.source});
  final String source;
  @override
  List<Object> get props=>[source];
}

class DestinationChanged extends get_flight_event
{
  const  DestinationChanged({required this.destination});
  final String  destination;
  @override
  List<Object> get props=>[destination];
}

class FromDateChanged extends get_flight_event
{
  const  FromDateChanged({required this.fromDate});
  final DateTime  fromDate;
  @override
  List<Object> get props=>[fromDate];
}

class ToDateChanged extends get_flight_event
{
  const  ToDateChanged({required this.toDate});
  final DateTime  toDate;
  @override
  List<Object> get props=>[toDate];
}

class GetFlightButton extends get_flight_event{}