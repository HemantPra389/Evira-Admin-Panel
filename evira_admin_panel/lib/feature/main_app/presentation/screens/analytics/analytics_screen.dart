import 'package:evira_admin_panel/feature/main_app/presentation/screens/analytics/best_selling_category.dart';
import 'package:evira_admin_panel/feature/main_app/presentation/widgets/home_app_bar.dart';
import 'package:evira_admin_panel/feature/main_app/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:evira_admin_panel/core/asset_constants.dart' as asset;

class AnalyticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(""),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 20, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Selling',
                    style: asset.introStyles(22),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BestSellingCategory(),
                      ));
                    },
                    child: Text(
                      'See all',
                      style: asset.introStyles(18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductCard(
                      title: "Women Dress",
                      price: "1000",
                      image_url: [
                        "https://rukminim1.flixcart.com/image/880/1056/l2jcccw0/top/z/x/9/m-multicolor-dark-blue-top-s-rieka-original-imagdux9jrq5rggy.jpeg?q=50"
                      ],
                      category: "Clothes"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently Added',
                    style: asset.introStyles(22),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BestSellingCategory(),
                      ));
                    },
                    child: Text(
                      'See all',
                      style: asset.introStyles(18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductCard(
                      title: "Women Dress",
                      price: "1000",
                      image_url: [
                        "https://rukminim1.flixcart.com/image/880/1056/l2jcccw0/top/z/x/9/m-multicolor-dark-blue-top-s-rieka-original-imagdux9jrq5rggy.jpeg?q=50"
                      ],
                      category: "Clothes"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recently Added',
                    style: asset.introStyles(22),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BestSellingCategory(),
                      ));
                    },
                    child: Text(
                      'See all',
                      style: asset.introStyles(18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductCard(
                      title: "Women Dress",
                      price: "1000",
                      image_url: [
                        "https://rukminim1.flixcart.com/image/880/1056/l2jcccw0/top/z/x/9/m-multicolor-dark-blue-top-s-rieka-original-imagdux9jrq5rggy.jpeg?q=50"
                      ],
                      category: "Clothes"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
