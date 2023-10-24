import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/icon_model.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../controllers/payment_collection_controller.dart';

class ShareLinkPaymentCollectionView
    extends GetView<PaymentCollectionController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: Color(0xFF652981),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Make the bill'.tr),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Colors.white70,
                )),
            // Builder(
            //   builder: (context) => // Ensure Scaffold is in context
            //       IconButton(
            //           onPressed: () => {Scaffold.of(context).openEndDrawer()},
            //           icon: Icon(
            //             Icons.menu,
            //             color: Colors.white70,
            //           )),
            // )
          ],
        ),
      ),
      body: Container(
          height: _size.width * .65,
          width: _size.width,
          child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 20.0,
              childAspectRatio: 1.3,
              children: List.generate(linkShare.length, (index) {
                return GestureDetector(
                  onTap: linkShare[index].press,
                  child: AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 475),
                    columnCount: 3,
                    child: SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 15),
                          child: Container(
                            decoration: Ui.getBoxDecoration(
                                radius: 10, color: Colors.white),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image(
                                  image: AssetImage(linkShare[index].image!),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }))),
    );
  }
}
