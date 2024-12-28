import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app_ui/models/order.dart';
import 'package:laundry_app_ui/utils/constants.dart';
//import 'package:laundry_app_ui/widgets/location_slider.dart';
import 'package:laundry_app_ui/widgets/order_card.dart';

class LatestOrders extends StatelessWidget {
  final List<Order> orders = [
    Order(
      id: 507,
      deliveryAddress: "New Times Square",
      arrivalDate: DateTime(2020, 1, 23),
      placedDate: DateTime(2020, 1, 17),
      status: OrderStatus.DELIVERING,
    ),
    Order(
      id: 536,
      deliveryAddress: "Victoria Square",
      arrivalDate: DateTime(2020, 1, 21),
      placedDate: DateTime(2020, 1, 19),
      status: OrderStatus.PICKING_UP,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kToolbarHeight,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    FlutterIcons.keyboard_backspace_mdi,
                    color: Colors.white,
                  ),
                ),                
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 150.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              color: Constants.scaffoldBackgroundColor,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 24.0,
                //   ),
                //   child: Text(
                //     "New Locations",
                //     style: TextStyle(
                //       color: Color.fromRGBO(19, 22, 33, 1),
                //       fontSize: 18.0,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 7.0),
                // Container(
                //   height: ScreenUtil().setHeight(100.0),
                //   child: Center(
                //     // lets make a widget for the cards
                //     child: LocationSlider(),
                //   ),
                // ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latest Orders",
                            style: TextStyle(
                              color: Color.fromRGBO(19, 22, 33, 1),
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            "View All",
                            style: TextStyle(
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10.0,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        // Lets pass the order to a new widget and render it there
                        return OrderCard(
                          order: orders[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15.0,
                        );
                      },
                      itemCount: orders.length,
                    )
                    // Let's create an order model
                  ],
                ),
              ],
            ),
          )
        ],
      ),  
    );
  }
}
