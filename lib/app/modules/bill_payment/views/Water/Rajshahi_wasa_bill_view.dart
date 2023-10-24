import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';

class RajshahiWasaBillView extends GetView {
  @override
  Widget build(BuildContext context) {
    final _size = Get.size;
    var _title = Get.arguments['title'];
    var _images = Get.arguments['images'];
    var _bll_no = Get.arguments['bll_no'];

    var _bll_typ = Get.arguments['bll_typ'];

    var _bll_amnt = Get.arguments['bll_amnt'];
    var bll_vat = Get.arguments['bll_vat'];
    var bll_amnt_ttl = Get.arguments['bll_amnt_ttl'];
    var is_bll_pd = Get.arguments['is_bll_pd'];
    var ekpay_fee = Get.arguments['ekpay_fee'];
    var bllr_id = Get.arguments['bllr_id'];

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: PreferredSize(
          preferredSize: Size(65, 65),
          child: AppBar(
            backgroundColor: Color(0xFF652981),
            centerTitle: true,
            title: Text(_title),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Get.offAllNamed(Routes.BILL_PAYMENT),
            ),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     _title,
              //     style: TextStyle(
              //       fontSize: 18,
              //       color: Color(0xFF652981),
              //     ),
              //   ),
              // ),
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
                        image: NetworkImage(_images),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(_title),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bill No.",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            _bll_no,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.homeTextColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _size.width,
                      height: 1,
                      color: AppColors.SectionHighLightCardBg,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Biller Type",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            _bll_typ == "M" ? "Meter" : "Non Meter",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.homeTextColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _size.width,
                      height: 1,
                      color: AppColors.SectionHighLightCardBg,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Biller Id",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            bllr_id,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.homeTextColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _size.width,
                      height: 1,
                      color: AppColors.SectionHighLightCardBg,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bill Paid Status",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            is_bll_pd == 'N' ? "Not Paid" : "Paid",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.homeTextColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _size.width,
                      height: 15,
                      // color: AppColors.SectionHighLightCardBg,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bill Amount",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            _bll_amnt,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.homeTextColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Vat",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            bll_vat,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.homeTextColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ekpay Fee",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            ekpay_fee.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.homeTextColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _size.width,
                      height: 1,
                      color: AppColors.SectionHighLightCardBg,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total : ",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.homeTextColor1,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            bll_amnt_ttl,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.homeTextColor3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BlockButtonWidget(
                onPressed: () {
                  // var result;
                  // var data;
                  // print(bill_number);
                  // var res = getBillDetail(bill_number);
                  // Ui.customLoaderDialog();
                  // res.then((value) => {
                  //       Get.back(),
                  //       result = value['result'],
                  //       data = value['data'],
                  //       if (value['result'] == 'success')
                  //         {
                  //           Ui.SuccessSnackBar(message: value['result']),
                  //           print(data['bllr_accno'])
                  //         }
                  //       else
                  //         Get.showSnackbar(Ui.ErrorSnackBar(
                  //             message: value['message'], title: 'error'.tr))
                  //     });
                },
                color: Color(0xFF652981),
                text: Text(
                  "Pay Bill".tr,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ).paddingSymmetric(vertical: 10, horizontal: 20),
            ],
          ),
        ));
  }

  // Future<Map<dynamic, dynamic>> getBillDetail(String billNumber) async {
  //   print(billNumber);
  //   Map data = {
  //     'bill_no': billNumber,
  //   };

  //   var url = 'https://shl.com.bd/api/appapi/billpay/fetch/desco-postpaid';

  //   // var body = json.encode(data);

  //   var response = await http.post(Uri.parse(url),
  //       headers: {"token": "fixedTokenForSahedToTestEkpayBill"}, body: data);
  //   var resp = json.decode(response.body);
  //   print('Bill Detail : $resp');
  //   return resp;
  // }
}
