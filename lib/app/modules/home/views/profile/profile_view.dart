import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_flutter/app/modules/global_widgets/drawer_link_widget.dart';
import 'package:donation_flutter/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:donation_flutter/app/modules/home/widgets/AmountWidget.dart';
import 'package:donation_flutter/common/custom_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badges/badges.dart' as badges;


import 'package:donation_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:donation_flutter/app/modules/home/views/home_view.dart';


import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/color_constant_custom.dart';
import 'package:donation_flutter/common/custom_widget/custom_widget.dart';
import 'package:donation_flutter/common/ui.dart';
import 'package:donation_flutter/service/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class ProfileView extends GetView<HomeController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawerWidget(),
      backgroundColor: AppColors.primaryColor,
      appBar:AppBar(
        title: Text("Profile".tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
       color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimationConfiguration.staggeredList(
                      position: 0,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        horizontalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Container(
                            //height: 180,
                            width: Get.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 20, right: 20, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // controller.changeState();
                                        },
                                        child: Container(
                                          height: 145,
                                          width: 145,
                                          decoration: Ui.getBoxDecoration(
                                            color: AppColors.primaryColor,
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
                                                    AppColors.primaryColor,
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
                                                                      child: Text(
                                                                        '$uniCodeTk ' +
                                                                            Get.find<AuthService>().currentUser.value.user!.donateAmount!.toString(),
                                                                        style: const TextStyle(
                                                                            color: Colors.white,
                                                                            fontSize: 17,
                                                                            fontWeight: FontWeight.bold),
                                                                        maxLines:
                                                                        2,
                                                                        overflow:
                                                                        TextOverflow.ellipsis,
                                                                      )

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
                                                          'Donated'.tr,
                                                          style: TextStyle(
                                                            color: AppColors.primaryColor,
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
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.getUserDonationListById(Get.find<AuthService>().currentUser.value.user!.id);
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              'See All Donation'.tr,
                                              style:  TextStyle(
                                                fontSize: 14,
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: AppColors.primaryColor,
                                              size: 14,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  //Right Side 3 Item
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      AmountWidget(
                                          image: 'assets/images/phone.png',
                                          amount:
                                          '',
                                          title: 'Last Donated'.tr,
                                          padding: "10"
                                        // colors: Colors.white,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      AmountWidget(
                                          image:
                                          'assets/images/mobile_banking.png',
                                          amount:
                                          '',
                                          colors: AppColors.primaryColor,
                                          title: 'This Month'.tr,
                                          padding: "3"),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      AmountWidget(
                                          image: 'assets/images/bill_payment.png',
                                          amount:
                                          '',
                                          colors: AppColors.primaryColor,
                                          title: 'Max Donated'.tr,
                                          padding: "10"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              height: Get.height * .75,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .7,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                30.heightBox,

                                "Profile Information"
                                    .tr
                                    .text
                                    .size(16)
                                    .color(blackC)
                                    .semiBold
                                    .make(),
                                20.heightBox,
                                CustomTextField(
                                    context: context,
                                    controller:
                                        controller.ownerController.value,
                                    title: "User Name".tr,
                                    keyboardType: TextInputType.number,
                                    obsecure: false,
                                    hint:  Get.find<AuthService>().currentUser.value.user!.name,
                                    iconName: Icons.edit_outlined),
                                20.heightBox,
                                CustomTextField(
                                    context: context,
                                    controller:
                                        controller.outletNameController.value,
                                    title: "User Email".tr,
                                    keyboardType: TextInputType.number,
                                    obsecure: false,
                                    hint:
                                    Get.find<AuthService>().currentUser.value.user!.email,
                                    iconName: Icons.edit_outlined),
                                20.heightBox,

                                ///Phone Number TextField
                                CustomTextField(
                                    context: context,
                                    controller:
                                        controller.phoneController.value,
                                    title: "Personal Mobile no".tr,
                                    keyboardType: TextInputType.number,
                                    obsecure: false,
                                    hint: Get.find<AuthService>().currentUser.value.user!.mobile,
                                    iconName: Icons.edit_outlined),
                                20.heightBox,
                                CustomTextField(
                                    context: context,
                                    controller:
                                        controller.addressController.value,
                                    title: "Country".tr,
                                    keyboardType: TextInputType.number,
                                    obsecure: false,
                                    hint: Get.find<AuthService>().currentUser.value.user!.country,
                                    iconName: Icons.edit_outlined),
                                20.heightBox,


                              ],
                            ),
                          ),
                          Text(
                            "Support".tr,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.HOTLINE);
                              //   controller.makePhoneCall("01764314845");
                            },
                            child: Container(
                              height: 40,
                              child: ListTile(
                                leading: Image(
                                  image: AssetImage("assets/icons/help.png"),
                                ),
                                title: Text("Get help"),
                                trailing: Icon(Icons.navigate_next),
                              ),
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () async {
                              Uri url = Uri.parse(
                                  'https://shl.com.bd/terms-and-conditions.php');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                print("can not load this url");
                              }
                              // PaymentWeb(
                              //   appBar: "Terms and Condition",
                              //   url:
                              //   "https://jayga.io/terms_conditions.html",
                              // );
                            },
                            child: Container(
                              height: 40,
                              child: ListTile(
                                leading: Image(
                                  image:
                                      AssetImage("assets/icons/report.png"),
                                ),
                                title: Text("Terms of Service"),
                                trailing: Icon(Icons.navigate_next),
                              ),
                            ),
                          ),
                          Divider(),
                          InkWell(
                            onTap: () async {
                              final String urlString =
                                  "https://raw.githubusercontent.com/musabbir-mamun/app-privacy-policy/master/paystation/paystation.html";

                              Uri url = Uri.parse(urlString);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                print("can not load this url");
                              }
                              // PaymentWeb(
                              //   appBar: "Privacy and Sahring",
                              //   url:
                              //   "https://jayga.io/privacy_policy.html",
                              // );
                            },
                            child: Container(
                              height: 40,
                              child: ListTile(
                                leading: Image(
                                  image:
                                      AssetImage("assets/icons/report.png"),
                                ),
                                title: Text("Privacy Policy"),
                                trailing: Icon(Icons.navigate_next),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
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
