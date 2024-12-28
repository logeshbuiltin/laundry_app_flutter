import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_app_ui/models/products.dart';
import 'package:laundry_app_ui/pages/camera_screen.dart';
import 'package:laundry_app_ui/pages/details/components/categories.dart';
import 'package:laundry_app_ui/pages/details/components/item_card.dart';
import 'package:laundry_app_ui/pages/imageview/imagelist_screen.dart';
import 'package:laundry_app_ui/utils/constants.dart';

class DetailsScreen extends StatelessWidget{

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg",
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 30,
            icon: const Icon(FlutterIcons.plus_ant, color: Colors.white,),
            onPressed: () {
              CameraScreen();
            } ,
          ),
          SizedBox(width: Constants.kDefaultPaddin / 2)
        ],
      ),
      body: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 200.0,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Constants.kDefaultPaddin),
              child: Text(
                "Tailor Models",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Categories(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.kDefaultPaddin),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: Constants.kDefaultPaddin,
                    crossAxisSpacing: Constants.kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageListScreen(
                          //product: products[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )      
    );
  }
}
