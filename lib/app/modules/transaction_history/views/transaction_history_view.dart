import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaction_history_controller.dart';

class TransactionHistoryView extends GetView<TransactionHistoryController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF652981),
        title: Text('Transaction History'.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: _size.width * .3,
                    width: _size.width,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Enter Mobile No/ Transaction ID'.tr,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 35.0, top: 5),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/user.png',
                                        height: 50,
                                        width: 50,
                                        color: Color(0xFF652981),
                                      ),
                                      Container(
                                        width: _size.width * .4,
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          initialValue: '',
                                          onChanged: (input) {},
                                          validator: (input) => input!.length <
                                                  11
                                              ? 'Please provide valid phone number'
                                                  .tr
                                              : null,
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xFF652981),
                                          ),
                                          obscureText: false,
                                          textAlign: TextAlign.start,
                                          cursorColor: Color(0xFF652981),
                                          decoration: InputDecoration(
                                            hintText: '01xxxxxxxxx',
                                            hintStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey,
                                            ),
                                            focusColor: Color(0xFF652981),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      size: 30,
                                      color: Color(0xFF652981),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              Obx(() {
                if (controller.transactionReportLoaded.isTrue) {
                  print('transaction view: ${controller.transactionReport}');
                  return Column(
                    children: List.generate(controller.transactionReport.length,
                        (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: Container(
                            //height: _size.width * .2,
                            width: _size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Expanded(
                                  //   flex: 3,
                                  //   child: Row(
                                  //     children: [
                                  //       Container(
                                  //         decoration: BoxDecoration(
                                  //           color: Colors.grey.shade100,
                                  //           borderRadius:
                                  //               BorderRadius.circular(50),
                                  //         ),
                                  //         child: Padding(
                                  //           padding: const EdgeInsets.all(8.0),
                                  //           child: Image.asset(
                                  //             'assets/images/user.png',
                                  //             height: 35,
                                  //             width: 35,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       SizedBox(
                                  //         width: 10,
                                  //       ),
                                  //       Container(
                                  //         width: _size.width * .50,
                                  //         child: Column(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             Text(
                                  //               controller
                                  //                   .transactionReport[index]
                                  //                   .trxName,
                                  //               style: TextStyle(
                                  //                 fontSize: 16,
                                  //                 color: Color(0xFF652981),
                                  //               ),
                                  //             ),
                                  //             SizedBox(
                                  //               height: 5,
                                  //             ),
                                  //             Text(
                                  //               DateFormat.yMMMd().format(
                                  //                       DateTime.parse(controller
                                  //                           .transactionReport[
                                  //                               index]
                                  //                           .trxTime
                                  //                           .toString())) +
                                  //                   ' ' +
                                  //                   DateFormat.jm().format(
                                  //                       DateTime.parse(controller
                                  //                           .transactionReport[
                                  //                               index]
                                  //                           .trxTime
                                  //                           .toString())),
                                  //               style: TextStyle(
                                  //                 fontSize: 12,
                                  //               ),
                                  //             ),
                                  //             // Text(
                                  //             //   DateFormat.yMMMd().format(
                                  //             //           DateTime.parse(controller
                                  //             //               .transactionReport[
                                  //             //                   index]
                                  //             //               .trxTime!)) +
                                  //             //       ' ' +
                                  //             //       DateFormat.jm().format(
                                  //             //           DateTime.parse(controller
                                  //             //               .transactionReport[
                                  //             //                   index]
                                  //             //               .trxTime!)),
                                  //             //   style: TextStyle(
                                  //             //     fontSize: 12,
                                  //             //   ),
                                  //             // ),
                                  //             SizedBox(
                                  //               height: 5,
                                  //             ),
                                  //             // Text(
                                  //             //   controller
                                  //             //       .transactionReport[index]
                                  //             //       .description!,
                                  //             //   style: TextStyle(
                                  //             //     fontSize: 12,
                                  //             //   ),
                                  //             //   maxLines: 5,
                                  //             //   textAlign: TextAlign.justify,
                                  //             // ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),

                                  // Expanded(
                                  //   flex: 1,
                                  //   child: Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.end,
                                  //     children: [
                                  //       Text(
                                  //         controller
                                  //             .transactionReport[index].sender
                                  //             .toString(),
                                  //         style: TextStyle(
                                  //           fontSize: 12,
                                  //         ),
                                  //       ),
                                  //       SizedBox(
                                  //         height: 5,
                                  //       ),
                                  //       Text(
                                  //         '৳ ${controller.transactionReport[index].amount}',
                                  //         style: TextStyle(
                                  //           fontSize: 18,
                                  //           color: Color(0xFF652981),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                } else {
                  return Center(
                      // child: Ui.customLoader(),
                      );
                }
              }),
            ],
          )),
    );
  }
}
