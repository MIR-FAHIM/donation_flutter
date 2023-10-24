import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/transaction_charge/views/transaction_verify_form.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../controllers/transaction_charge_controller.dart';

class TransactionChargeView extends GetView<TransactionChargeController> {
  TransactionChargeView({Key? key}) : super(key: key);

  final Size _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(65, 65),
        child: AppBar(
          backgroundColor: const Color(0xFF652981),
          centerTitle: true,
          title: Text('Transaction Verify'.tr),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.transactionVerifyLoaded.isTrue) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children:
                  List.generate(controller.transactionVerifyPayment.length, (index) {
                return GestureDetector(
                  onTap: () {
                    controller.selectedMethod.value =
                        controller.transactionVerifyPayment[index];
                    Get.to(() => TransactionVerifyForm());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: _size.width,
                      decoration: Ui.getBoxDecoration(
                        color: Colors.white,
                        radius: 5,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: CachedNetworkImage(
                                        imageUrl: controller
                                            .transactionVerifyPayment[index].logo!,
                                        imageBuilder: (context, imageProvider) =>
                                            Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) => const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/default_image.png'),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/default_image.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    controller.transactionVerifyPayment[index].name!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor),
                                  ),
                                  // Text(
                                  //   Get.find<AuthService>()
                                  //           .currentUser
                                  //           .value
                                  //           .mobileNumber ??
                                  //       '',
                                  //   style: TextStyle(
                                  //     fontSize: 12,
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                ],
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    controller.transactionVerifyPayment[index].charge! +
                                        "% " +
                                        "Charge".tr,
                                    style: TextStyle(
                                        color: AppColors.homeTextColor3,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
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
            height: _size.height,
            width: _size.width,
            child: Center(
              child: Ui.customLoader(),
            ),
          );
        }
      }),
    );
  }
}
