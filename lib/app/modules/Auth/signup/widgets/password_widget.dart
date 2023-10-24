import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latest_payplus_agent/app/modules/Auth/signup/controllers/signup_controller.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/text_field_widget.dart';


class PasswordWidget extends GetWidget<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          TextFieldWidget(
            labelText: "Pin:".tr,
            hintText: "••••••••••••".tr,
            keyboardType: TextInputType.number,
            onChanged: (input) {
              controller.userData.value.password = input;
            },

            // onSaved: (input) =>
            // controller.currentUser.value.password = input,
            validator: (input) {
              if (input!.length < 6 || input.length > 6)
                return "Should be 6 characters";
              else {
                return null;
              }
            },
            limit: 6,
            counterText: "",
            obscureText: controller.hidePassword.value,
            iconData: Icons.lock_outline,
            suffixIcon: IconButton(
                onPressed: () {
                  controller.hidePassword.value = !controller.hidePassword.value;
                },
                color: const Color(0xFF652981),
                icon: controller.hidePassword.value == false ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off_outlined)),
          ),
          TextFieldWidget(
            labelText: "Confirm PIN Number:".tr,
            hintText: "••••••••••••".tr,
            keyboardType: TextInputType.number,
            validator: (input) {
              if (input!.length < 6 || input.length > 6) {
                return "Should be 6 characters";
              } else if (input != controller.userData.value.password) {
                return "Password doesn't match";
              } else {
                return null;
              }
            },
            limit: 6,
            counterText: "",
            obscureText: controller.hideConfirmPassword.value,
            iconData: Icons.lock_outline,
            suffixIcon: IconButton(
                onPressed: () {
                  controller.hideConfirmPassword.value = !controller.hideConfirmPassword.value;
                },
                color: const Color(0xFF652981),
                icon: controller.hideConfirmPassword.value == false ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off_outlined)),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              controller.register();
            },
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: const Color(0xFF652981),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Center(
                  child: Text(
                    "Register".tr,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ).paddingSymmetric(vertical: 5, horizontal: 20),
          ),
        ],
      );
    });
  }
}
