
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laundry_app_ui/utils/constants.dart';

class ImageListScreen extends StatelessWidget {
  const ImageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    //final double height = MediaQuery.of(context).size.height;
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
          // IconButton(
          //   icon: SvgPicture.asset(
          //     "assets/icons/search.svg",
          //     colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          //   ),
          //   onPressed: () {},
          // ),
          IconButton(
            iconSize: 30,
            icon: const Icon(FlutterIcons.photo_camera_mdi, color: Colors.white,),
            onPressed: () {} ,
          ),
          SizedBox(width: Constants.kDefaultPaddin / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            itemGrid(width),
          ],
        ),
      ),
    );
  }

  Widget itemGrid(double width) {
    const int count = 16;
    const int itemsPerRow = 2;
    const double ratio = 1 / 1;
    const double horizontalPadding = 0;
    final double calcHeight = ((width / itemsPerRow) - (horizontalPadding)) *
        (count / itemsPerRow).ceil() *
        (1 / ratio);
    return SizedBox(
      width: width,
      height: calcHeight,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        itemCount: count,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            crossAxisCount: itemsPerRow,
            childAspectRatio: ratio),
        itemBuilder: (context, index) {
          return SizedBox(
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  Expanded(
                      child: Image.network(
                          "https://picsum.photos/200?${DateTime.now().millisecondsSinceEpoch.toString()}")),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      "Lorem Ipsum is a dummy text, lorem ipsum",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}