// import 'package:flutter/material.dart';
// import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
// import 'package:laundry_app_ui/utils/constants.dart';

// class CameraScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: kToolbarHeight,
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: 16.0,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(
//                     FlutterIcons.keyboard_backspace_mdi,
//                     color: Colors.white,
//                   ),
//                 ),                
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30.0,
//           ),
//           Container(
//             width: double.infinity,
//             constraints: BoxConstraints(
//               minHeight: MediaQuery.of(context).size.height - 150.0,
//             ),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30.0),
//                 topRight: Radius.circular(30.0),
//               ),
//               color: Constants.scaffoldBackgroundColor,
//             ),
//             padding: EdgeInsets.symmetric(
//               vertical: 24.0,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [


                
//               ],
//             ),
//           )
//         ],
//       ),  
//     );
//   }
// }