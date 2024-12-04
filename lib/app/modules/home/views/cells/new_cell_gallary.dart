
import 'package:donation_flutter/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailCellGallary extends GetWidget {
  final String? image;
  final String? subTitle;

  const DetailCellGallary({
    Key? key,
    @required this.image,
    @required this.subTitle,
  }) : super(key: key);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: HexColor('#EDFDFA'),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 61,
              height: 31,
              decoration: BoxDecoration(
                color: HexColor('#E1F7F4'),
                borderRadius: BorderRadius.only(topRight: Radius.circular(16)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               Image.asset(
                 image!,
                 height: Get.height*.04,
                 width: Get.height*.08,
               ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  subTitle!,
                  style: TextStyle(
                    color: HexColor('#696969'),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
