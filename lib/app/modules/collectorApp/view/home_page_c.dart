import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badges/badges.dart' as badges;

import 'package:latest_payplus_agent/app/modules/home/controllers/home_controller.dart';
import 'package:latest_payplus_agent/app/modules/home/views/home_view.dart';
import 'package:latest_payplus_agent/app/modules/home/widgets/AmountWidget.dart';
import 'package:latest_payplus_agent/app/modules/inbox/controllers/inbox_controller.dart';
import 'package:latest_payplus_agent/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/color_constant_custom.dart';
import 'package:latest_payplus_agent/common/custom_data.dart';
import 'package:latest_payplus_agent/common/custom_widget/custom_widget.dart';
import 'package:latest_payplus_agent/common/ui.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class CollectorHomePage extends GetView<HomeController> {
  const CollectorHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _size = Get.size;
    return Scaffold(
        backgroundColor: Colors.white,
        // drawer: RechargeDrawer(),
        // // endDrawer: RechargeDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size(65, 65),
          child: AppBar(
            backgroundColor: const Color(0xFF652981),
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Row(
                children: [
                  ProfileImage(),

                  SizedBox(
                    width: 10,
                  ),

                  Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Get.find<AuthService>()
                              .currentUser
                              .value
                              .outletName ??
                              '',
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          Get.find<AuthService>()
                              .currentUser
                              .value
                              .mobileNumber ??
                              '',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        // controller.packageLoad.value == true
                        //     ? SizedBox(
                        //         height: 10,
                        //         width: 10,
                        //         child: CircularProgressIndicator())
                        //     : InkWell(
                        //         onTap: () {
                        //           Get.toNamed(Routes.PACKAGELIST);
                        //         },
                        //         child: Text(
                        //           controller.currentPackageModel.value.data!
                        //               .packageName,
                        //           style: const TextStyle(
                        //             fontSize: 12,
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ),
                      ],
                    );
                  }),
                  // Ui.offsetPopup()
                ],
              ),
            ),
            elevation: 0,
            actions: [
              Obx(() {
                return Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.redAccent,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      badgeContent: Text(Get.find<InboxController>()
                          .newNotificationNum
                          .toString()),
                      child: IconButton(
                          onPressed: () {
                            Get.lazyPut<RechargeController>(
                                  () => RechargeController(),
                            );
                            Get.find<InboxController>().removeNewMsgNum();
                            Get.toNamed(Routes.Notification_View);
                          },
                          icon: const Icon(
                            CupertinoIcons.bell,
                            color: Colors.white70,
                          )),
                    )
                  ],
                );
              }),
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
          // print(controller.balance.value);+
          return RefreshIndicator(
            color: const Color(0xFF652981),
            onRefresh: () async {
              controller.refreshHome();
            },
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [

                AnimationConfiguration.staggeredList(
                  position: 0,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Container(
                        //height: 180,
                        width: _size.width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 20, right: 20, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  // controller.changeState();
                                },
                                child: Container(
                                  height: 145,
                                  width: 145,
                                  decoration: Ui.getBoxDecoration(
                                    color: const Color(0xFF652981),
                                    radius: 100,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                        height: 145,
                                        width: 145,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                100),
                                            color:
                                            const Color(0xFF652981),
                                            border: Border.all(
                                                width: 2,
                                                color: Colors.white)),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .center,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .center,
                                              children: [
                                                Center(
                                                  child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        // const Image(
                                                        //   height: 15,
                                                        //   width: 15,
                                                        //   image: AssetImage('assets/images/taka.png'),
                                                        //   color: Colors.white,
                                                        // ),
                                                        Obx(() {
                                                          return Padding(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                top: 2.0,
                                                                right: 5),
                                                            child:
                                                            FittedBox(
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                              child: double.parse(controller.balance.value) >
                                                                  0.0
                                                                  ? Text(
                                                                '$uniCodeTk ' +
                                                                    controller.balance.value.toString().replaceAll('tk', ''),
                                                                style: const TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight.bold),
                                                                maxLines:
                                                                2,
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                              )
                                                                  : Text(
                                                                '$uniCodeTk ' +
                                                                    "0",
                                                                style: const TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 17,
                                                                    fontWeight: FontWeight.bold),
                                                                maxLines:
                                                                2,
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Balance'.tr,
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .primarydeepLightColor,
                                                    fontSize: 12,
                                                  ),
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                InkWell(
                  onTap: (){
                    Get.toNamed(Routes.ADDCOLLECTIONFORM);

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: Get.height*.07,
                      width: Get.width *.7,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20)

                      ),
                      child: Center(child: Text("Add Collection Type", style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Collection",
                          maxLines: 1,
                          style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15, color: AppColors.homeTextColor3, fontWeight: FontWeight.w500)),
                      Text("User",
                          maxLines: 1,
                          style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15, color: AppColors.homeTextColor3, fontWeight: FontWeight.w500)),
                      Text("Amount",
                          maxLines: 1,
                          style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15, color: AppColors.homeTextColor3, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                SizedBox(
                  height:  Get.height *.6,
                  child: ListView.builder(
                    itemCount: controller.paymentCollectionModel.length,
                      itemBuilder: (BuildContext c, index){
                      var data = controller.paymentCollectionModel[index];
                      return Card(
                        color: AppColors.primaryLightColor,
                        child: Container(
                          // color: Colors.blue,
                          width: Get.width,
                          height: Get.height *.08,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: Get.width*.3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text(data.title!,
                                        maxLines: 2,
                                        style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 12, color: AppColors.homeTextColor3, fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: 5,
                              // ),
                              Container(
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xFF652981),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Text(
                                      data.totalUser!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF652981),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              Container(
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color(0xFF652981),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            data.amount!,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF652981),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xFF652981),
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  )),

                              // Text.rich(
                              //   TextSpan(
                              //     text: amount,
                              //     style: TextStyle(
                              //       fontSize: 22,
                              //       color: Color(0xFF652981),
                              //       decoration: TextDecoration.underline,
                              //     ),
                              //     children: <TextSpan>[
                              //       TextSpan(
                              //           text: '>',
                              //           style: TextStyle(
                              //             decoration: TextDecoration.underline,
                              //             color: Color(0xFF652981),
                              //           )),
                              //       // can add more TextSpans here...
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      );
                      }

                  ),
                ),




                // SizedBox(
                //   height: 120,
                // ),
              ],
            ),
          );
        }));
  }

  showPopup(context, String type) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            //title: Text('Select '),
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Gallary'.tr),
                    onTap: () {
                      //  controller.getImage(ImageSource.gallery, type, "2");
                      Get.back();
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
