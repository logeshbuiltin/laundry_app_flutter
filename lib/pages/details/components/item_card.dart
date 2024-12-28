import 'package:flutter/material.dart';
import 'package:laundry_app_ui/models/products.dart';
import 'package:laundry_app_ui/utils/constants.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(Constants.kDefaultPaddin),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Constants.kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: Constants.kTextLightColor),
            ),
          ),
          // Text(
          //   "\$${product.price}",
          //   style: const TextStyle(fontWeight: FontWeight.bold),
          // )
        ],
      ),
    );
  }
}
