// import 'dart:html';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:donation_flutter/app/api_providers/api_url.dart';
import 'package:donation_flutter/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:donation_flutter/app/modules/home/views/homepage_listing_profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/custom_data.dart';
import 'package:donation_flutter/common/ui.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeView extends GetView<HomeController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      // Disable back press dialog on the web since browsers handle this.
      if (kIsWeb) {
        return Future.value(true);
      } else {
        final value = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text('Are you sure you want to exit?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );
        return value == true;
      }
    }, child: Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        endDrawer: MainDrawerWidget(),
        appBar: PreferredSize(
          preferredSize: const Size(65, 65),
          child: AppBar(
            backgroundColor: AppColors.primaryColor,
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: Text("Find Project"),
            elevation: 0,
          ),
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Get.toNamed(Routes.WELCOME, arguments: [0]);
                },
                title: Text("Donate for humanity"),
                subtitle: Text("Check how we collect donations."),
                trailing: Icon(Icons.warning_rounded),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              // Use Expanded instead of SizedBox for better layout adaptation
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.donationProjectList.value.length,
                itemBuilder: (BuildContext context, index) {
                  var data = controller.donationProjectList.value[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.projectData.value = data;
                            controller.getProjectImages(data.id);
                            controller.getActivityList(data.id);
                            controller.getProjectAmount(data.id);
                            Get.toNamed(Routes.DETAILS);
                          },
                          child: Container(
                            height: kIsWeb
                                ? Get.height * .3
                                : MediaQuery.of(context).size.height * .2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: Colors.transparent, width: 2),
                              color: AppColors.primaryColor,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: "${ApiClient.baseUrl}${data.image}",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(4),
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
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.projectData.value = data;
                            controller.getProjectImages(data.id);
                            controller.getActivityList(data.id);
                            controller.getProjectAmount(data.id);
                            Get.toNamed(Routes.DETAILS);
                          },
                          child: HomePageListingProfileWidget(
                            review: ["1", "2"],
                            title: data.projectName!,
                            listingType: "listingType",
                            guestNum: "1",
                            description: data.details!,
                            bedNum: "1",
                            fullDayPriceSetByUser: "1",
                            listingAddress: data.address!,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }));
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
