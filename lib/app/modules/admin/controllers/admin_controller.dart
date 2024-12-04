import 'package:donation_flutter/app/model/all_donation_model.dart';
import 'package:donation_flutter/app/model/all_user_model.dart';
import 'package:donation_flutter/app/model/donation_project_model.dart';
import 'package:donation_flutter/app/model/get_bank_model.dart';
import 'package:donation_flutter/app/model/project_activity_list_model.dart';
import 'package:donation_flutter/app/modules/admin/views/all_user/add_donation_for_user_bank_form.dart';
import 'package:donation_flutter/app/modules/admin/views/all_user/add_donation_handcash.dart';
import 'package:donation_flutter/app/repository/auth_repository.dart';
import 'package:donation_flutter/app/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:donation_flutter/app/modules/settings/controllers/language_controller.dart';
import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:donation_flutter/common/ui.dart';


class AdminController extends GetxController {
  //TODO: Implement HomeController

  final refferanceController = TextEditingController().obs;
  final projectAmount = '0.0'.obs;
  var donationFormKey = GlobalKey<FormState>().obs;
  final bankNameController = TextEditingController().obs;
  final accountNumController = TextEditingController().obs;
  final routingController = TextEditingController().obs;
  final branchController = TextEditingController().obs;
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
  // final phoneController = TextEditingController().obs;
  final projectActivityList = <ActivityDatum>[].obs;
  final bankListProject = <DatumBank>[].obs;
  final status = false.obs;
  final projectData = DatumProject().obs;
  final packageName = "".obs;
  final userId = "".obs;
  final userName = "".obs;
  final donationProjectList = <DatumProject>[].obs;
  final userListDatum = <UserListDatum>[].obs;
  final allDonationList = <Transaction>[].obs;
  final allDonationListByProject = <Transaction>[].obs;
  final packageLoad = false.obs;
  final selectedProjectId = 0.obs;

  final AdBannerLoad = false.obs;
  final box = GetStorage().obs;
  final contactsResult = <Contact>[].obs;
  final paymentCollectionModel = <PaymentCollectModel>[].obs;
  List<Widget> tabScreenList = [
    AddDonationForUser(),
    AddDonationHandCash()
  ];
  @override
  void onInit() {
    print('HomeController.onInit');

    getAllUsers();
    allDonationsController();

    super.onInit();
  }

  Future refreshHome() async {}

  showPopup(context) {
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
                    Text("Add donation amount for this user"),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Get.theme.scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Container(
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
                          controller: amountController.value,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text("Cancel"),
                        InkWell(onTap: () {}, child: Text("Confirm Donation"))
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
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

  getProjectAmount(id) async {
    print("get getProjectAmount calle");

    HomeRepository().getProjectAmount(id).then((response) {
      projectAmount.value = response["data"]["amount"].toString();
      print("my getProjectAmount is ${projectAmount.value}");
    }).catchError((onError) {
      throw (onError);
    });
  }

  allDonationsController() async {
    print("get donation calle");

    HomeRepository().getAllDonations().then((response) {
      print("my donation list is $response");
      AllDonationModel data = AllDonationModel.fromJson(response);
      allDonationList.value = data.transactions!;
      print("my donations list is ${allDonationList.value.length}");
    }).catchError((onError) {
      throw (onError);
    });
  }

  getDonationListByProject(id) async {
    print("get donation called");

    HomeRepository().getDonationByProId(id).then((response) {
      print("my donation list from admin is $response");
      AllDonationModel data = AllDonationModel.fromJson(response);
      allDonationListByProject.value = data.transactions!;
      print(
          "my donations list from admin is ${allDonationListByProject.value.length}");
    }).catchError((onError) {
      throw (onError);
    });
  }

  getActivityList(id, page) async {
    print("get activity called");

    HomeRepository().getActivity(id).then((response) {
      print("my activity list is $response");
      ProjectActivityModel data = ProjectActivityModel.fromJson(response);
      projectActivityList.value = data.data!;
      print("my activity list is ${projectActivityList.value.length}");
      if (page == "add") {
        Get.toNamed(Routes.ACTIVITYLISTADMIN);
      }
    }).catchError((onError) {
      throw (onError);
    });
  }

  getProBankList(id, page) async {
    print("get getProBankList called");

    HomeRepository().getBank(id).then((response) {
      print("my getProBankList list is $response");
      GetBankModel data = GetBankModel.fromJson(response);
      bankListProject.value = data.data!;
      print("my getProBankList list is ${bankListProject.value.length}");
      if (page == "add") {
        Get.toNamed(Routes.BANK_LIST_ADMIN);
      }
    }).catchError((onError) {
      throw (onError);
    });
  }
  void sendEmail({String? amount, String? authority}) async {
    final MailOptions mailOptions = MailOptions(
      body: 'Dear  <br> We wanted to personally thank you for your generous donation of $amount. <br> Your support is making a significant impact, and we truly appreciate your commitment to our cause.Your contribution will help us continue our work and make a difference in the lives of many. <br> Thank you once again for your kindness and generosity.<br> Sincerely, <br> ',
      subject: 'Your Donation is Confirmed',
      recipients: ['mirfahim390@gmail.com'],
      isHTML: true,
      //bccRecipients: ['other@example.com'],
     // ccRecipients: ['third@example.com'],
   //   attachments: [ 'path/to/image.png', ],
    );

    final MailerResponse response = await FlutterMailer.send(mailOptions);
    print("mail response is $response");

  }
  changeDonationAmountForUser({

    String? projId,
    String? amount,
    String? account_name,
    String? account_num,
    String? user_name,
    String? ref,
    String? bankName,
  }) {
    Map data = {
      "bank_name": bankName,
      "account_name": account_name,
      "account_num": account_num,
      "user_id": userId.value,
      "user_name": userName.value,
      "project_id": projectData.value.id.toString(),
      "bank_trans_code": ref,
      "status": "1",
      "pay_way": "1",
      "amount": amount,
      "created_by":
          Get.find<AuthService>().currentUser.value.user!.id.toString(),
    };
    HomeRepository().changeDonateAmount(data).then((value) {
      if (value["status"] == 200) {
        Get.showSnackbar(
            Ui.SuccessSnackBar(message: value["message"], title: 'Success'.tr));
        getAllUsers();
        getProjectAmount(projectData.value.id.toString());
        getDonationListByProject(projectData.value.id.toString());
        Get.toNamed(Routes.PROJECTDASHBOARD);
      }
    });
  }

  registerController() {
    Map data = {
      'name': fullName.value.text,
      'email': emailController.value.text,
      'mobile': mobileController.value.text,
      'donate_amount': '0',
      "usertype": "user",
      "project_id": "0",
      'password': codeController.value.text,
      'country': countryController.value.text,
    };
    AuthRepository().userRegister(data).then((value) {
      if (value['status'] == 200) {
        getAllUsers();
        Get.toNamed(Routes.ALLUSER);
      } else {
        Get.showSnackbar(Ui.ErrorSnackBar(
            message: 'Something went wrong'.tr, title: 'Error'.tr));
      }
    });
  }

  addActivity() {
    Map data = {
      "project_name": projectData.value.projectName,
      "project_id": projectData.value.id.toString(),
      "title": titleController.value.text,
      "details": detailController.value.text,
      "cost": costController.value.text,
      //  "activity_image": "noimage",
    };
    HomeRepository().addActivity(data).then((value) {
      if (value["status"] == 200) {
        getActivityList(projectData.value.id.toString(), "add");
      }
    });
  }

  addBank() {
    Map data = {
      "bank_name": bankNameController.value.text,
      "account_name": accountNameController.value.text,
      "account_num": accountNumController.value.text,
      "branch": branchController.value.text,
      "route_no": routingController.value.text,
      "created_by":
          Get.find<AuthService>().currentUser.value.user!.id.toString(),
      "project_id": projectData.value.id.toString(),
      //  "activity_image": "noimage",
    };
    HomeRepository().addBank(data).then((value) {
      if (value["status"] == 200) {
        getProBankList(projectData.value.id.toString(), "add");
      }
    });
  }

  updateAmountAndTrsStatus({
    String? transid,
    String? amount,
  }) {
    Map data = {
      "amount": amount,
      "transaction_id": transid,
    };
    HomeRepository().updateAmountAndTrsStatus(data).then((value) {
      if (value["status"] == 200) {
        getProjectAmount(selectedProjectId.value);
        allDonationsController();
        getAllUsers();
        Get.toNamed(Routes.PROJECTDASHBOARD);
      }
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
