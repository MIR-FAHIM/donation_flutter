import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';

import 'package:path_provider/path_provider.dart';

import 'package:pdf/widgets.dart';

class BillPaymentPdf {
  static Future<File> generateCenteredText(
      dynamic _title,
      dynamic _images,
      dynamic _bllr_accno,
      dynamic _bll_no,
      dynamic _bll_mobno,
      dynamic _bll_dt_frm,
      dynamic _bll_dt_to,
      dynamic _bll_dt_due,
      dynamic charge,
      dynamic transaction_id,
      dynamic bll_amnt_ttl,
      dynamic payment_date) async {
    final pdf = Document();
    final _size = Get.size;
    pdf.addPage(Page(
      build: (context) => Center(
          // child:
          // Text(text, style: TextStyle(fontSize: 48)),
          child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image(
                          //   height: 40,
                          //   width: 50,
                          //   image: Network(_images),
                          // ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Text(_title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Bill Information : ",
                    style: TextStyle(
                        fontSize: 16,
                        // color: AppColors.homeTextColor1,
                        fontWeight: FontWeight.bold),
                  ),
                  _bll_no == null || _bll_no == ""
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bill No.",
                                style: const TextStyle(
                                  fontSize: 14,
                                  // color: AppColors.primaryColor,
                                ),
                              ),
                              Text(
                                _bll_no,
                                style: const TextStyle(
                                  fontSize: 14,
                                  // color: AppColors.homeTextColor3,
                                ),
                              ),
                            ],
                          ),
                        ),
                  _bllr_accno == null || _bllr_accno == ""
                      ? Container()
                      : Column(
                          children: [
                            Container(
                              width: Get.size.width,
                              height: 1,
                              // color: AppColors.SectionHighLightCardBg,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Biller Acc No.",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    _bllr_accno == null ? "" : _bllr_accno,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // color: AppColors.homeTextColor3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  _bll_mobno == null || _bll_mobno == ""
                      ? Container()
                      : Column(
                          children: [
                            Container(
                              width: _size.width,
                              height: 1,
                              // color: AppColors.SectionHighLightCardBg,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Biller Mobile No.",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    _bll_mobno == null ? "" : _bll_mobno,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // color: AppColors.homeTextColor3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  _bll_dt_frm == null || _bll_dt_frm == ""
                      ? Container()
                      : Column(
                          children: [
                            Container(
                              width: _size.width,
                              height: 1,
                              // color: AppColors.SectionHighLightCardBg,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Biller For",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // color: AppColors.primaryColor,
                                    ),
                                  ),
                                  // Text(
                                  //   _bll_dt_frm + " to " + _bll_dt_to,
                                  //   style: const TextStyle(
                                  //     fontSize: 14,
                                  //     // color: AppColors.homeTextColor3,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  _bll_dt_due == null || _bll_dt_due == ""
                      ? Container()
                      : Column(
                          children: [
                            Container(
                              width: _size.width,
                              height: 1,
                              // color: AppColors.SectionHighLightCardBg,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Bill Due Date",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    _bll_dt_due,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // color: AppColors.homeTextColor3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  Container(
                    width: _size.width,
                    height: 30,
                    // color: AppColors.SectionHighLightCardBg,
                  ),
                  Text(
                    "Transaction Information :",
                    style: TextStyle(
                        fontSize: 16,
                        // color: AppColors.homeTextColor1,
                        fontWeight: FontWeight.bold),
                  ),
                  transaction_id == null || transaction_id == ""
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transaction Id",
                                style: const TextStyle(
                                  fontSize: 14,
                                  // color: AppColors.primaryColor,
                                ),
                              ),
                              Text(
                                transaction_id,
                                style: const TextStyle(
                                  fontSize: 14,
                                  // color: AppColors.homeTextColor3,
                                ),
                              ),
                            ],
                          ),
                        ),
                  payment_date == null || payment_date == ""
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Payment Date",
                                style: const TextStyle(
                                  fontSize: 14,
                                  // color: AppColors.primaryColor,
                                ),
                              ),
                              Text(
                                payment_date == null ? "" : payment_date,
                                style: const TextStyle(
                                  fontSize: 14,
                                  // color: AppColors.homeTextColor3,
                                ),
                              ),
                            ],
                          ),
                        ),
                  charge == null || charge == ""
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Charge",
                                style: const TextStyle(
                                  fontSize: 14,
                                  // color: AppColors.primaryColor,
                                ),
                              ),
                              Text(
                                charge,
                                style: const TextStyle(
                                  fontSize: 14,
                                  // color: AppColors.homeTextColor3,
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
                          "Total Amount ",
                          style: const TextStyle(
                            fontSize: 14,
                            // color: AppColors.primaryColor,
                          ),
                        ),
                        Text(
                          bll_amnt_ttl,
                          style: const TextStyle(
                            fontSize: 14,
                            // color: AppColors.homeTextColor3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    ));
    return saveDocument(name: 'billPayment.pdf', pdf: pdf);
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    //await OpenFile.open(url);
  }
}
