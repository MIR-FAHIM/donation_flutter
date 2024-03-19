import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/electricity/bpdb_fetch_model.dart';
import 'package:latest_payplus_agent/app/modules/bill_payment/controllers/bill_form_controller.dart';
import 'package:latest_payplus_agent/app/modules/bill_payment/controllers/bill_payment_controller.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/text_field_widget.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class BPDBPrepaidFormView extends GetView {
  BillFormController billformController = Get.put(BillFormController());
  BillPaymentController billpaymentController =
      Get.put(BillPaymentController());
  @override
  Widget build(BuildContext context) {
    var _title = Get.arguments['title'];
    var _images = Get.arguments['images'];
    final _size = Get.size;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: PreferredSize(
          preferredSize: Size(65, 65),
          child: AppBar(
            backgroundColor: Color(0xFF652981),
            centerTitle: true,
            title: Text("$_title".tr),
            elevation: 0,
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //         CupertinoIcons.bell,
            //         color: Colors.white70,
            //       )),
            // ],
          ),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: _size.width,
            height: _size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$_title'.tr,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF652981),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            height: 40,
                            width: 50,
                            image: NetworkImage(_images == null
                                ? "https://shl.com.bd/uploads/billers/dwasa.png"
                                : _images),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(_title),
                        ],
                      ),
                    ),
                  ),
                  TextFieldWidget(
                    onChanged: (value) {
                      billformController.meterNo.value = value;
                    },
                    labelText: "Meter Number".tr,
                    hintText: "Enter Meter Number".tr,
                    // onSaved: (input) =>
                    // controller.currentUser.value.email = input,
                    // validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
                    iconData: null,
                    imageData: 'assets/bill/account.png',
                  ),
                  TextFieldWidget(
                    onChanged: (value) {
                      billformController.amount.value = value;
                    },
                    labelText: "Recharge Amount".tr,
                    hintText: "Enter Recharge Amount".tr,
                    keyboardType: TextInputType.number,
                    // onSaved: (input) =>
                    // controller.currentUser.value.email = input,
                    // validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
                    iconData: null,
                    imageData: 'assets/collection/2.png',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    onChanged: (value) {
                      billformController.mobile.value = value;
                    },
                    labelText: "Mobile No".tr,
                    hintText: "Enter Mobile No.".tr,
                    keyboardType: TextInputType.number,

                    // onSaved: (input) =>
                    // controller.currentUser.value.email = input,
                    // validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
                    iconData: CupertinoIcons.device_phone_portrait,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlockButtonWidget(
                    onPressed: () {
                      //acc num - 21000135
                      //meter - 66110007244
                      //

                      var result;
                      var data;
                      var bill_ref;
                      var datas;

                      if (billformController.amount.value.isNotEmpty &&
                          billformController.meterNo.value.isNotEmpty) {
                        var res = getBillDetail(
                          meterNo: billformController.meterNo.value,
                          amount: billformController.amount.value,
                          mobileNo: billformController.mobile.value,
                        );
                        Ui.customLoaderDialog();
                        res.then((value) => {
                              Get.back(),
                              result = value['result'],
                              print("hle bro+++++++ ${value['result']}"),
                              if (value['result'] == 'success')
                                {
                                  billformController.fetchBpdbModel.value =
                                      FetchBpdbModel.fromJson(value),
                                  print(
                                      "hlw model ${billformController.fetchBpdbModel.value.result}"),
                                  billpaymentController
                                      .billPaymentChargePreview(
                                    bill_payment_id: billformController
                                        .fetchBpdbModel
                                        .value
                                        .billRef!
                                        .billPaymentId.toString(),
                                    bill_refer_id: billformController
                                        .fetchBpdbModel
                                        .value
                                        .billRef!
                                        .billReferId.toString(),
                                  ),
                                  Get.toNamed(Routes.BPDBBILLVIEW, arguments: [
                                    billformController.fetchBpdbModel.value,
                                    _title,
                                    _images
                                  ]),
                                }
                              else
                                {
                                  Get.showSnackbar(Ui.ErrorSnackBar(
                                      message: value['message'],
                                      title: 'Error'.tr))
                                }
                            });
                      } else {
                        Get.showSnackbar(Ui.ErrorSnackBar(
                            message: "Fill all the field", title: 'Failed'.tr));
                      }
                    },
                    color: Color(0xFF652981),
                    text: Text(
                      "SHOW BILL".tr,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ).paddingSymmetric(vertical: 10, horizontal: 20),
                ],
              ),
            ),
          ),
        ));
  }

  Future<Map<String, dynamic>> getBillDetail(
      {String? meterNo, String? mobileNo, String? amount}) async {
    print(meterNo);
    print(amount);

    Map data = {
      // "33041338", //
      'meter_no': meterNo,

      'biller_mobile_no': mobileNo,
      "amount": amount,
    };
    print("my bpdb data is $data");
    String token = Get.find<AuthService>().currentUser.value.token!;

    var headers = {'token': token};
    // var headers = {'token': 'IMBkVG1UFCE8VABPg5TI14yY44StEfWqF341OAlh'};

    var url = 'https://shl.com.bd/api/appapi/billpay/fetch/bpdb-prepaid';

    // var body = json.encode(data);
//880961763331
    var response =
        await http.post(Uri.parse(url), headers: headers, body: data);
    var resp = json.decode(response.body);
    print('Bill Detail : $resp');
    return resp;
  }
}
