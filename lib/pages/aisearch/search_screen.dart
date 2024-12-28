import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:laundry_app_ui/utils/constants.dart';

class SearchScreen extends StatelessWidget{
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Category",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            fillColor: Constants.primaryColor.withOpacity(0.1),
                            filled: true,
                            //prefixIcon: const Icon(Icons.person)
                        ),
                      ),

                      const SizedBox(height: 20),

                      TextField(
                        decoration: InputDecoration(
                            hintText: "Type",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none),
                            fillColor: Constants.primaryColor.withOpacity(0.1),
                            filled: true,
                            //prefixIcon: const Icon(Icons.email)
                        ),
                      ),

                      const SizedBox(height: 20),

                      TextField(
                        decoration: InputDecoration(
                          hintText: "Material",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Constants.primaryColor.withOpacity(0.1),
                          filled: true,
                          //prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                      ),

                      const SizedBox(height: 20),

                      TextField(
                        decoration: InputDecoration(
                          hintText: "Freetext",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          fillColor: Constants.primaryColor.withOpacity(0.1),
                          filled: true,
                          //prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),

                      child: ElevatedButton(
                        onPressed: () {
                        },
                        child: const Text(
                          "Generate",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          //shape: const StadiumBorder(),
                          //padding: const EdgeInsets.symmetric(vertical: 10),
                          backgroundColor: Constants.primaryColor,
                        ),
                      )
                  ),
                ],
              ),
            ),
            
          )
        ],
      ),  
    );
  }

}