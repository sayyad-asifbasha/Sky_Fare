import 'package:flutter/material.dart';
import 'package:sky_fare/services/session_manager/session_controller.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _key = GlobalKey<FormState>();
  late final String _name;
  late String _fromDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  late String _toDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

  @override
  void initState() {
    super.initState();
    // Uncomment and utilize the session controller if needed
    // _name = SessionController().getUserInPreference('name') as String;
  }

  String _selectOption = 'roundTrip';

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Radio<String>(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.black),
                                  focusColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.black),
                                  value: 'oneWay',
                                  groupValue: _selectOption,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectOption = value!;
                                    });
                                  },
                                ),
                              ),
                              const Text('One Way'),
                              const SizedBox(width: 60),
                              Radio<String>(
                                value: 'roundTrip',
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black),
                                focusColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black),
                                groupValue: _selectOption,
                                onChanged: (value) {
                                  setState(() {
                                    _selectOption = value!;
                                  });
                                },
                              ),
                              const Text('Round Trip'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.flight_takeoff_rounded),
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
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, bottom: 0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.flight_land_rounded),
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
                            ),
                          ),
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
                                      padding: EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 1))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            Icons.calendar_month_rounded,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                          SizedBox(
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
                          ElevatedButton(
                            onPressed: () {}, // Disable button when loading
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              minimumSize: const Size(200, 50),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const SizedBox(
                              width: 100,
                              // Set a fixed width for the child content
                              child: const Text(
                                "Login",
                                textAlign: TextAlign.center,
                                // Center align the text
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 75,
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
                            onPressed: () {},
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
