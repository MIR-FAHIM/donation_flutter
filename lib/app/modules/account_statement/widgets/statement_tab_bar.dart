import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/common/Color.dart';

class StatementTabBar extends StatelessWidget {
  const StatementTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      height: 50,
      child: TabBar(
        controller: tabController,
        indicatorColor: AppColors.primaryColor,
        // indicator: ShapeDecoration(
        //     color: AppColors.primaryColor,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(12),
        //     )),
        // unselectedLabelColor: Colors.black,
        // labelColor: Color(0xffF15C22),
        tabs: [
          Tab(
              icon: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Transaction Details'.tr,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                // shadows: [
                //   Shadow(
                //       color: Colors.black.withOpacity(0.4),
                //       offset: Offset(2, 2),
                //       blurRadius: 1),
                // ]
              ),
            ),
          )),
          Tab(
              icon: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Transactions Summary'.tr,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                // shadows: [
                //   Shadow(
                //       color: Colors.black.withOpacity(0.4),
                //       offset: Offset(2, 2),
                //       blurRadius: 1),
                // ]
              ),
            ),
          )),
          // Tab(
          //     icon: Text(
          //   'Transaction'.tr,
          //   style: TextStyle(
          //     color: AppColors.primaryColor,
          //     fontSize: 16,
          //     fontWeight: FontWeight.w600,
          //     // shadows: [
          //     //   Shadow(
          //     //       color: Colors.black.withOpacity(0.4),
          //     //       offset: Offset(2, 2),
          //     //       blurRadius: 1),
          //     // ]
          //   ),
          // )),
        ],
      ),
    );
  }
}
