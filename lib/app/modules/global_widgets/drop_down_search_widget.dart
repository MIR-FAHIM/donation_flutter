import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/ui.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.onTapped,
    this.keyboardType,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.iconData,
    this.labelText,
    this.obscureText,
    this.suffixIcon,
    this.isFirst,
    this.isLast,
    this.style,
    this.textAlign,
    this.suffix,
    this.limit,
    this.tapping,
    this.imageData,
    this.hasDropdown = false,
    this.items,
  }) : super(key: key);

  final FormFieldSetter<String>? onSaved;
  final onChanged;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTapped;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? hintText;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final IconData? iconData;
  final bool? obscureText;
  final bool? isFirst;
  final bool? isLast;
  final Widget? suffixIcon;
  final Widget? suffix;
  final int? limit;
  final bool? tapping;
  final imageData;
  final bool? hasDropdown;
  final items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 10, bottom: 14, left: 20, right: hasDropdown! ? 0 : 20),
      margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: buildBorderRadius,
        boxShadow: [
          BoxShadow(
              color: Color(0xFF652981).withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2)),
        ],
        //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labelText ?? "",
            style: Get.textTheme.bodyText1,
            textAlign: textAlign ?? TextAlign.start,
          ),
          Container(
            height: 55,
            color: Colors.white,
            child: DropdownSearch<String>(
              items: items.isNotEmpty ? items : [],
              onChanged: onChanged,
              selectedItem: items.isNotEmpty ? items[0] : hintText,
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius get buildBorderRadius {
    if (isFirst != null && isFirst!) {
      return BorderRadius.vertical(top: Radius.circular(10));
    }
    if (isLast != null && isLast!) {
      return BorderRadius.vertical(bottom: Radius.circular(10));
    }
    if (isFirst != null && !isFirst! && isLast != null && !isLast!) {
      return BorderRadius.all(Radius.circular(0));
    }
    return BorderRadius.all(Radius.circular(10));
  }

  double get topMargin {
    if ((isFirst != null && isFirst!)) {
      return 20;
    } else if (isFirst == null) {
      return 20;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast != null && isLast!)) {
      return 10;
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }
}
