import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
      backgroundColor: AppColors.primaryColor,
      appBar: PreferredSize(
          preferredSize: const Size(65, 65),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.gradientOne, AppColors.gradientTwo],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile".tr,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.gradientOne, AppColors.gradientTwo],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * .13,
                              width: MediaQuery.of(context).size.width * .3,
                              child: ProfileImage(),
                            ),
                            Positioned(
                              right: -5,
                              bottom: -5,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.verified_user,
                                  size: 23,
                                  color:Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                       Column(
                         children: [
                           Text("You have donated", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
                           Text("${Get.find<AuthService>().currentUser.value.user!.donateAmount.toString()} Taka",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),)
                         ],
                       )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),
            ),
            Container(
              height: Get.height * .8,
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
                      height: MediaQuery.of(context).size.height * .8,
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
