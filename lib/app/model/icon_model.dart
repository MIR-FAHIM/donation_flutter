import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IconModel {
  String? title;
  String? image;
  VoidCallback? press;

  IconModel({this.title, this.image, this.press});
}

List<IconModel> iconButtonData = [
  IconModel(
      title: 'All Donation',
      image: "assets/icons/charity.png",
      press: () {
        Get.toNamed(Routes.ALLDONATIONLISTBYPRO);
      }),
  IconModel(
      title: 'All Activity',
      image: "assets/icons/activity.png",
      press: () {
        Get.toNamed(Routes.ACTIVITYLISTADMIN);
      }),
  IconModel(title: 'Gallary', image: "assets/icons/gallary.png", press: () {}),
  // IconModel(
  //     title: 'Add Balance',
  //     image: "assets/images/list.png",
  //     press: () {
  //       Get.toNamed(Routes.Add_Balance_Dashboard_View);
  //     }),

  IconModel(
      title: 'Add User',
      image: "assets/icons/avatar.png",
      press: () {
        Get.toNamed(Routes.ADDUSER);
      }),
  IconModel(
      title: 'Add Bank',
      image: "assets/icons/bank.png",
      press: () {
        Get.toNamed(Routes.BANK_LIST_ADMIN);
      }),
  IconModel(
      title: 'Edit Project', image: "assets/icons/edit.png", press: () {}),
];
