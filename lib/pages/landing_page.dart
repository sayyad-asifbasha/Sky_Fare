import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sky_fare/bloc/get_flight_bloc/get_flight_bloc.dart';
import 'package:sky_fare/bloc/get_flight_bloc/get_flight_event.dart';
import 'package:sky_fare/bloc/get_flight_bloc/get_flight_state.dart';
import 'package:sky_fare/config/routes/routes.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
import 'package:sky_fare/data/enum.dart';
import 'package:sky_fare/utils/flushbar_helper.dart';

import '../components/loading_animation.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _key = GlobalKey<FormState>();
  late String _fromDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  late String _toDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

  late GetFlightBloc _getFlightBloc;
  late TextEditingController _sourceController;
  late TextEditingController _destinationController;


  @override
  void initState() {
    super.initState();
    _getFlightBloc=BlocProvider.of<GetFlightBloc>(context);
    _sourceController = TextEditingController(text: _getFlightBloc.state.source);
    _destinationController = TextEditingController(text: _getFlightBloc.state.destination);
    _getFlightBloc.add(GetList());
  }

  String _selectOption = 'roundTrip';
  void _swapFromAndTo() {
    final currentSource = context.read<GetFlightBloc>().state.source;
    final currentDestination = context.read<GetFlightBloc>().state.destination;

    // Dispatch events to update the source and destination in the bloc
    context.read<GetFlightBloc>().add(SourceChanged(source: currentDestination));
    context.read<GetFlightBloc>().add(DestinationChanged(destination: currentSource));
    _sourceController.text = currentDestination;
    _destinationController.text = currentSource;
  }

  Future pickFromDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;
    setState(() {
      _fromDate = '${newDate.day}/${newDate.month}/${newDate.year}';
    });
    (context).read<GetFlightBloc>().add(FromDateChanged(fromDate: newDate));
  }

  Future pickToDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    if (newDate == null) return;
    setState(() {
      _toDate = '${newDate.day}/${newDate.month}/${newDate.year}';
    });
    (context).read<GetFlightBloc>().add(ToDateChanged(toDate: newDate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Container(
                height: 80,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Hello Asif! 👋",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Sky is limit. Explore the world with us.",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFBCCEF8),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 1),
                  ],
                ),
                child: Stack(
                  children: [
                    Form(
                      key: _key,
                      child: Column(
                        children: <Widget>[
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.only(left: 15),
                          //       child: Radio<String>(
                          //         fillColor: MaterialStateColor.resolveWith(
                          //             (states) => Colors.black),
                          //         focusColor: MaterialStateColor.resolveWith(
                          //             (states) => Colors.black),
                          //         value: 'oneWay',
                          //         groupValue: _selectOption,
                          //         onChanged: (value) {
                          //           setState(() {
                          //             _selectOption = value!;
                          //           });
                          //         },
                          //       ),
                          //     ),
                          //     const Text('One Way'),
                          //     const SizedBox(width: 60),
                          //     Radio<String>(
                          //       value: 'roundTrip',
                          //       fillColor: MaterialStateColor.resolveWith(
                          //           (states) => Colors.black),
                          //       focusColor: MaterialStateColor.resolveWith(
                          //           (states) => Colors.black),
                          //       groupValue: _selectOption,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           _selectOption = value!;
                          //         });
                          //       },
                          //     ),
                          //     const Text('Round Trip'),
                          //   ],
                          // ),
                         const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    _selectOption="oneWay";
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: _selectOption=='roundTrip'? 0:2,
                                    backgroundColor:_selectOption=='roundTrip'? Colors.grey.shade400:Colors.black,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                                ),
                                child: Text("One Way",
                                  style: TextStyle(
                                      color:_selectOption=='roundTrip'?  Colors.black54:Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    _selectOption="roundTrip";
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: _selectOption=='oneWay'? 0:2,
                                    backgroundColor:_selectOption=='oneWay'? Colors.grey.shade400:Colors.black,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                                ),
                                child: Text("Round Trip",
                                  style: TextStyle(
                                      color:_selectOption=='oneWay'?  Colors.black54:Colors.white,
                                      fontSize: 16
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),

                          BlocBuilder<GetFlightBloc,get_flight_state>(
                              buildWhen: (current,previous)=>current.source!=previous.source|| current.sourceList != previous.sourceList,
                              builder: (context,state)
                              {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, bottom: 15),
                                  child: TypeAheadField<String>(
                                    builder: (context,controller, focusNode) {
                                      return TextFormField(
                                        controller: _sourceController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return '*required';
                                            }
                                            return null;
                                          },
                                        focusNode: focusNode,   // Use the provided focus node
                                        decoration: InputDecoration(
                                          prefixIcon:const Icon(Icons.flight_takeoff_rounded),
                                          labelText: "From",
                                          labelStyle: TextStyle(
                                              color: Colors.grey.shade700, fontSize: 18),
                                          hintText: "Origin",
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade700, fontSize: 16),
                                          enabledBorder: const UnderlineInputBorder(),
                                          focusedBorder: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black, width: 2)),
                                          contentPadding:
                                          const EdgeInsets.only(top: 0, bottom: 0),
                                        ),
                                      );
                                    },
                                    itemBuilder: (context,suggestion){
                                      return ListTile(
                                        title: Text(suggestion),
                                      );
                                    },
                                    onSelected:(suggestion) {
                                      _sourceController.text = suggestion;
                                      context.read<GetFlightBloc>().add(SourceChanged(source: suggestion));
                                    },
                                    suggestionsCallback: (pattern)
                                    {
                                      return state.sourceList.where((source)=>source.toLowerCase().contains(pattern.toLowerCase())).toList();
                                    },
                                  ),

                            );
                          }),
                          BlocBuilder<GetFlightBloc,get_flight_state>(
                            buildWhen: (current,previous)=>current.destination!=previous.destination || current.sourceList != previous.sourceList,
                              builder: (context,state){
                               return Padding(
                                  padding:
                                  const EdgeInsets.only(left: 15, right: 15, bottom: 0),
                                  child: TypeAheadField<String>(
                                    builder: (context,controller, focusNode) {
                                      return TextFormField(
                                        controller: _destinationController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return '*required';
                                          }
                                          return null;
                                        },
                                        focusNode: focusNode,   // Use the provided focus node
                                        decoration: InputDecoration(
                                            prefixIcon:const Icon(Icons.flight_land_rounded),
                                            labelText: "To",
                                            labelStyle: TextStyle(
                                                color: Colors.grey.shade700, fontSize: 18),
                                            hintText: "Destination",
                                            hintStyle: TextStyle(
                                                color: Colors.grey.shade700, fontSize: 16),
                                            enabledBorder: const UnderlineInputBorder(),
                                            focusedBorder: const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black, width: 2)),
                                            contentPadding:
                                            const EdgeInsets.only(top: 0, bottom: 0),
                                          ),
                                      );
                                    },
                                    itemBuilder: (context,suggestion){
                                      return ListTile(
                                        title: Text(suggestion),
                                      );
                                    },
                                    onSelected:(suggestion) {
                                      _destinationController.text = suggestion;
                                      context.read<GetFlightBloc>().add(DestinationChanged(destination: suggestion));
                                    },
                                    suggestionsCallback: (pattern)
                                    {
                                      return state.sourceList.where((source)=>source.toLowerCase().contains(pattern.toLowerCase())).toList();
                                    },
                                  ),
                                );
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  pickFromDate(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: _selectOption == 'roundTrip'
                                          ? 150
                                          : 300,
                                      height: 60,
                                      padding: const EdgeInsets.only(left: 10),
                                      decoration:const  BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 1))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          const  Icon(
                                            Icons.calendar_month_rounded,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                _selectOption == 'roundTrip'
                                                    ? "On"
                                                    : "From",
                                                style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                _fromDate,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (_selectOption == 'roundTrip')
                                InkWell(
                                  onTap: () {
                                    pickToDate(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 150,
                                        height: 60,
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.black,
                                                    width: 1))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            const Icon(
                                              Icons.calendar_month_rounded,
                                              size: 30,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              children: [
                                                Text(
                                                  "To",
                                                  style: TextStyle(
                                                    color: Colors.grey.shade700,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  _toDate,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlocListener<GetFlightBloc,get_flight_state>(
                            listenWhen: (current,previous)=>current.getFlightStatus!=previous.getFlightStatus,
                              listener: (context,state)
                          {
                            if(state.getFlightStatus==GetFlightStatus.success)
                              {
                                Navigator.pushNamed(context,RoutesNames.oneWayBookingScreen);
                              }
                            else if(state.getFlightStatus==GetFlightStatus.error)
                              {
                                FlushBarHelper.flushBarErrorMessage(state.message, context);
                              }
                          },
                            child: BlocBuilder<GetFlightBloc,get_flight_state>(
                              buildWhen: (current,previous)=>current.getFlightStatus!=previous.getFlightStatus,
                                builder: (context,state)
                                {
                                  return  ElevatedButton(
                                    onPressed: state.getFlightStatus==GetFlightStatus.loading?(){}:
                                        () {
                                      if (_key.currentState!.validate()) {
                                        _selectOption=='oneWay'? (context).read<GetFlightBloc>().add(GetFlightButton()):(context).read<GetFlightBloc>().add(GetRoundTrip());
                                      } else {
                                        FlushBarHelper.flushBarErrorMessage("Please fill all required fields", context);
                                      }
                                    }, // Disable button when loading
                                    style: ElevatedButton.styleFrom(
                                      elevation: 10,
                                      minimumSize: const Size(200, 50),
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                    ),
                                    child:SizedBox(
                                      width: 100,
                                      // Set a fixed width for the child content
                                      child: state.getFlightStatus ==
                                          GetFlightStatus.loading
                                          ? const Loader(
                                          size: 30,
                                          color: Colors.white)
                                          : const Text(
                                        "Book Now",
                                        textAlign: TextAlign.center,
                                        // Center align the text
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 90,
                      left: 275,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(2, 2),
                                  blurRadius: 10)
                            ]),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              _swapFromAndTo();
                            },
                            icon: Transform.rotate(
                              angle: 90 * 3.1416 / 180,
                              // Rotate 45 degrees (in radians)
                              child: const Icon(
                                Icons.compare_arrows_rounded,
                                color: Colors.white,
                                size: 27,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
