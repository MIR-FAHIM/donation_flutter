// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:latest_payplus_agent/app/modules/bill_payment/widgets/bill_payment-success_view.dart';
// import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
// import 'package:latest_payplus_agent/app/routes/app_pages.dart';
// import 'package:latest_payplus_agent/common/Color.dart';
// import 'package:latest_payplus_agent/common/custom_data.dart';
// import 'package:latest_payplus_agent/common/ui.dart';
// import 'package:flutter/cupertino.dart';
// class BillPayBottomSheetWidget extends StatelessWidget {
//   BillPayBottomSheetWidget({
//     Key? key,
//     this.currentBalance,
//     this.billAmount,
//     this.serviceCharge,
//     this.onlineCharge,
//     this.totalAmount,
//     this.accountNumber,
//     this.title,
//     this.image,
//     this.paymentId,
//     this.referId,
//   }) : super(key: key);
//   String? currentBalance;
//   String? billAmount;
//   String? serviceCharge;
//   String? onlineCharge;
//   String? totalAmount;
//   String? accountNumber;
//   String? title;
//   String? image;
//   String? paymentId;
//   String? referId;
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15),
//                       child: Container(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 10, top: 3),
//                           child: Center(
//                             child: Text(
//                               'Recipient'.tr,
//                               style: TextStyle(color: AppColors.homeTextColor3, fontWeight: FontWeight.bold, fontSize: 12),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     double.parse(totalAmount!) > double.parse(currentBalance!)
//                         ? Text(
//                             'insufficient funds'.tr,
//                             style: TextStyle(color: AppColors.redTextColor, fontWeight: FontWeight.bold, fontSize: 16),
//                           )
//                         : Container(),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 5),
//                       child: IconButton(
//                         icon: Icon(Icons.cancel_rounded),
//                         iconSize: 30,
//                         color: Colors.grey,
//                         splashColor: Colors.purple,
//                         onPressed: () {
//                           Get.back();
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Row(
//                     children: [
//                       const SizedBox(width: 12),
//                       Image.network(
//                         image!,
//                         width: 60,
//                         height: 60,
//                       ),
//                       const SizedBox(width: 10),
//                       Text(
//                         title!,
//                         style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 22, top: 15, right: 22),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Account Number'.tr,
//                             style: TextStyle(fontSize: 13, color: AppColors.homeTextColor3),
//                           ),
//                           const SizedBox(height: 3),
//                           Text(
//                             accountNumber!,
//                             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                           ),
//                           //Amount
//                           const SizedBox(height: 12),
//                           Text(
//                             'Amount'.tr,
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: AppColors.homeTextColor3,
//                             ),
//                           ),
//                           const SizedBox(height: 3),
//                           Text(
//                             '৳ ' + billAmount!,
//                             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                           ),
//                           //Amount
//                           const SizedBox(height: 12),
//                           Text(
//                             'Service Fee'.tr,
//                             style: TextStyle(fontSize: 13, color: AppColors.homeTextColor3),
//                           ),
//                           const SizedBox(height: 3),
//                           Text(
//                             '৳ ' + serviceCharge!,
//                             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(height: 5),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Present Balance'.tr,
//                             style: TextStyle(fontSize: 13, color: AppColors.homeTextColor3),
//                           ),
//                           const SizedBox(height: 3),
//                           Text(
//                             '৳ ' + currentBalance!,
//                             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                           ),
//                           //Amount
//                           const SizedBox(height: 12),
//                           Text(
//                             'Online Charge'.tr,
//                             style: TextStyle(fontSize: 13, color: AppColors.homeTextColor3),
//                           ),
//                           const SizedBox(height: 3),
//                           Text(
//                             '৳ ' + onlineCharge!,
//                             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                           ),
//                           //Amount
//                           const SizedBox(height: 12),
//                           Text(
//                             'Total'.tr,
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: AppColors.homeTextColor3,
//                             ),
//                           ),
//                           const SizedBox(height: 3),
//                           Text(
//                             '৳ ' + totalAmount!,
//                             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(height: 5),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           double.parse(totalAmount!) > double.parse(currentBalance!)
//               ? Container()
//               : Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Container(
//                       width: size.width,
//                       //  height: 50,
//                       decoration: Ui.getBoxDecoration(radius: 5.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(5.0),
//                         child: TextFormField(
//                           // controller: controller.pinController,
//                           cursorColor: Color(0xFF652981),
//                           textAlign: TextAlign.center,
//                           maxLength: 6,
//
//                           decoration: InputDecoration(
//                             counterText: "",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: InputBorder.none,
//                             hintText: 'Enter PIN here'.tr,
//                             hintStyle: TextStyle(color: Color(0xFF652981), fontSize: 15),
//                             prefixIcon: Icon(
//                               CupertinoIcons.lock,
//                               color: Color(0xFF652981),
//                             ),
//                             focusColor: Color(0xFF652981),
//                           ),
//                           // focusNode: controller.pinFocusFocus,
//                           keyboardType: TextInputType.phone,
//                           // validator: (String? value) {
//                           //
//                           // },
//                           onChanged: (input) {
//                             controller.pin.value = input;
//                           },
//                         ),
//                       )),
//                 ),
//
//           double.parse(totalAmount!) > double.parse(currentBalance!)
//               ? BlockButtonWidget(
//                   onPressed: () {
//                     Get.toNamed(Routes.Add_Balance_Dashboard_View);
//                   },
//                   color: Color(0xFF652981),
//                   text: Text(
//                     "Add Your Balance".tr,
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ).paddingSymmetric(vertical: 10, horizontal: 10)
//               : BlockButtonWidget(
//                   onPressed: () {
//                     var result;
//                     var data;
//                     var datas;
//                     if (double.parse(totalAmount!) > double.parse(currentBalance!)) {
//                       print("disable");
//                     } else {
//                       print("enable");
//                       var res = BillPayment(
//                         paymentId,
//                         referId,
//                         billAmount,
//                         serviceCharge,
//                         onlineCharge,
//                         totalAmount,
//                         'controller.pin.value',
//                       );
//                       Ui.customLoaderDialog();
//                       res.then((value) => {
//                             Get.back(),
//                             result = value['result'],
//                             data = value['data'],
//                             if (value['result'] == 'success')
//                               {
//                                 data = value['data'],
//                                 datas = {
//                                   "title": title,
//                                   "images": image,
//                                   "bll_no": data['bill_no'],
//                                   "bllr_accno": data['biller_acc_no'],
//                                   "bll_mobno": data['biller_mobile'],
//                                   "bll_dt_frm": data['bill_from'],
//                                   "bll_dt_to": data['bill_to'],
//                                   "bill_due_date": data['bill_due_date'],
//                                   "bill_total_amount": data['bill_total_amount'],
//                                   "charge": data['charge'],
//                                   "transaction_id": data['transaction_id'],
//                                   "payment_date": data['payment_date'],
//                                 },
//                                 Get.offAll(BillPaymentSuccessView(), arguments: datas)
//                                 // print(data['bllr_accno'])
//                               }
//                             else
//                               Get.showSnackbar(Ui.ErrorSnackBar(message: value['message'], title: 'error'.tr))
//                           });
//                     }
//                   },
//                   color: double.parse(totalAmount!) > double.parse(currentBalance!) ? Colors.grey : Color(0xFF652981),
//                   text: double.parse(totalAmount!) > double.parse(currentBalance!)
//                       ? Text(
//                           "insufficient Funds".tr,
//                           style: TextStyle(color: Colors.red, fontSize: 16),
//                         )
//                       : Text(
//                           "Confirm Bill Payment".tr,
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                 ).paddingSymmetric(vertical: 10, horizontal: 20)
//
//           // Padding(
//           //   padding: const EdgeInsets.only(
//           //       left: 15, right: 15, top: 15, bottom: 15),
//           //   child: GestureDetector(
//           //     onTap: () {
//           //       // Get.to(SalePaymentSystem());
//           //     },
//           //     child: Container(
//           //       width: _size.width * 0.6,
//           //       height: _size.width * .12,
//           //       decoration:
//           //           Ui.getBoxDecoration(color: Color(0xFF652981), radius: 10),
//           //       child: Row(
//           //         mainAxisAlignment: MainAxisAlignment.center,
//           //         children: [
//           //           Text(
//           //             'Confirm Bill Payment'.tr,
//           //             style: TextStyle(
//           //               fontSize: 14,
//           //               color: AppColors.homeCardBg,
//           //             ),
//           //           ),
//           //         ],
//           //       ),
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
