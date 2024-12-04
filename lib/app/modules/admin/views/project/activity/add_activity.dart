// import 'dart:html';

import 'dart:io';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_flutter/app/modules/admin/controllers/admin_controller.dart';
import 'package:donation_flutter/app/modules/global_widgets/block_button_widget.dart';
import 'package:donation_flutter/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:donation_flutter/app/modules/home/views/homepage_listing_profile_widget.dart';
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

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class AddActivity extends GetView<AdminController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: RechargeDrawer(),
      endDrawer: MainDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text("Add Activity"),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Add Activity for",
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColors.textColorBlack,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Title".tr,
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textColorBlack,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    maxLines: 1,
                    controller: controller.titleController.value,
                    decoration: InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      focusColor: Colors.white,

                      // suffixIcon: Icon(
                      //   Icons.email_outlined,
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.textColorBlack, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.textColorBlack, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Details".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: TextFormField(
                          onTapOutside: (context) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: controller.detailController.value,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: "",
                            // hintStyle: TextStyle(
                            //   fontSize: 24,
                            //   color: Colors.grey,
                            //   fontWeight: FontWeight.w500,
                            //   fontFamily: "Unineue",
                            // ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cost".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 14,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: TextFormField(
                          onTapOutside: (context) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: controller.costController.value,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: "",
                            // hintStyle: TextStyle(
                            //   fontSize: 24,
                            //   color: Colors.grey,
                            //   fontWeight: FontWeight.w500,
                            //   fontFamily: "Unineue",
                            // ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlockButtonWidget(
                    onPressed: () {
                      controller.addActivity();
                    },
                    color: AppColors.primaryColor,
                    text: Text(
                      "Add Activity".tr,
                      style: Get.textTheme.headline6!
                          .merge(const TextStyle(color: Colors.white)),
                    ),
                  ).paddingSymmetric(vertical: Get.width * .04, horizontal: 20),
                ],
              ),
            ),
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
