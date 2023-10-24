import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';

import '../controllers/signup_service_fee_controller.dart';

class SignupServiceFeeView extends GetView<SignupServiceFeeController> {
  const SignupServiceFeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.serviceLoaded.isTrue) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Type of service charge'.tr,
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    controller.serviceCharge.value.information ?? '',
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  children: List.generate(controller.serviceCharge.value.servicefeedata!.length, (index) {
                    return ListTile(
                      onTap: () {
                        if (controller.serviceCharge.value.servicefeedata![index].isDisable == 0) {
                          controller.selectedServiceCharge.value =
                              controller.serviceCharge.value.servicefeedata![index].serviceFeeTypeDetails.toString();
                          controller.selectedServiceType.value = controller.serviceCharge.value.servicefeedata![index].serviceFeeTypeId.toString();
                        }

                        print('SignupServiceFeeView.build:${controller.selectedServiceType.value}');
                      },
                      title: Text(controller.serviceCharge.value.servicefeedata![index].serviceFeeTypeDetails ?? ''),
                      subtitle: controller.serviceCharge.value.servicefeedata![index].strikeText != null
                          ? Text(
                              controller.serviceCharge.value.servicefeedata![index].strikeText ?? '',
                              style: const TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                          : const Text(''),
                      leading: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: controller.serviceCharge.value.servicefeedata![index].isDisable == 0 ? Get.theme.primaryColor : Colors.grey,
                          ),
                          color: controller.serviceCharge.value.servicefeedata![index].isDisable == 0
                              ? controller.selectedServiceType.value ==
                                      controller.serviceCharge.value.servicefeedata![index].serviceFeeTypeId.toString()
                                  ? Get.theme.primaryColor
                                  : Colors.white
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BlockButtonWidget(
                width: Get.size.width * .8,
                onPressed: () {
                  controller.getRegistrationPaymentInfo();
                },
                color: Get.theme.primaryColor,
                text: Text(
                  'Next'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    }));
  }
}
