import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:laundry_app_ui/pages/adddetails_screen.dart';
import 'package:laundry_app_ui/pages/aisearch/search_screen.dart';
import 'package:laundry_app_ui/pages/details/details_screen.dart';
import 'package:laundry_app_ui/pages/profile_screen.dart';
import 'package:laundry_app_ui/utils/constants.dart';
import 'package:laundry_app_ui/widgets/latest_orders.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Track active index
  int activeIndex = 0;

  List<Map<String, dynamic>> _pages = [
    {'page': DetailsScreen()},
    {'page': SearchScreen()},  
    {'page': AdddetailsScreen()},  
    {'page': LatestOrders()},  
    {'page': ProfileScreen()}, 

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        buttonBackgroundColor: Constants.primaryColor,
        items: [
          Icon(
            FlutterIcons.ios_home_ion,
            size: 30.0,
            color: activeIndex == 0 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.globe_africa_faw5s,
            size: 30.0,
            color: activeIndex == 1 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.plus_ant,
            size: 30.0,
            color: activeIndex == 2 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.heart_fea,
            size: 30.0,
            color: activeIndex == 3 ? Colors.white : Color(0xFFC8C9CB),
          ),
          Icon(
            FlutterIcons.setting_ant,
            size: 30.0,
            color: activeIndex == 4 ? Colors.white : Color(0xFFC8C9CB),
          ),
        ],
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      backgroundColor: Constants.primaryColor,
      body: Stack( 
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0.0,
            top: -20.0,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                "assets/images/tailor_machine.png",
              ),
            ),
          ),
          Container(
            child: _pages[activeIndex]['page'] as Widget,
          ),
          // Expanded(
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         SizedBox(
          //           height: kToolbarHeight,
          //         ),
          //         Container(
          //           padding: EdgeInsets.symmetric(
          //             horizontal: 16.0,
          //           ),
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               GestureDetector(
          //                 onTap: () {
          //                   Navigator.pop(context);
          //                 },
          //                 child: Icon(
          //                   FlutterIcons.keyboard_backspace_mdi,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   RichText(
          //                     text: TextSpan(
          //                       children: [
          //                         TextSpan(
          //                           text: "Welcome Back,\n",
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .titleLarge!
          //                               .copyWith(
          //                                 color: Colors.white,
          //                               ),
          //                         ),
          //                         TextSpan(
          //                           text: "Tailor Aunty!",
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .titleLarge!
          //                               .copyWith(
          //                                 color: Colors.white,
          //                                 fontWeight: FontWeight.w600,
          //                               ),
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                   Image.asset(
          //                     "assets/images/dp.png",
          //                   )
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //         SizedBox(
          //           height: 50.0,
          //         ),
          //         Container(
          //           width: double.infinity,
          //           constraints: BoxConstraints(
          //             minHeight: MediaQuery.of(context).size.height - 200.0,
          //           ),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(30.0),
          //               topRight: Radius.circular(30.0),
          //             ),
          //             color: Constants.scaffoldBackgroundColor,
          //           ),
          //           padding: EdgeInsets.symmetric(
          //             vertical: 24.0,
          //           ),
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Padding(
          //                 padding: EdgeInsets.symmetric(
          //                   horizontal: 24.0,
          //                 ),
          //                 child: Text(
          //                   "New Locations",
          //                   style: TextStyle(
          //                     color: Color.fromRGBO(19, 22, 33, 1),
          //                     fontSize: 18.0,
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(height: 7.0),
          //               Container(
          //                 height: ScreenUtil().setHeight(100.0),
          //                 child: Center(
          //                   // lets make a widget for the cards
          //                   child: LocationSlider(),
          //                 ),
          //               ),
          //               LatestOrders(),                     
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
        ],
      ),
    );
  }
}
