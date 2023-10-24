// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:latest_payplus_agent/common/custom_data.dart';
// import 'package:latest_payplus_agent/common/ui.dart';
//
// import '../controllers/mobile_bank_transaction_history_controller.dart';
//
// class MobileBankTransactionHistoryView extends GetView<MobileBankTransactionHistoryController> {
//   const MobileBankTransactionHistoryView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Get.theme.primaryColor,
//         elevation: 0,
//         title: Text('Transaction History'.tr),
//         centerTitle: true,
//       ),
//       body: Obx(() {
//         if (controller.historyLoaded.isTrue) {
//           return SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: List.generate(controller.history.value.data!.length, (index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 5,
//                     child: SizedBox(
//                       height: size.width * .2,
//                       width: size.width,
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Row(
//                                 children: [
//                                   // Container(
//                                   //   decoration: BoxDecoration(
//                                   //     color: Colors.grey.shade100,
//                                   //     borderRadius: BorderRadius.circular(50),
//                                   //   ),
//                                   //   child: Padding(
//                                   //     padding: const EdgeInsets.all(8.0),
//                                   //     child: Image.asset(
//                                   //       Helper().operatorCheck(controller.rechargeReport.value.data![index].rechargeMobileNumber!),
//                                   //       height: 35,
//                                   //       width: 35,
//                                   //     ),
//                                   //   ),
//                                   // ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Expanded(
//                                         child: Text(
//                                           controller.history.value.data![index].typeName!,
//                                           style: const TextStyle(
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           controller.history.value.data![index].mfsName!,
//                                           style: const TextStyle(
//                                             fontSize: 14,
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           'Trans ID:' + controller.history.value.data![index].trxId!,
//                                           style: const TextStyle(
//                                             fontSize: 13,
//                                           ),
//                                         ),
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           controller.history.value.data![index].trxTime!,
//                                           // DateFormat.yMMMd().format(DateTime.parse(controller.history.value.data![index].trxTime!)) +
//                                           //     ' ' +
//                                           //     DateFormat.jm().format(DateTime.parse(controller.history.value.data![index].trxTime!)),
//                                           style: const TextStyle(
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   const SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     controller.history.value.data![index].typeName!.toLowerCase() == 'cashout'
//                                         ? '- ৳ ${controller.history.value.data![index].amount}'
//                                         : '+৳ ${controller.history.value.data![index].amount}',
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         color:
//                                         controller.history.value.data![index].typeName!.toLowerCase() == 'cashout' ? Colors.red : Colors.green),
//                                   ),
//                                   Text(
//                                     'Com: ' + uniCodeTk + ' ' + controller.history.value.data![index].commission!,
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           );
//         } else {
//           return SizedBox(
//             height: Get.size.height,
//             child: Center(
//               child: Ui.customLoader(),
//             ),
//           );
//         }
//       }),
//     );
//   }
// }
