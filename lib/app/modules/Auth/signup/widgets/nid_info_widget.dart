import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:latest_payplus_agent/app/modules/Auth/signup/controllers/signup_controller.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/text_field_widget.dart';


class NIDDetailsWidget extends GetWidget<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          labelText: "Name".tr,
          // onChanged: (input) => controller.userData.value.name = input,
          readOnly: true,
          initialValue: controller.nidData.value.data!.nid!.fullNameEN!,
          iconData: null,
          imageData: 'assets/images/user.png',
        ),
        TextFieldWidget(
          labelText: "Gender".tr,
          readOnly: true,
          initialValue: controller.nidData.value.data!.nid!.gender!,
          iconData: null,
          imageData: 'assets/images/user.png',
        ),
        TextFieldWidget(
          labelText: "NID No".tr,
          readOnly: true,
          initialValue: controller.nidData.value.data!.nid!.nationalIdNumber,
          // initialValue: controller.userData.value.nid,
          keyboardType: TextInputType.number,
          iconData: null,
          imageData: 'assets/images/nid.png',
        ),
        TextFieldWidget(
          labelText: "Father's Name".tr,
          readOnly: true,
          initialValue: controller.nidData.value.data!.nid!.fathersNameEN,
          iconData: null,
          imageData: 'assets/images/user.png',
        ),
        TextFieldWidget(
          labelText: "Mother's Name".tr,
          readOnly: true,
          initialValue: controller.nidData.value.data!.nid!.mothersNameEN,
          iconData: null,
          imageData: 'assets/images/user.png',
        ),
      ],
    );
  }
}
