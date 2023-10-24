import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/ui.dart';
import '../controllers/offer_controller.dart';

class OfferView extends GetView<OfferController> {
  const OfferView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MainDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: const Color(0xFF652981),
          centerTitle: true,
          title: Text('Offer'.tr),
          automaticallyImplyLeading: false,
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
            IconButton(
                onPressed: () => {Scaffold.of(context).openEndDrawer()},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white70,
                )),
          ],
        ),
      ),
      body: Obx(() {
        return controller.offerBannerLoaded.isTrue
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(controller.offerBanner.length, (index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                height: Get.size.width * .3,
                                width: Get.size.width,
                                imageUrl:
                                    controller.offerBanner[index].advertisementBanner ??
                                        '',
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Image(
                                    image: AssetImage('assets/Logo.png'),
                                  ),
                                ),
                                errorWidget: (context, url, error) => const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Image(
                                    image: AssetImage('assets/Logo.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            : Center(child: Ui.customLoader());
      }),
    );
  }
}
