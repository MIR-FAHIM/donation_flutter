import 'package:donation_flutter/app/modules/Auth/login/controllers/login_controller.dart';
import 'package:donation_flutter/app/modules/global_widgets/block_button_widget.dart';
import 'package:donation_flutter/app/services/validator.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterView extends GetView<LoginController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kToolbarHeight,
                  ),

                  Text(
                    "Register",
                    style: TextStyle(fontSize: 22, color: AppColors.textColorBlack, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Name*",
                    style: TextStyle(fontSize: 14, color: AppColors.textColorBlack, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                    maxLines: 1,
                    controller: controller.fullName.value,
                    decoration:  InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      // suffixIcon: Icon(
                      //   Icons.email_outlined,
                      // ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.textColorBlack, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.textColorBlack, width: 1.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    validator: (value) => AppValidator.validateEmptyText("Name", value),
                  ),


                  const SizedBox(
                    height: 12,
                  ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email*",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: AppColors.textColorBlack, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: TextFormField(
                          onTapOutside: (context) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: controller.emailController.value,
                          keyboardType: TextInputType.text,
                          validator: (value) => AppValidator.validateEmail(value),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            // hintText: "1XXXXXXXXX",
                            // hintStyle: TextStyle(
                            //   fontSize: 24,
                            //   color: Colors.grey,
                            //   fontWeight: FontWeight.w500,
                            //   fontFamily: "Unineue",
                            // ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mobile*",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: AppColors.textColorBlack, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: TextFormField(
                          onTapOutside: (context) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: controller.mobileController.value,
                          keyboardType: TextInputType.text,
                          validator: (value) => AppValidator.validateEmail(value),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            // hintText: "1XXXXXXXXX",
                            // hintStyle: TextStyle(
                            //   fontSize: 24,
                            //   color: Colors.grey,
                            //   fontWeight: FontWeight.w500,
                            //   fontFamily: "Unineue",
                            // ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Country*",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: AppColors.textColorBlack, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: TextFormField(
                          onTapOutside: (context) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: controller.countryController.value,
                          keyboardType: TextInputType.text,
                          validator: (value) => AppValidator.validateEmail(value),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            // hintText: "1XXXXXXXXX",
                            // hintStyle: TextStyle(
                            //   fontSize: 24,
                            //   color: Colors.grey,
                            //   fontWeight: FontWeight.w500,
                            //   fontFamily: "Unineue",
                            // ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address*",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: AppColors.textColorBlack, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: TextFormField(
                          onTapOutside: (context) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: controller.addressController.value,
                          keyboardType: TextInputType.text,
                          validator: (value) => AppValidator.validateEmail(value),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            // hintText: "1XXXXXXXXX",
                            // hintStyle: TextStyle(
                            //   fontSize: 24,
                            //   color: Colors.grey,
                            //   fontWeight: FontWeight.w500,
                            //   fontFamily: "Unineue",
                            // ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Password*",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14, color: AppColors.textColorBlack, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        child: TextFormField(
                          onTapOutside: (context) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          controller: controller.codeController.value,
                          keyboardType: TextInputType.number,
                          validator: (value) => AppValidator.validateEmail(value),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            // hintText: "1XXXXXXXXX",
                            // hintStyle: TextStyle(
                            //   fontSize: 24,
                            //   color: Colors.grey,
                            //   fontWeight: FontWeight.w500,
                            //   fontFamily: "Unineue",
                            // ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlockButtonWidget(
                    onPressed: () {
                      controller.registerController();
                    },
                    color: AppColors.primaryColor,
                    text: Text(
                      "Register".tr,
                      style: Get.textTheme.headline6!.merge(const TextStyle(color: Colors.white)),
                    ),
                  ).paddingSymmetric(vertical: Get.width * .04, horizontal: 20),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}