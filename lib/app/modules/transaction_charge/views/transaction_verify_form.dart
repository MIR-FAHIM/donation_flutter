import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/text_field_widget.dart';
import 'package:latest_payplus_agent/app/modules/transaction_charge/controllers/transaction_charge_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';

class TransactionVerifyForm extends GetView<TransactionChargeController> {
  TransactionVerifyForm({Key? key}) : super(key: key);
  final Size _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: PreferredSize(
            preferredSize: const Size(65, 65),
            child: AppBar(
              backgroundColor: const Color(0xFF652981),
              centerTitle: true,
              title: Text(controller.selectedMethod.value.name ??
                  '' + " - Transaction Verify".tr),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios),
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
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SizedBox(
              // width: _size.width,
              height: _size.height,
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: CachedNetworkImage(
                            imageUrl: controller.selectedMethod.value.logo ?? '',
                            imageBuilder: (context, imageProvider) => Container(
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
                                image: AssetImage('assets/images/default_image.png'),
                              ),
                            ),
                            errorWidget: (context, url, error) => const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Image(
                                image: AssetImage('assets/images/default_image.png'),
                              ),
                            ),
                          ),
                        ),
                      ),

                      TextFieldWidget(
                        keyboardType: TextInputType.text,
                        labelText: "Transaction ID".tr,
                        hintText: "Enter transaction id here".tr,
                        onChanged: (input) {
                          controller.txrid.value = input;
                        },
                        // onSaved: (input) =>
                        // controller.currentUser.value.email = input,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'This field cannot be empty'.tr;
                          } else {
                            return null;
                          }
                        },
                        iconData: null,
                        imageData: 'assets/icons/price.png',
                      ),

                      TextFieldWidget(
                        labelText: "Reference No".tr,
                        hintText: "".tr,
                        readOnly: true,
                        initialValue:
                            Get.find<AuthService>().currentUser.value.mobileNumber ?? '',
                        iconData: CupertinoIcons.device_phone_portrait,
                      ),
                      // Container(
                      //   child: CheckBoxWidget(
                      //     title: 'Save the account'.tr,
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlockButtonWidget(
                        onPressed: () {
                          controller.verifyTransaction();
                        },
                        color: const Color(0xFF652981),
                        text: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            "Verify Transaction".tr,
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ).paddingSymmetric(vertical: 10, horizontal: 20),
                    ],
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
