import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/custom_data.dart';
import 'package:latest_payplus_agent/common/helper.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../controllers/mobile_bank_transaction_history_controller.dart';

class MobileBankTransactionHistoryView extends GetView<MobileBankTransactionHistoryController> {
  const MobileBankTransactionHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.primaryColor,
        elevation: 0,
        title: Text('Transaction History'.tr),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.historyLoaded.isTrue) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(controller.history.value.data!.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: SizedBox(
                      height: size.width * .23,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration:
                                        BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              30),
                                        ),
                                        child:
                                        ClipRRect(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              30),
                                          child:
                                          CachedNetworkImage(
                                            imageUrl:    controller.history.value.data![index].logo!,
                                            imageBuilder:
                                                (context,
                                                imageProvider) =>
                                                Container(
                                                  decoration:
                                                  BoxDecoration(
                                                    image:
                                                    DecorationImage(
                                                      image:
                                                      imageProvider,
                                                      fit: BoxFit
                                                          .fill,
                                                    ),
                                                  ),
                                                ),
                                            placeholder:
                                                (context,
                                                url) =>
                                            const Padding(
                                              padding:
                                              EdgeInsets.all(
                                                  5.0),
                                              child:
                                              Image(
                                                image: AssetImage(
                                                    'assets/images/default_image.png'),
                                              ),
                                            ),
                                            errorWidget: (context,
                                                url,
                                                error) =>
                                            const Padding(
                                              padding:
                                              EdgeInsets.all(
                                                  5.0),
                                              child:
                                              Image(
                                                image: AssetImage(
                                                    'assets/images/default_image.png'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Expanded(
                                        child: Text(
                                          controller.history.value.data![index].mfsName!,
                                          style: const TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *.35,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            controller.history.value.data![index].typeName!,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          child: Text(
                                            controller.history.value.data![index].number!,
                                            style:  TextStyle(
                                              fontSize: 14,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Trans ID:' + controller.history.value.data![index].trxId!,
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width *.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    controller.history.value.data![index].typeName!.toLowerCase() == 'cashout'
                                        ? '- ৳ ${controller.history.value.data![index].amount}'
                                        : '+৳ ${controller.history.value.data![index].amount}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color:
                                            controller.history.value.data![index].typeName!.toLowerCase() == 'cashout' ? Colors.red : Colors.green),
                                  ),
                                  Text(
                                    'Com: ' + uniCodeTk + ' ' + controller.history.value.data![index].commission!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                    //  controller.history.value.data![index].trxTime!,
                                      DateFormat.yMMMd().format(DateTime.parse(controller.history.value.data![index].trxTime!)) +
                                          ', ' +
                                          DateFormat.jm().format(DateTime.parse(controller.history.value.data![index].trxTime!)),
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
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
                );
              }),
            ),
          );
        } else {
          return SizedBox(
            height: Get.size.height,
            child: Center(
              child: Ui.customLoader(),
            ),
          );
        }
      }),
    );
  }
}
