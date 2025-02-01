import 'package:bloc/bloc.dart';
import 'package:sky_fare/bloc/get_flight_bloc/get_flight_state.dart';
import 'package:sky_fare/bloc/get_flight_bloc/get_flight_event.dart';
import 'package:sky_fare/data/enum.dart';
import 'package:sky_fare/respository/flight/get_flight_repository.dart';

class GetFlightBloc extends Bloc<get_flight_event, get_flight_state> {
  GetFlightRepository getFlightRepository = GetFlightRepository();
  GetFlightBloc({required this.getFlightRepository}) : super(get_flight_state()) {
    on<SourceChanged>(_onSourceChanged);
    on<DestinationChanged>(_onDestinationChanged);
    on<FromDateChanged>(_onFromDateChanged);
    on<ToDateChanged>(_onToDateChanged);
    on<GetFlightButton>(_onGetFlightButton);
    on<GetList>(_onGetList);
    on<GetRoundTrip>(_onGetRoundTrip);
  }

  void _onSourceChanged(SourceChanged event, Emitter<get_flight_state> emit) {
    emit(
      state.copyWith(
        source: event.source,
      ),
    );
  }

  void _onDestinationChanged(
      DestinationChanged event, Emitter<get_flight_state> emit) {
    emit(
      state.copyWith(
        destination: event.destination,
      ),
    );
  }

  void _onFromDateChanged(
      FromDateChanged event, Emitter<get_flight_state> emit) {
    emit(
      state.copyWith(
        fromDate: event.fromDate,
      ),
    );
  }

  void _onToDateChanged(ToDateChanged event, Emitter<get_flight_state> emit) {
    emit(
      state.copyWith(
        toDate: event.toDate,
      ),
    );
  }

  void _onGetFlightButton(
      GetFlightButton event, Emitter<get_flight_state> emit) async {
    String url =
        '?from=${state.source}&to=${state.destination}&departureTime=${state.fromDate}';
    emit(state.copyWith(getFlightStatus: GetFlightStatus.loading));
    await getFlightRepository.getFlightApi(url).then((value) {
      if (value.flights.isEmpty||value.flights.length == 0) {
        emit(state.copyWith(
          getFlightStatus: GetFlightStatus.error,
          message: "Sorry no flights are available",
        ));
      } else {
        emit(state.copyWith(
            getFlightStatus: GetFlightStatus.success,
            message: "Successfully got flight list",
            flights: value.flights));
      }
    }).onError((error, StackTrace) {
      emit(state.copyWith(
          getFlightStatus: GetFlightStatus.error, message: error.toString()));
    });
  }
  void _onGetRoundTrip(GetRoundTrip event, Emitter<get_flight_state> emit) async {
    String url =
        '?from=${state.source}&to=${state.destination}&departureTime=${state.fromDate}';
    String url2 =
        '?from=${state.destination}&to=${state.source}&departureTime=${state.toDate}';

    emit(state.copyWith(getFlightStatus: GetFlightStatus.loading));

    try {
      // Fetch outbound flight details
      final outboundResult = await getFlightRepository.getFlightApi(url);
      if (outboundResult.flights.isEmpty) {
        emit(state.copyWith(
          getFlightStatus: GetFlightStatus.error,
          message: "Sorry, no outbound flights are available",
        ));
        return; // Exit if no outbound flights are found
      } else {
        emit(state.copyWith(
          flights: outboundResult.flights,
          message: "Outbound flight list fetched successfully",
        ));
      }

      // Fetch return flight details
      final returnResult = await getFlightRepository.getFlightApi(url2);
      if (returnResult.flights.isEmpty) {
        emit(state.copyWith(
          getFlightStatus: GetFlightStatus.error,
          message: "Sorry, no return flights are available",
        ));
      } else {
        emit(state.copyWith(
          returnFlights: returnResult.flights,
          getFlightStatus: GetFlightStatus.success,
          message: "Both outbound and return flights fetched successfully",
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        getFlightStatus: GetFlightStatus.error,
        message: "Error occurred while fetching flights: ${error.toString()}",
      ));
    }
  }

  void _onGetList(
      GetList event, Emitter<get_flight_state> emit) async {
    await getFlightRepository.getFlightSourceList().then((value) {
      emit(state.copyWith(
        sourceList: value.sources
      ));
    }).onError((error, StackTrace) {
    print(error.toString());
    });
    await getFlightRepository.getFlightDestinationList().then((value) {
      emit(state.copyWith(
          destinationList: value.destinations
      ));
    }).onError((error, StackTrace) {
      print(error.toString());
    });
  }

}
