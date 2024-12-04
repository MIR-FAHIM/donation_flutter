import 'package:donation_flutter/common/Color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';



class HomePageListingProfileWidget extends StatelessWidget {
  const HomePageListingProfileWidget({
    super.key,
    required this.review,
    required this.title,
    required this.listingType,
    required this.description,
    required this.guestNum,
    required this.bedNum,
    required this.fullDayPriceSetByUser,
    required this.listingAddress,

    this.isSvg = true,
    this.height = 12,
  });
  final List review;
  final String title;
  final String listingType;
  final String guestNum;
  final String bedNum;

  final String fullDayPriceSetByUser;
  final String listingAddress;
  final String description;
  final bool isSvg;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.7,
                  //height: MediaQuery.of(context).size.height * .05,
                  child: Text(
                    title,
                    maxLines: 3,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.location_on, size: 18,),
                Text(
                  listingAddress,
                  style: TextStyle(
                    color: AppColors.textAlt,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.description,size: 18,),
                SizedBox(
                  width: Get.width*.75,
                  child: Text(
                    description,
                    style: TextStyle(
                      color: AppColors.textAlt,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
