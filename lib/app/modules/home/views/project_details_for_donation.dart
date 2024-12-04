// import 'dart:html';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_flutter/app/api_providers/api_url.dart';
import 'package:donation_flutter/app/modules/admin/controllers/admin_controller.dart';
import 'package:donation_flutter/app/modules/global_widgets/block_button_widget.dart';
import 'package:donation_flutter/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:donation_flutter/app/modules/home/views/cells/detail_cell.dart';
import 'package:donation_flutter/app/modules/home/views/cells/new_cell_gallary.dart';
import 'package:donation_flutter/app/modules/home/views/homepage_listing_profile_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:donation_flutter/app/services/facebook_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/custom_data.dart';
import 'package:donation_flutter/common/ui.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProjectDetails extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var data = controller.projectData.value;

    // Web-specific layout or mobile-specific layout logic
    bool isWeb = kIsWeb;
    double imageHeight = isWeb
        ? MediaQuery.of(context).size.height * .45 // Larger height for web
        : MediaQuery.of(context).size.height * .32; // Smaller height for mobile

    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MainDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: !isWeb, // Disable leading icon on web
          centerTitle: false,
          title: Text("Project Details"),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 32),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: imageHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(color: Colors.transparent, width: 2),
                        color: AppColors.primaryColor,
                      ),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          onPageChanged: (i, reason) {},
                          padEnds: false,
                          viewportFraction: 1.0,
                          height: imageHeight,
                        ),
                        items: controller.projectImages.map<Widget>((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.transparent,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: "${ApiClient.baseUrl}${i.imageUrl}",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(0),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Image(
                                      image: AssetImage(
                                        'assets/images/charity.png',
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/charity.png',
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isWeb ? 100 : 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.projectName!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: 4),
                        Text(
                          data.address!,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 14,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              data.mobile!,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              size: 14,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              data.email!,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.verified_user,
                              size: 14,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              data.authority!,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.map,
                              size: 14,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              data.website!,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        border:
                            Border.all(color: AppColors.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Motive'.tr,
                        style: TextStyle(
                          color: AppColors.softBrwn,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.2),
                        border:
                            Border.all(color: AppColors.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        data.motive!,
                        style: TextStyle(
                          color: AppColors.textColorBlack,
                          fontSize: isWeb ? 16 : 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 91,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.toNamed(Routes.GALLARY);
                              },
                              child: DetailCellGallary(
                                  image: 'assets/icons/gallary.png',
                                  subTitle: 'Gallary'.tr)),
                          InkWell(
                              onTap: () {
                                controller
                                    .getReview(controller.projectData.value.id);
                              },
                              child: DetailCellGallary(
                                  image: 'assets/icons/gallary.png',
                                  subTitle: 'Review'.tr)),
                          DetailCellGallary(
                              image: 'assets/icons/gallary.png',
                              subTitle: 'Trusted By'.tr),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        border:
                            Border.all(color: AppColors.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Who Will Get Help By You'.tr,
                        style: TextStyle(
                          color: AppColors.softBrwn,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(.2),
                        border:
                            Border.all(color: AppColors.primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        data.whoGetHelp!,
                        style: TextStyle(
                          color: AppColors.textColorBlack,
                          fontSize: isWeb ? 16 : 11,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      data.details!,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: isWeb ? 16 : 11,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 91,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailCell(
                              title: '${controller.projectAmount.value} Tk',
                              subTitle: 'Raised'.tr),
                          InkWell(
                              onTap: () {
                                Get.toNamed(Routes.ACTIVITYLIST);
                              },
                              child: DetailCell(
                                  title: controller
                                      .projectActivityList.value.length
                                      .toString(),
                                  subTitle: 'Activity'.tr)),
                          DetailCell(title: '4273', subTitle: 'Viewed'.tr),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BlockButtonWidget(
                      onPressed: () {
                        Get.toNamed(Routes.PRODECURE);
                      },
                      color: AppColors.primaryColor,
                      text: Text(
                        "Add A Donation".tr,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class ProfileImage extends StatefulWidget {
  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  PickedFile? imageFile = null;

  String? _imagepath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LoadImage();
  }

  // void _openCamera(BuildContext context) async {
  //   final pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 600,
  //   );

  //   // Ui.customLoaderDialog();

  //   setState(() {
  //     imageFile = pickedFile!;
  //   });

  //   if (pickedFile != null) {
  //     SharedPreferences saveimage = await SharedPreferences.getInstance();
  //     saveimage.setString("imagepath", imageFile!.path);
  //     print("save");
  //   }
  // }

  Future<void> PickImage(String type) async {
    // await DeleteIamge();
    var pickedFile = await ImagePicker().getImage(
      source: type == 'camera' ? ImageSource.camera : ImageSource.gallery,
    );
    // Ui.customLoaderDialog();
    setState(() {
      imageFile = pickedFile!;
    });
    SaveImage();
    await LoadImage();
  }

  Future<void> SaveImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagepath", imageFile!.path);
  }

  Future<void> LoadImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      _imagepath = saveimage.getString("imagepath");
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showPopup(context);
      },
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: _imagepath != null
              ? ClipOval(
                  child: Image.file(
                  File(_imagepath!),
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ))
              : (imageFile == null)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://thumbs.dreamstime.com/b/default-avatar-profile-flat-icon-vector-contact-symbol-illustration-184752213.jpg',
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
                            image: AssetImage('assets/images/user2.png'),
                          ),
                        ),
                        errorWidget: (context, url, error) => const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Image(
                            image: AssetImage('assets/images/user2.png'),
                          ),
                        ),
                      ),
                    )
                  : ClipOval(
                      child: Image.file(
                      File(_imagepath!),
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ))),
    );
  }

  showPopup(context) {
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
                      leading: const Icon(Icons.photo_library),
                      title: Text('Photo Library'.tr),
                      onTap: () {
                        PickImage('photo');
                        Get.back();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Camera'.tr),
                    onTap: () {
                      PickImage('camera');
                      Get.back();
                    },
                  ),
                ],
              ),
            )
            // actions: <Widget>[

            // ],
            );
      },
    );
  }
}
