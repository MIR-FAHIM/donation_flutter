import 'package:donation_flutter/common/Color.dart';
import 'package:flutter/material.dart';


class HostSetupSubtitle extends StatelessWidget {
  const HostSetupSubtitle({
  super.key, required this.subtitle,
  });
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
        color: AppColors.textColorBlack,
      ),
    );
  }
}