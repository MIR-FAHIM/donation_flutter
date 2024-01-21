import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badges/badges.dart' as badges;

import 'package:latest_payplus_agent/app/modules/home/controllers/home_controller.dart';
import 'package:latest_payplus_agent/app/modules/home/views/home_view.dart';
import 'package:latest_payplus_agent/app/modules/inbox/controllers/inbox_controller.dart';
import 'package:latest_payplus_agent/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/color_constant_custom.dart';
import 'package:latest_payplus_agent/common/custom_widget/custom_widget.dart';
import 'package:latest_payplus_agent/common/ui.dart';
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
                        "Profile",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Obx(() {
                        return badges.Badge(
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
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          )),
      body: WillPopScope(
        onWillPop: () async {
          // bool value = false;
          // Get.toNamed(Routes.ROOT);
          final value = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Are you sure you want to exit?'),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      //return false when click on "NO"
                      child: Text('No'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      //return true when click on "Yes"
                      child: Text('Yes'),
                    ),
                  ],
                );
              });
          return value == true;
        },
        child: SingleChildScrollView(
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
                                    color: Get.find<AuthService>()
                                                .currentUser
                                                .value
                                                .kyc_status ==
                                            "none"
                                        ? AppColors.greenTextColor
                                        : Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              controller.getAllCompany();
                            },
                            child: SizedBox(
                                height: Get.height * .07,
                                width: Get.width * .3,
                                child: Image(
                                  image: AssetImage("assets/Logow.png"),
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: Text(
                          Get.find<AuthService>()
                                  .currentUser
                                  .value
                                  .outletName ??
                              '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          Get.find<AuthService>()
                                  .currentUser
                                  .value
                                  .mobileNumber ??
                              '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: Get.height * .6,
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
                    InkWell(
                      onTap: () {
                        //Get.toNamed(Routes.CREATEOWNJAYGA);
                      },
                      child: Container(
                        height: Get.find<AuthService>()
                                    .currentUser
                                    .value
                                    .kyc_status ==
                                "none"
                            ? Get.height * .0
                            : Get.height * .1,
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            )),
                        child: SizedBox(
                          height: Get.height * .1,
                          width: MediaQuery.of(context).size.width,
                          child: Get.find<AuthService>()
                                      .currentUser
                                      .value
                                      .kyc_status ==
                                  "none"
                              ? Container()
                              : Get.find<AuthService>()
                                          .currentUser
                                          .value
                                          .kyc_status ==
                                      "required"
                                  ? Card(
                                      color: Colors.red.withOpacity(.4),
                                      child: ListTile(
                                        title: Text(
                                          "আপনার NID'র তথ্য দিয়ে রেজিস্ট্রেশন নিশ্চিত করুন",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        trailing: InkWell(
                                          onTap: () {
                                            Get.toNamed(Routes.NEWNID);
                                          },
                                          child: Container(
                                            height: 30,
                                            width: Get.width * .2,
                                            decoration: Ui.getBoxDecoration(
                                                radius: 5.0),
                                            child: Center(
                                              child: Text(
                                                "তথ্য দিন",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Get.find<AuthService>()
                                              .currentUser
                                              .value
                                              .kyc_status ==
                                          "rejected"
                                      ? Card(
                                          color: Colors.red.withOpacity(.4),
                                          child: ListTile(
                                            title: Text(
                                              "আপনার এনআইডি ও ছবির মিল না থাকায় রেজিষ্ট্রেশন সফল হয়নি। আগামী ৭২ ঘন্টার মধ্যে আমাদের প্রতিনিধি আপনার সাথে যোগাযোগ করবে। বিস্তারিতঃ ০৯৬১৩৮২৮৪৮২",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            trailing: InkWell(
                                              onTap: () {
                                                Get.toNamed(Routes.NEWNID);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: Get.width * .2,
                                                decoration: Ui.getBoxDecoration(
                                                    radius: 5.0),
                                                child: Center(
                                                  child: Text(
                                                    "তথ্য দিন",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .4,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  30.heightBox,

                                  "Profile Information".tr
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
                                      title: "Owner Name".tr,
                                      keyboardType: TextInputType.number,
                                      obsecure: false,
                                      hint: controller.profileInfoModel.value
                                                  .data!.customerName ==
                                              null
                                          ? "No Data"
                                          : controller.profileInfoModel.value
                                              .data!.customerName,
                                      iconName: Icons.edit_outlined),
                                  20.heightBox,
                                  CustomTextField(
                                      context: context,
                                      controller:
                                          controller.outletNameController.value,
                                      title: "Outlet Name".tr,
                                      keyboardType: TextInputType.number,
                                      obsecure: false,
                                      hint: Get.find<AuthService>()
                                              .currentUser
                                              .value
                                              .outletName ??
                                          'Add Outlet Name',
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
                                      hint: Get.find<AuthService>()
                                          .currentUser
                                          .value
                                          .mobileNumber!,
                                      iconName: Icons.edit_outlined),
                                  20.heightBox,
                                  CustomTextField(
                                      context: context,
                                      controller:
                                          controller.addressController.value,
                                      title: "Address".tr,
                                      keyboardType: TextInputType.number,
                                      obsecure: false,
                                      hint: controller.profileInfoModel.value
                                                  .data!.outletAddress ==
                                              null
                                          ? "No Data"
                                          : controller.profileInfoModel.value
                                              .data!.outletAddress,
                                      iconName: Icons.edit_outlined),
                                  20.heightBox,

                                  ///Email TextField
                                  CustomTextField(
                                      context: context,
                                      controller:
                                          controller.phoneController.value,
                                      keyboardType: TextInputType.text,
                                      title: "Email".tr,
                                      obsecure: false,
                                      hint: controller.profileInfoModel.value
                                                  .data!.email ==
                                              null
                                          ? "No Data"
                                          : controller.profileInfoModel.value
                                              .data!.email,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          // Get.find<AuthService>()
                          //     .removeCurrentUser();
                          // Get.toNamed(Routes.SPLASHSCREEN);
                        },
                        child: Text(
                          "Log out",
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.redTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
