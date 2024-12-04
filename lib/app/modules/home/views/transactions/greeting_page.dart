import 'package:donation_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:donation_flutter/app/modules/home/widgets/subtitle_widget.dart';
import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class SuccessPage extends GetView<HomeController> {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(

                  width: Get.width*.4,
                      height: Get.height*.2,
                      "assets/icons/logo_charity.png"),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Thank you for this donation",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 16,
                ),
                const HostSetupSubtitle(
                    subtitle:
                    "You will get notifications when respective authority receive the donation."),
                const SizedBox(
                  height: 10,
                ),
                const HostSetupSubtitle(
                    subtitle: "You can check project activity from activity module and also can contact with them. "),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          text: "Respective Authority ", style: TextStyle(color: Colors.grey)),
                      TextSpan(
                        text: controller.projectData.value.authority,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),

                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          text: "Mobile no ", style: TextStyle(color: Colors.grey)),
                      TextSpan(
                        text: controller.projectData.value.mobile,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),

                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          text: "Email ", style: TextStyle(color: Colors.grey)),
                      TextSpan(
                        text: controller.projectData.value.email,
                        style: TextStyle(color: AppColors.primaryColor),
                      ),

                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                          text: "Read ", style: TextStyle(color: Colors.grey)),
                      TextSpan(
                        text: "terms and condition ",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.HOME);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "Back to Home Page",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
