// import 'package:flutter/material.dart';
// import 'package:sky_fare/config/routes/routes_name.dart';
// import 'package:sky_fare/services/session_manager/session_controller.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//   late int _selectedIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: SafeArea(
//         child: Center(
//       child: IconButton(
//         onPressed: () async {
//           await SessionController().removeuserPerference();
//           Navigator.pushNamedAndRemoveUntil(context, RoutesNames.splashscreen,
//               (Route<dynamic> route) => false);
//         },
//         icon: const Icon(Icons.logout_outlined),
//       ),
//     )),
//     bottomNavigationBar: SafeArea(
//       child: Container(
//         height: 50,
//         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.black,
//         ),
//         child: TabBar(
//             automaticIndicatorColorAdjustment: true,
//             controller: _tabController,
//             dividerHeight: 0,
//             indicatorPadding: EdgeInsets.symmetric(vertical: 10),
//             indicatorColor: Colors.white,
//             indicatorSize: TabBarIndicatorSize.label,
//             indicator: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: const Color(0xFFBCCEF8)),
//             tabs: const [
//               Tab(
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Icon(
//                     Icons.home,
//                     size: 25,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               Tab(
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Icon(
//                     Icons.add,
//                     size: 25,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               Tab(
//                 child: Padding(
//                   padding: EdgeInsets.all(10),
//                   child: Icon(
//                     Icons.account_circle,
//                     size: 25,
//                     color: Colors.white,
//                   ),
//                 ),
//               )
//             ]),
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:sky_fare/config/routes/routes_name.dart';
import 'package:sky_fare/services/session_manager/session_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Listen for tab taps and update the PageView accordingly
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.jumpToPage(_tabController.index); // Sync with PageView
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                  _tabController.animateTo(index); // Sync with TabBar
                });
              },
              children: <Widget>[
                Container(color: Colors.blue),
                Container(color: Colors.yellow),
                Container(color: Colors.green),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: TabBar(
                  dividerHeight: 0,
                  controller: _tabController,
                  onTap: (index) {
                    _pageController
                        .jumpToPage(index); // Ensure PageView changes
                  },
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 10),
                  indicatorColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFFBCCEF8),
                  ),
                  tabs: [
                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.home_rounded,
                          size: 25,
                          color:
                              _selectedIndex == 0 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.airplane_ticket_outlined,
                          size: 25,
                          color:
                              _selectedIndex == 1 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.account_circle,
                          size: 25,
                          color:
                              _selectedIndex == 2 ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
