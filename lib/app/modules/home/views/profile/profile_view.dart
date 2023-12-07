import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badges/badges.dart' as badges;
import 'package:latest_payplus_agent/app/modules/home/controllers/home_controller.dart';
import 'package:latest_payplus_agent/app/modules/inbox/controllers/inbox_controller.dart';
import 'package:latest_payplus_agent/app/modules/recharge/controllers/recharge_controller.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class ProfileView extends GetView<HomeController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: const Color(0xFF652981),
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text("Profile"),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: InkWell(
                          onTap: () {
                            //showPopup(context, 'cover');
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(
                                    MediaQuery.of(context).size.width * 0.5,
                                    100.0),
                                bottomRight: Radius.elliptical(
                                    MediaQuery.of(context).size.width * 0.5,
                                    100.0),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/banner.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.verified_user,
                                size: 30,
                                color: Get.find<AuthService>()
                                            .currentUser
                                            .value
                                            .kyc_status ==
                                        "none"
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showPopup(context, 'profile');
                              },
                              child: CircleAvatar(
                                radius: 70,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/jayga_logo.png',
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/jayga_logo.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: badges.Badge(
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
                                      Get.find<InboxController>()
                                          .removeNewMsgNum();
                                      Get.toNamed(Routes.Notification_View);
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.bell_fill,
                                      color: Colors.green,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title:   Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle:   Text(
                    "Mobile",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Divider(),
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
                        ? Get.height * .1
                        : Get.height * .1,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      height: Get.height * .1,
                      width: MediaQuery.of(context).size.width,
                      child: Get.find<AuthService>()
                                  .currentUser
                                  .value
                                  .kyc_status ==
                              "nne"
                          ? Container()
                          : Get.find<AuthService>()
                                      .currentUser
                                      .value
                                      .kyc_status ==
                                  "none"
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
                                        decoration:
                                            Ui.getBoxDecoration(radius: 5.0),
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    child: ListView(
                      children: [
                        Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            //   Get.toNamed(Routes.PROFILEDETAIL);
                          },
                          child: Container(
                            height: 40,
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Personal information"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            // Get.to(PaymentWeb(
                            //   appBar: "Payments and Payouts",
                            //   url: "https://jayga.io/refund.html",
                            // ));
                          },
                          child: Container(
                            height: 40,
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Account Settings"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            // Get.to(PaymentWeb(
                            //   appBar: "Payments and Payouts",
                            //   url: "https://jayga.io/refund.html",
                            // ));
                          },
                          child: Container(
                            height: 40,
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Payment Settings"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            //   Get.toNamed(Routes.HOSTPROFILESETTING);
                          },
                          child: ListTile(
                            leading: Icon(Icons.settings),
                            title: Text("Privacy and Security"),
                            trailing: Icon(Icons.navigate_next),
                          ),
                        ),
                        Text(
                          "Support",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            //   controller.makePhoneCall("01764314845");
                          },
                          child: Container(
                            height: 40,
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Get help"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            // PaymentWeb(
                            //   appBar: "Terms and Condition",
                            //   url:
                            //   "https://jayga.io/terms_conditions.html",
                            // );
                          },
                          child: Container(
                            height: 40,
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Terms of Service"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () {
                            // PaymentWeb(
                            //   appBar: "Privacy and Sahring",
                            //   url:
                            //   "https://jayga.io/privacy_policy.html",
                            // );
                          },
                          child: Container(
                            height: 40,
                            child: ListTile(
                              leading: Icon(Icons.settings),
                              title: Text("Privacy Policy"),
                              trailing: Icon(Icons.navigate_next),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
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
                      ],
                    ),
                  ),
                ),
              ],
            )
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
