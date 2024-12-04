import 'package:donation_flutter/app/model/all_donation_model.dart';
import 'package:donation_flutter/app/model/all_user_model.dart';
import 'package:donation_flutter/app/model/donation_project_model.dart';
import 'package:donation_flutter/app/model/get_bank_model.dart';
import 'package:donation_flutter/app/model/get_review_model.dart';
import 'package:donation_flutter/app/model/project_activity_list_model.dart';
import 'package:donation_flutter/app/model/project_image_model.dart';
import 'package:donation_flutter/app/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:donation_flutter/app/modules/settings/controllers/language_controller.dart';

import 'package:new_version_plus/new_version_plus.dart';
import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:donation_flutter/common/ui.dart';
import 'package:donation_flutter/main.dart';
import 'package:donation_flutter/service/shared_pref.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final projectAmount = '0.0'.obs;
  final phoneController = TextEditingController().obs;
  final outletNameController = TextEditingController().obs;
  final bankNameController = TextEditingController().obs;
  final accountNumController = TextEditingController().obs;
  final routingController = TextEditingController().obs;
  final branchController = TextEditingController().obs;
  final refferanceController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final accountNameController = TextEditingController().obs;
  final userNameController = TextEditingController().obs;
  final titleController = TextEditingController().obs;
  final detailController = TextEditingController().obs;
  final costController = TextEditingController().obs;
  final amountController = TextEditingController().obs;
  final codeController = TextEditingController().obs;

  final fullName = TextEditingController().obs;
  final mobileController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final ownerController = TextEditingController().obs;
  final reviewController = TextEditingController().obs;

  // final phoneController = TextEditingController().obs;
  // final phoneController = TextEditingController().obs;
  final status = false.obs;
  final projectData = DatumProject().obs;
  final packageName = "".obs;
  final ratingNum = 0.0.obs;
  final selectPayWay = "".obs;
  final donationProjectList = <DatumProject>[].obs;
  final reviewList = <DatumReview>[].obs;
  final donationByUserList = <Transaction>[].obs;
  final userListDatum = <UserListDatum>[].obs;
  final projectImages = <DatumImg>[].obs;
  final bankList = <DatumBank>[].obs;
  final datumBank = DatumBank().obs;
  final projectActivityList = <ActivityDatum>[].obs;
  final packageLoad = false.obs;
  final ownerName = "".obs;

  final AdBannerLoad = false.obs;
  final box = GetStorage().obs;
  final contactsResult = <Contact>[].obs;
  final paymentCollectionModel = <PaymentCollectModel>[].obs;

  @override
  void onInit() {
    advancedStatusCheck();
    print('HomeController.onInit');
    getDonationProjectList();

    super.onInit();
  }

  Future refreshHome() async {}
  advancedStatusCheck() async {
    final newVersion = NewVersionPlus(
      //iOSId: 'com.google.Vespa',
      androidId: 'donation.com.bd',
    );
    var status = await newVersion.getVersionStatus();
    print("version status ${status!.appStoreLink}");
    if (status.canUpdate == true) {
      print("update av");
      newVersion.showUpdateDialog(
        // launchMode: LaunchMode.externalApplication,
        context: Get.context!,
        versionStatus: status,
        dialogTitle: 'Update Available!',
        dialogText: 'Upgrade  ${status.localVersion} to ${status.storeVersion}',
      );
    }
  }

  getProjectAmount(id) async {
    print("get getProjectAmount calle");

    HomeRepository().getProjectAmount(id).then((response) {
      projectAmount.value = response["data"]["amount"].toString();
      print("my getProjectAmount is ${projectAmount.value}");
    }).catchError((onError) {
      throw (onError);
    });
  }

  addDonationByUser({
    String? userID,
    String? username,
    String? projId,
    String? amount,
  }) {
    Map data = {
      "bank_name": bankNameController.value.text,
      "account_name": accountNameController.value.text,
      "account_num": accountNumController.value.text,
      "user_id": userID.toString(),
      "user_name": username,
      "project_id": projectData.value.id.toString(),
      "bank_trans_code": refferanceController.value.text,
      "status": "0",
      "pay_way": selectPayWay.value,
      "amount": amount,
      "created_by":
          Get.find<AuthService>().currentUser.value.user!.id.toString(),
    };
    HomeRepository().addDonationByUser(data).then((value) {
      if (value["status"] == 200) {
        Get.showSnackbar(Ui.SuccessSnackBar(
            message:
                'Thank you for your donation, our admin will confirm this donation soon.'
                    .tr,
            title: 'Success'.tr));
        Get.toNamed(Routes.SUCCESS);
      }
    });
  }

  addReview() {
    Map data = {
      "project_name": projectData.value.projectName,
      "email": Get.find<AuthService>().currentUser.value.user!.email.toString(),
      "message": reviewController.value.text,
      "mobile":
          Get.find<AuthService>().currentUser.value.user!.mobile.toString(),
      "project_id": projectData.value.id.toString(),
      "user_id": Get.find<AuthService>().currentUser.value.user!.id.toString(),
      "star": ratingNum.value.toString(),
    };
    HomeRepository().addReview(data).then((value) {
      if (value["status"] == 200) {
        Get.showSnackbar(Ui.SuccessSnackBar(
            message:
                'Thank you for your donation, our admin will confirm this donation soon.'
                    .tr,
            title: 'Success'.tr));

        getReview(projectData.value.id.toString());
      }
    });
  }

  addImageController() {
    Map data = {
      "project_name": projectData.value.projectName,
      "email": Get.find<AuthService>().currentUser.value.user!.email.toString(),
      "message": reviewController.value.text,
      "mobile":
          Get.find<AuthService>().currentUser.value.user!.mobile.toString(),
      "project_id": projectData.value.id.toString(),
      "user_id": Get.find<AuthService>().currentUser.value.user!.id.toString(),
      "star": ratingNum.value.toString(),
    };
    HomeRepository().addReview(data).then((value) {
      if (value["status"] == 200) {
        Get.showSnackbar(Ui.SuccessSnackBar(
            message:
                'Thank you for your donation, our admin will confirm this donation soon.'
                    .tr,
            title: 'Success'.tr));

        getReview(projectData.value.id.toString());
      }
    });
  }

  getDonationProjectList() async {
    print("get donation calle");

    HomeRepository().getDonationProjectList().then((response) {
      print("my donation project list is $response");
      DonationProjectListModel data =
          DonationProjectListModel.fromJson(response);
      donationProjectList.value = data.data!;
      print("my donation project list is ${donationProjectList.value.length}");
    }).catchError((onError) {
      throw (onError);
    });
  }

  getReview(id) async {
    print("get review called");

    HomeRepository().getReview(id).then((response) {
      print("get review called $response");
      if (response["status"] == 200) {
        print("my review list is $response");
        GetReviewModel data = GetReviewModel.fromJson(response);
        reviewList.value = data.data!;
        print("my review list is ${reviewList.value.length}");
        Get.toNamed(Routes.REVIEWLIST);
      } else {
        Get.toNamed(Routes.ADDREVIEW);
      }
    }).catchError((onError) {
      throw (onError);
    });
  }

  getBankList(id) async {
    print("get getProBankList called");

    HomeRepository().getBank(id).then((response) {
      print("my getProBankList list is $response");
      GetBankModel data = GetBankModel.fromJson(response);
      bankList.value = data.data!;
      print("my getProBankList list is ${bankList.value.length}");
      Get.toNamed(Routes.PAYMENTWAY);
    }).catchError((onError) {
      throw (onError);
    });
  }

  getActivityList(id) async {
    print("get activity called");

    HomeRepository().getActivity(id).then((response) {
      print("my activity list is $response");
      ProjectActivityModel data = ProjectActivityModel.fromJson(response);
      projectActivityList.value = data.data!;
      print("my activity list is ${projectActivityList.value.length}");
    }).catchError((onError) {
      throw (onError);
    });
  }

  getUserDonationListById(id) async {
    print("get donation called");

    HomeRepository().getUserDonationListById(id).then((response) {
      print("my donation list is $response");
      AllDonationModel data = AllDonationModel.fromJson(response);
      donationByUserList.value = data.transactions!;
      print("my donation  list is ${donationByUserList.value.length}");
      Get.toNamed(Routes.USERDONATIONBYID);
    }).catchError((onError) {
      Get.showSnackbar(Ui.ErrorSnackBar(
          message: 'Something went wrong'.tr, title: 'Error'.tr));
      throw (onError);
    });
  }

  getAllUsers() async {
    print("get donation calle");

    HomeRepository().getAllUser().then((response) {
      print("my user list is $response");
      AllUserListModel data = AllUserListModel.fromJson(response);
      userListDatum.value = data.data!;
      print("my user list is ${userListDatum.value.length}");
    }).catchError((onError) {
      throw (onError);
    });
  }

  showClaimList(context) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Container(
          height: Get.height * .4,
          child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              //title: Text('Select '),
              content: Container(
                height: Get.height * .4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/social/images/knowledge_black.png"),
                                fit: BoxFit.cover)),
                      ),
                      title: Text(
                        "Informative",
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/social/images/read.png"),
                                fit: BoxFit.cover)),
                      ),
                      title: Text(
                        "Readable",
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/social/images/power.png"),
                                fit: BoxFit.cover)),
                      ),
                      title: Text(
                        "Impact",
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                      ),
                    ),
                    ListTile(
                      leading: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/social/images/fire_black.png"),
                                fit: BoxFit.cover)),
                      ),
                      title: Text(
                        "Burnt it",
                        style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }

  getProjectImages(id) async {
    print("get image called");
    projectImages.value.clear();
    HomeRepository().getProjectImages(id).then((response) {
      print("my project images list is $response");
      GetProjectImagesModel data = GetProjectImagesModel.fromJson(response);
      projectImages.value = data.data!;
      print("my project images list is ${projectImages.value.length}");
      print("my project images is ${projectImages.value[0].imageUrl}");
    }).catchError((onError) {
      throw (onError);
    });
  }

  getLanguageSwitch() {
    if (Get.find<LanguageController>().locale.value == 'en_US') {
      status.value = true;
    } else {
      status.value = false;
    }
  }

  getPhoneContact() async {
    box.value.remove('contact');
    if (await FlutterContacts.requestPermission()) {
      // Get all contacts (lightly fetched)
      List<Contact> contacts = await FlutterContacts.getContacts();

      // Get all contacts (fully fetched)
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);

      // Get contact with specific ID (fully fetched)

      print("my all contact are $contacts");

      contactsResult.value = contacts;
      await box.value.write('contact', contactsResult);
      print("hlw bro ***********************${GetStorage().read('contact')}");
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }
}

class PaymentCollectModel {
  String? title;
  String? amount;
  String? totalUser;
  PaymentCollectModel({this.amount, this.title, this.totalUser});
}
