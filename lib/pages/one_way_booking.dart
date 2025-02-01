import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_fare/bloc/get_flight_bloc/get_flight_bloc.dart';

class one_way_booking extends StatefulWidget {
  const one_way_booking({super.key});

  @override
  State<one_way_booking> createState() => _one_way_bookingState();
}

class _one_way_bookingState extends State<one_way_booking> {
  late GetFlightBloc _getFlightBloc;
  @override
  void initState() {
    super.initState();
    _getFlightBloc = BlocProvider.of<GetFlightBloc>(context);
    print(_getFlightBloc.state.flights);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flights for Your Trip"),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFFBCCEF8), // AppBar background color
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                spreadRadius: 2, // How far the shadow spreads
                blurRadius: 5, // How blurry the shadow is
                offset: const Offset(0, 1), // Position of the shadow (x, y)
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "19:20",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 0.5,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    side: const BorderSide(
                                      color: Colors.black, // Border color
                                      width: 0.5, // Border width
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                  child: const Text(
                                    "6h30m",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 0.5,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Text(
                                  "19:20",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),

                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Banglore",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Banglore",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 0.3,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Air India",
                                style: TextStyle(
                                  fontSize:16,
                                  fontWeight: FontWeight.w300,
                                ),
                                ),
                                Text("₹1000",
                                  style: TextStyle(
                                    fontSize:20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                )
                              ],
                            ),
                            ElevatedButton(
                                onPressed: (){
                                  showModalBottomSheet(context: context,
                                    isScrollControlled: true,
                                      builder: (context)
                                      {
                                        return Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,

                                            children: <Widget>[
                                             ListTile(
                                               leading: Icon(
                                                   Icons.radio_button_checked_outlined,
                                                 color: Colors.grey,
                                               ),
                                               title: Text("Bangalore"),
                                               subtitle: Text("Rajiv Gandhi International Airport"),
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(10),
                                               ),
                                             ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons.location_on_outlined,
                                                  color: Colors.redAccent,
                                                ),
                                                title: Text("Bangalore"),
                                                subtitle: Text("Rajiv Gandhi International Airport"),
                                              ),
                                              ListTile(
                                                title: Text("Economy Class"),
                                                trailing: Text("₹ 2000",
                                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),
                                                ),
                                                contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 0),
                                                tileColor: Colors.lightGreen.shade50,
                                              ),
                                              ListTile(
                                                title: Text("Business Class"),
                                                trailing: Text("₹ 6000",
                                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),
                                                ),
                                                contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 0),
                                                tileColor: Colors.lightGreen.shade50,
                                              ),
                                              ListTile(
                                                title: Text("First Class"),
                                                trailing: Text("₹ 10000",
                                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black87),
                                                ),
                                                selectedTileColor:Colors.green.shade700,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 50,vertical: 0),
                                                tileColor: Colors.lightGreen.shade50,
                                              ),
                                              SizedBox(height: 20,),
                                              ElevatedButton(
                                                  onPressed: (){},
                                                  child: Text("Book now",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color:Colors.white,
                                                  ),
                                                  ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.black,
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                      );
                                },
                                child: Text("View More",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                elevation: 0,
                              ),
                            )
                          ],
                        ),
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          border:Border.all(
                              width: 0.5,
                            color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(4),
                          boxShadow:[ BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 2,
                              offset: Offset(-0.5, 0),
                              spreadRadius: 2),]
                        ),
                      );
                    })),
          ),
        ],
      )),
    );
  }
}
