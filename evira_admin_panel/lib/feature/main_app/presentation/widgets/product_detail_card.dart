import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:evira_admin_panel/core/asset_constants.dart' as asset;

class ProductDetailCard extends StatelessWidget {
  int productQuantity;
  String product_id;
  String cartImageUrl;
  String title;

  String price;
  ProductDetailCard({
    required this.productQuantity,
    required this.product_id,
    required this.cartImageUrl,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(right: 5,),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 2,
            )
          ],
          color: Colors.white),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 145,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                  cartImageUrl,
                ))),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        title,
                        maxLines: 3,
                        style: asset.introStyles(16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.star_half_outlined),
                    Text(
                      ' 4.5  |   ',
                      style: asset.introStyles(16, color: Colors.grey),
                    ),
                    Container(
                      width: 60,
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      alignment: Alignment.center,
                      color: Colors.grey.shade300,
                      child: Text(
                        '80 sold',
                        style: asset.introStyles(12),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Total Qty:",
                      style: asset.introStyles(16, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Net. 100",
                      style: asset.introStyles(16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Sell Price:",
                      style: asset.introStyles(16, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "₹" + price,
                      style: asset.introStyles(16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Price:",
                      style: asset.introStyles(16, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "₹800",
                      style: asset.introStyles(16),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(bottom: 5, right: 5),
                      child: Text(
                        "₹10000",
                        style: asset.introStyles(24, color: Colors.green),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  InkWell delete_decision(
      String title, VoidCallback fun, Color color, Color textColor) {
    return InkWell(
      onTap: fun,
      child: Container(
        width: 180,
        padding: const EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.2),
                  offset: const Offset(1, 1),
                  spreadRadius: 2,
                  blurRadius: 2)
            ]),
        child: Text(
          title,
          style:
              TextStyle(color: textColor, fontFamily: 'Ubuntu', fontSize: 18),
        ),
      ),
    );
  }
}
