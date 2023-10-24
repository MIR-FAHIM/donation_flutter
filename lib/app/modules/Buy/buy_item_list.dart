import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:latest_payplus_agent/app/modules/Buy/buy_item_detail.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class BuyListItem extends StatelessWidget {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: const Color(0xFF652981),
          centerTitle: true,
          title: Text('Buy'.tr),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.Notification_View);
                },
                icon: const Icon(
                  CupertinoIcons.bell,
                  color: Colors.white70,
                )),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),

                //search
                Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: _size.width * 0.9,
                      margin: const EdgeInsets.fromLTRB(15, 5, 0, 1),
                      padding: const EdgeInsets.only(top: 18, left: 20),
                      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(235, 235, 235, 1),
                        borderRadius: BorderRadius.circular(8.5),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Product'.tr,
                          // icon: Image.asset(
                          //   "assets/images/cart.png",
                          //   width: 15,
                          //   height: 15,
                          // ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  width: _size.width,
                  color: AppColors.primarydeepLightColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Product'.tr + " : ১০"),
                        Text('Buy Price'.tr + ": ৳ ০.০০"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                //product
                InkWell(
                  onTap: () {
                    Get.to(BuyItemDetail());
                  },
                  child: Container(
                    color: AppColors.SecondbackgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(10.0),

                            /// Image item
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(15.0)),
                                    image: const DecorationImage(
                                        image: AssetImage('assets/images/hand.png')),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12.withOpacity(0.1),
                                          blurRadius: 0.5,
                                          spreadRadius: 0.1)
                                    ]),
                                child: Container(
                                  height: 65.0,
                                  width: 65.0,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    image: const DecorationImage(
                                        image: AssetImage('assets/images/hand.png')),
                                  ),
                                ))),
                        Flexible(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                            child: Column(
                              /// Text Information Item
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Container(
                                      width: 100.0,
                                      child: Text(
                                        'Oppo Mobile',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Sans",
                                            color: AppColors.homeTextColor3,
                                            fontSize: 14.0),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Container(
                                      // width:
                                      //     MediaQuery.of(context).size.width * 0.4,
                                      // height: 25,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).secondaryHeaderColor,
                                        border: Border.all(color: Colors.red, width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.only(
                                            left: 8, right: 8, top: 3, bottom: 3),
                                        child: const Center(
                                          child: Text(
                                            'Deactive',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'In Stock'.tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontFamily: "Sofia",
                                              color: AppColors.homeTextColor3,
                                              fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5.0, top: 5),
                                          child: Text(
                                            '১০',
                                            style: TextStyle(
                                                color: AppColors.homeTextColor3,
                                                fontFamily: "Sofia",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Buy Price'.tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontFamily: "Sofia",
                                              color: AppColors.homeTextColor3,
                                              fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5.0, top: 5),
                                          child: Text(
                                            '৳ ৩৫০',
                                            style: TextStyle(
                                                color: AppColors.homeTextColor3,
                                                fontFamily: "Sofia",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Sell Price'.tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontFamily: "Sofia",
                                              color: AppColors.homeTextColor3,
                                              fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5.0, top: 5),
                                          child: Text(
                                            '৳ ৪৫০',
                                            style: TextStyle(
                                                color: AppColors.homeTextColor3,
                                                fontFamily: "Sofia",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Image.asset(
                            "assets/icons/right_arrow.png",
                            width: 15,
                            height: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                // Container(
                //   color: AppColors.SecondbackgroundColor,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: <Widget>[
                //       Padding(
                //           padding: const EdgeInsets.all(10.0),
                //
                //           /// Image item
                //           child: Container(
                //               decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius:
                //                       const BorderRadius.all(const Radius.circular(15.0)),
                //                   image: const DecorationImage(
                //                       image: const AssetImage('assets/images/shop.png')),
                //                   boxShadow: [
                //                     BoxShadow(
                //                         color: Colors.black12.withOpacity(0.1),
                //                         blurRadius: 0.5,
                //                         spreadRadius: 0.1)
                //                   ]),
                //               child: Container(
                //                 height: 65.0,
                //                 width: 65.0,
                //                 decoration: const BoxDecoration(
                //                   borderRadius:
                //                       const BorderRadius.all(Radius.circular(15.0)),
                //                   image: const DecorationImage(
                //                       image: AssetImage('assets/images/shop.png')),
                //                 ),
                //               ))),
                //       Flexible(
                //         child: Padding(
                //           padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                //           child: Column(
                //             /// Text Information Item
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: <Widget>[
                //               Row(
                //                 children: [
                //                   Container(
                //                     width: 100.0,
                //                     child: const Text(
                //                       'Dell Monitor',
                //                       style: TextStyle(
                //                           fontWeight: FontWeight.w600,
                //                           fontFamily: "Sans",
                //                           color: Colors.black87,
                //                           fontSize: 14.0),
                //                       overflow: TextOverflow.clip,
                //                     ),
                //                   ),
                //                   Container(
                //                     // width:
                //                     //     MediaQuery.of(context).size.width * 0.4,
                //                     // height: 25,
                //                     decoration: BoxDecoration(
                //                       color: Theme.of(context).secondaryHeaderColor,
                //                       border: Border.all(color: Colors.green, width: 1),
                //                       borderRadius: BorderRadius.circular(10),
                //                     ),
                //                     child: const Padding(
                //                       padding: EdgeInsets.only(
                //                           left: 8, right: 8, top: 3, bottom: 3),
                //                       child: const Center(
                //                         child: Text(
                //                           'Active',
                //                           style: TextStyle(
                //                               color: Colors.green,
                //                               fontWeight: FontWeight.bold,
                //                               fontSize: 12),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               const SizedBox(
                //                 height: 8.0,
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                //                 children: [
                //                   Column(
                //                     children: [
                //                       Text(
                //                         'In Stock'.tr,
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.w300,
                //                             fontFamily: "Sofia",
                //                             color: AppColors.homeTextColor3,
                //                             fontSize: 12),
                //                         overflow: TextOverflow.ellipsis,
                //                       ),
                //                       const Padding(
                //                         padding: EdgeInsets.only(bottom: 5.0, top: 5),
                //                         child: const Text(
                //                           '১০',
                //                           style: const TextStyle(
                //                               color: Colors.black,
                //                               fontFamily: "Sofia",
                //                               fontSize: 12,
                //                               fontWeight: FontWeight.w700),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   Column(
                //                     children: [
                //                       Text(
                //                         'Buy Price'.tr,
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.w300,
                //                             fontFamily: "Sofia",
                //                             color: AppColors.homeTextColor3,
                //                             fontSize: 12),
                //                         overflow: TextOverflow.ellipsis,
                //                       ),
                //                       const Padding(
                //                         padding: EdgeInsets.only(bottom: 5.0, top: 5),
                //                         child: const Text(
                //                           '৳ ৪৫০',
                //                           style: const TextStyle(
                //                               color: Colors.black,
                //                               fontFamily: "Sofia",
                //                               fontSize: 12,
                //                               fontWeight: FontWeight.w700),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   Column(
                //                     children: [
                //                       Text(
                //                         'Sell Price'.tr,
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.w300,
                //                             fontFamily: "Sofia",
                //                             color: AppColors.homeTextColor3,
                //                             fontSize: 12),
                //                         overflow: TextOverflow.ellipsis,
                //                       ),
                //                       const Padding(
                //                         padding: EdgeInsets.only(bottom: 5.0, top: 5),
                //                         child: const Text(
                //                           '৳ ৫০০',
                //                           style: TextStyle(
                //                               color: Colors.black,
                //                               fontFamily: "Sofia",
                //                               fontSize: 12,
                //                               fontWeight: FontWeight.w700),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(right: 20),
                //         child: Image.asset(
                //           "assets/icons/right_arrow.png",
                //           width: 15,
                //           height: 15,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                    color: const Color.fromARGB(255, 43, 42, 43).withOpacity(0.2),
                    blurRadius: 2,
                    offset: const Offset(0, -2)),
              ],
              //  border: border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(Routes.Add_New_Product);
                },
                child: Container(
                  width: _size.width,
                  height: _size.width * .1,
                  decoration:
                      Ui.getBoxDecoration(color: const Color(0xFF652981), radius: 10),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "+ " + 'Add New Item'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
