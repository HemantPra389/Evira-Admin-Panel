import 'package:flutter/material.dart';
import 'package:evira_admin_panel/core/asset_constants.dart' as asset;
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  List<dynamic> image_url;
  String title;
  String price;
  String category;
  ProductCard(
      {required this.title,
      required this.price,
      required this.image_url,
      required this.category});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * .45,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200, spreadRadius: 2, blurRadius: 5)
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image_url[0],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: asset.introStyles(20, color: Colors.black),
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
                          '8,374 sold',
                          style: asset.introStyles(12),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '₹$price',
                    style: asset.introStyles(20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
