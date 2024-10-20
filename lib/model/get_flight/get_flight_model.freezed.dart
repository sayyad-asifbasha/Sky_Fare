// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_flight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetFlightModel _$GetFlightModelFromJson(Map<String, dynamic> json) {
  return _GetFlightModel.fromJson(json);
}

/// @nodoc
mixin _$GetFlightModel {
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'flights')
  List<FlightDetails> get flights => throw _privateConstructorUsedError;
  @JsonKey(name: 'sources')
  List<String> get sources => throw _privateConstructorUsedError;
  @JsonKey(name: 'destinations')
  List<String> get destinations => throw _privateConstructorUsedError;

  /// Serializes this GetFlightModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetFlightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetFlightModelCopyWith<GetFlightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFlightModelCopyWith<$Res> {
  factory $GetFlightModelCopyWith(
          GetFlightModel value, $Res Function(GetFlightModel) then) =
      _$GetFlightModelCopyWithImpl<$Res, GetFlightModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'flights') List<FlightDetails> flights,
      @JsonKey(name: 'sources') List<String> sources,
      @JsonKey(name: 'destinations') List<String> destinations});
}

/// @nodoc
class _$GetFlightModelCopyWithImpl<$Res, $Val extends GetFlightModel>
    implements $GetFlightModelCopyWith<$Res> {
  _$GetFlightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetFlightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? flights = null,
    Object? sources = null,
    Object? destinations = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      flights: null == flights
          ? _value.flights
          : flights // ignore: cast_nullable_to_non_nullable
              as List<FlightDetails>,
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<String>,
      destinations: null == destinations
          ? _value.destinations
          : destinations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetFlightModelImplCopyWith<$Res>
    implements $GetFlightModelCopyWith<$Res> {
  factory _$$GetFlightModelImplCopyWith(_$GetFlightModelImpl value,
          $Res Function(_$GetFlightModelImpl) then) =
      __$$GetFlightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'flights') List<FlightDetails> flights,
      @JsonKey(name: 'sources') List<String> sources,
      @JsonKey(name: 'destinations') List<String> destinations});
}

/// @nodoc
class __$$GetFlightModelImplCopyWithImpl<$Res>
    extends _$GetFlightModelCopyWithImpl<$Res, _$GetFlightModelImpl>
    implements _$$GetFlightModelImplCopyWith<$Res> {
  __$$GetFlightModelImplCopyWithImpl(
      _$GetFlightModelImpl _value, $Res Function(_$GetFlightModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetFlightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? flights = null,
    Object? sources = null,
    Object? destinations = null,
  }) {
    return _then(_$GetFlightModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      flights: null == flights
          ? _value._flights
          : flights // ignore: cast_nullable_to_non_nullable
              as List<FlightDetails>,
      sources: null == sources
          ? _value._sources
          : sources // ignore: cast_nullable_to_non_nullable
              as List<String>,
      destinations: null == destinations
          ? _value._destinations
          : destinations // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFlightModelImpl implements _GetFlightModel {
  _$GetFlightModelImpl(
      {@JsonKey(name: 'success') this.success = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'flights') final List<FlightDetails> flights = const [],
      @JsonKey(name: 'sources') final List<String> sources = const [],
      @JsonKey(name: 'destinations')
      final List<String> destinations = const []})
      : _flights = flights,
        _sources = sources,
        _destinations = destinations;

  factory _$GetFlightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFlightModelImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool success;
  @override
  @JsonKey(name: 'message')
  final String message;
  final List<FlightDetails> _flights;
  @override
  @JsonKey(name: 'flights')
  List<FlightDetails> get flights {
    if (_flights is EqualUnmodifiableListView) return _flights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flights);
  }

  final List<String> _sources;
  @override
  @JsonKey(name: 'sources')
  List<String> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  final List<String> _destinations;
  @override
  @JsonKey(name: 'destinations')
  List<String> get destinations {
    if (_destinations is EqualUnmodifiableListView) return _destinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinations);
  }

  @override
  String toString() {
    return 'GetFlightModel(success: $success, message: $message, flights: $flights, sources: $sources, destinations: $destinations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFlightModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._flights, _flights) &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            const DeepCollectionEquality()
                .equals(other._destinations, _destinations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      message,
      const DeepCollectionEquality().hash(_flights),
      const DeepCollectionEquality().hash(_sources),
      const DeepCollectionEquality().hash(_destinations));

  /// Create a copy of GetFlightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFlightModelImplCopyWith<_$GetFlightModelImpl> get copyWith =>
      __$$GetFlightModelImplCopyWithImpl<_$GetFlightModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFlightModelImplToJson(
      this,
    );
  }
}

abstract class _GetFlightModel implements GetFlightModel {
  factory _GetFlightModel(
          {@JsonKey(name: 'success') final bool success,
          @JsonKey(name: 'message') final String message,
          @JsonKey(name: 'flights') final List<FlightDetails> flights,
          @JsonKey(name: 'sources') final List<String> sources,
          @JsonKey(name: 'destinations') final List<String> destinations}) =
      _$GetFlightModelImpl;

  factory _GetFlightModel.fromJson(Map<String, dynamic> json) =
      _$GetFlightModelImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'flights')
  List<FlightDetails> get flights;
  @override
  @JsonKey(name: 'sources')
  List<String> get sources;
  @override
  @JsonKey(name: 'destinations')
  List<String> get destinations;

  /// Create a copy of GetFlightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetFlightModelImplCopyWith<_$GetFlightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlightDetails _$FlightDetailsFromJson(Map<String, dynamic> json) {
  return _FlightDetails.fromJson(json);
}

/// @nodoc
mixin _$FlightDetails {
  @JsonKey(name: 'airline')
  String get airline => throw _privateConstructorUsedError;
  @JsonKey(name: 'from')
  String get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'to')
  String get to => throw _privateConstructorUsedError;
  @DateTimeConverter()
  @JsonKey(name: 'departureTime')
  DateTime get departureTime => throw _privateConstructorUsedError;
  @DateTimeConverter()
  @JsonKey(name: 'arrivalTime')
  DateTime get arrivalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'fromAirport')
  String get fromAirport => throw _privateConstructorUsedError;
  @JsonKey(name: 'toAirport')
  String get toAirport => throw _privateConstructorUsedError;
  @JsonKey(name: 'seatsAvailable')
  int get seatsAvailable => throw _privateConstructorUsedError;

  /// Serializes this FlightDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlightDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlightDetailsCopyWith<FlightDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightDetailsCopyWith<$Res> {
  factory $FlightDetailsCopyWith(
          FlightDetails value, $Res Function(FlightDetails) then) =
      _$FlightDetailsCopyWithImpl<$Res, FlightDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'airline') String airline,
      @JsonKey(name: 'from') String from,
      @JsonKey(name: 'to') String to,
      @DateTimeConverter()
      @JsonKey(name: 'departureTime')
      DateTime departureTime,
      @DateTimeConverter() @JsonKey(name: 'arrivalTime') DateTime arrivalTime,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'fromAirport') String fromAirport,
      @JsonKey(name: 'toAirport') String toAirport,
      @JsonKey(name: 'seatsAvailable') int seatsAvailable});
}

/// @nodoc
class _$FlightDetailsCopyWithImpl<$Res, $Val extends FlightDetails>
    implements $FlightDetailsCopyWith<$Res> {
  _$FlightDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlightDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airline = null,
    Object? from = null,
    Object? to = null,
    Object? departureTime = null,
    Object? arrivalTime = null,
    Object? price = null,
    Object? fromAirport = null,
    Object? toAirport = null,
    Object? seatsAvailable = null,
  }) {
    return _then(_value.copyWith(
      airline: null == airline
          ? _value.airline
          : airline // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      arrivalTime: null == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      fromAirport: null == fromAirport
          ? _value.fromAirport
          : fromAirport // ignore: cast_nullable_to_non_nullable
              as String,
      toAirport: null == toAirport
          ? _value.toAirport
          : toAirport // ignore: cast_nullable_to_non_nullable
              as String,
      seatsAvailable: null == seatsAvailable
          ? _value.seatsAvailable
          : seatsAvailable // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlightDetailsImplCopyWith<$Res>
    implements $FlightDetailsCopyWith<$Res> {
  factory _$$FlightDetailsImplCopyWith(
          _$FlightDetailsImpl value, $Res Function(_$FlightDetailsImpl) then) =
      __$$FlightDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'airline') String airline,
      @JsonKey(name: 'from') String from,
      @JsonKey(name: 'to') String to,
      @DateTimeConverter()
      @JsonKey(name: 'departureTime')
      DateTime departureTime,
      @DateTimeConverter() @JsonKey(name: 'arrivalTime') DateTime arrivalTime,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'fromAirport') String fromAirport,
      @JsonKey(name: 'toAirport') String toAirport,
      @JsonKey(name: 'seatsAvailable') int seatsAvailable});
}

/// @nodoc
class __$$FlightDetailsImplCopyWithImpl<$Res>
    extends _$FlightDetailsCopyWithImpl<$Res, _$FlightDetailsImpl>
    implements _$$FlightDetailsImplCopyWith<$Res> {
  __$$FlightDetailsImplCopyWithImpl(
      _$FlightDetailsImpl _value, $Res Function(_$FlightDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlightDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airline = null,
    Object? from = null,
    Object? to = null,
    Object? departureTime = null,
    Object? arrivalTime = null,
    Object? price = null,
    Object? fromAirport = null,
    Object? toAirport = null,
    Object? seatsAvailable = null,
  }) {
    return _then(_$FlightDetailsImpl(
      airline: null == airline
          ? _value.airline
          : airline // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      arrivalTime: null == arrivalTime
          ? _value.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      fromAirport: null == fromAirport
          ? _value.fromAirport
          : fromAirport // ignore: cast_nullable_to_non_nullable
              as String,
      toAirport: null == toAirport
          ? _value.toAirport
          : toAirport // ignore: cast_nullable_to_non_nullable
              as String,
      seatsAvailable: null == seatsAvailable
          ? _value.seatsAvailable
          : seatsAvailable // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightDetailsImpl implements _FlightDetails {
  _$FlightDetailsImpl(
      {@JsonKey(name: 'airline') this.airline = '',
      @JsonKey(name: 'from') this.from = '',
      @JsonKey(name: 'to') this.to = '',
      @DateTimeConverter()
      @JsonKey(name: 'departureTime')
      required this.departureTime,
      @DateTimeConverter()
      @JsonKey(name: 'arrivalTime')
      required this.arrivalTime,
      @JsonKey(name: 'price') this.price = 0,
      @JsonKey(name: 'fromAirport') this.fromAirport = '',
      @JsonKey(name: 'toAirport') this.toAirport = '',
      @JsonKey(name: 'seatsAvailable') this.seatsAvailable = 0});

  factory _$FlightDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'airline')
  final String airline;
  @override
  @JsonKey(name: 'from')
  final String from;
  @override
  @JsonKey(name: 'to')
  final String to;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'departureTime')
  final DateTime departureTime;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'arrivalTime')
  final DateTime arrivalTime;
  @override
  @JsonKey(name: 'price')
  final int price;
  @override
  @JsonKey(name: 'fromAirport')
  final String fromAirport;
  @override
  @JsonKey(name: 'toAirport')
  final String toAirport;
  @override
  @JsonKey(name: 'seatsAvailable')
  final int seatsAvailable;

  @override
  String toString() {
    return 'FlightDetails(airline: $airline, from: $from, to: $to, departureTime: $departureTime, arrivalTime: $arrivalTime, price: $price, fromAirport: $fromAirport, toAirport: $toAirport, seatsAvailable: $seatsAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightDetailsImpl &&
            (identical(other.airline, airline) || other.airline == airline) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.arrivalTime, arrivalTime) ||
                other.arrivalTime == arrivalTime) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.fromAirport, fromAirport) ||
                other.fromAirport == fromAirport) &&
            (identical(other.toAirport, toAirport) ||
                other.toAirport == toAirport) &&
            (identical(other.seatsAvailable, seatsAvailable) ||
                other.seatsAvailable == seatsAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, airline, from, to, departureTime,
      arrivalTime, price, fromAirport, toAirport, seatsAvailable);

  /// Create a copy of FlightDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightDetailsImplCopyWith<_$FlightDetailsImpl> get copyWith =>
      __$$FlightDetailsImplCopyWithImpl<_$FlightDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightDetailsImplToJson(
      this,
    );
  }
}

abstract class _FlightDetails implements FlightDetails {
  factory _FlightDetails(
          {@JsonKey(name: 'airline') final String airline,
          @JsonKey(name: 'from') final String from,
          @JsonKey(name: 'to') final String to,
          @DateTimeConverter()
          @JsonKey(name: 'departureTime')
          required final DateTime departureTime,
          @DateTimeConverter()
          @JsonKey(name: 'arrivalTime')
          required final DateTime arrivalTime,
          @JsonKey(name: 'price') final int price,
          @JsonKey(name: 'fromAirport') final String fromAirport,
          @JsonKey(name: 'toAirport') final String toAirport,
          @JsonKey(name: 'seatsAvailable') final int seatsAvailable}) =
      _$FlightDetailsImpl;

  factory _FlightDetails.fromJson(Map<String, dynamic> json) =
      _$FlightDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'airline')
  String get airline;
  @override
  @JsonKey(name: 'from')
  String get from;
  @override
  @JsonKey(name: 'to')
  String get to;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'departureTime')
  DateTime get departureTime;
  @override
  @DateTimeConverter()
  @JsonKey(name: 'arrivalTime')
  DateTime get arrivalTime;
  @override
  @JsonKey(name: 'price')
  int get price;
  @override
  @JsonKey(name: 'fromAirport')
  String get fromAirport;
  @override
  @JsonKey(name: 'toAirport')
  String get toAirport;
  @override
  @JsonKey(name: 'seatsAvailable')
  int get seatsAvailable;

  /// Create a copy of FlightDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlightDetailsImplCopyWith<_$FlightDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
