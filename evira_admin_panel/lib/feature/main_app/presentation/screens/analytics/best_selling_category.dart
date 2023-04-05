import 'dart:convert';

import 'package:evira_admin_panel/feature/auth/presentation/widgets/back_app_bar.dart';
import 'package:evira_admin_panel/feature/main_app/presentation/screens/analytics/product_detail_screen.dart';
import 'package:evira_admin_panel/feature/main_app/presentation/widgets/product_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:evira_admin_panel/core/asset_constants.dart' as asset;

class BestSellingCategory extends StatefulWidget {
  @override
  State<BestSellingCategory> createState() => _BestSellingCategoryState();
}

class _BestSellingCategoryState extends State<BestSellingCategory> {
  String category = "clothes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(context, "Best Selling"),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/category.json'),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    var categoryData =
                        json.decode(snapshot.data.toString()) as List<dynamic>;
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              category = categoryData[index]['title'];
                              category = category.toLowerCase();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: asset.category_chip(
                                categoryData[index]['title'], category),
                          ),
                        );
                      },
                      itemCount: categoryData.length,
                    );
                  }
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen([
                          "https://rukminim1.flixcart.com/image/880/1056/l2jcccw0/top/z/x/9/m-multicolor-dark-blue-top-s-rieka-original-imagdux9jrq5rggy.jpeg?q=50"
                        ], "Casual Flared Sleeves Printed Women Dark Blue Top",
                            "1000", category),
                      ),
                    );
                  },
                  child: ProductDetailCard(
                      productQuantity: 1,
                      product_id: "product_id",
                      cartImageUrl:
                          "https://rukminim1.flixcart.com/image/880/1056/l2jcccw0/top/z/x/9/m-multicolor-dark-blue-top-s-rieka-original-imagdux9jrq5rggy.jpeg?q=50",
                      title:
                          "Casual Flared Sleeves Printed Women Dark Blue Top",
                      price: "1000"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
