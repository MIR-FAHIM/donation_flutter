import 'package:donation_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';




class GiveReviewScreen extends GetView<HomeController> {
  const GiveReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Review",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.textColorBlack,
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            height: Get.height * .72,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     Container(
                  //         height: Get.height*.1,
                  //         width: Get.width*.2,
                  //         // color: AppColors.backgroundColor,
                  //         child: CachedNetworkImage(
                  //           imageUrl: "https://new.jayga.io/uploads/listings/${data.listings!.images.first.listingFilename}",
                  //           imageBuilder: (context, imageProvider) =>
                  //               Container(
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.transparent,
                  //                   borderRadius: BorderRadius.circular(20),
                  //                   image: DecorationImage(
                  //                     image: imageProvider,
                  //                     fit: BoxFit.fill,
                  //                   ),
                  //                 ),
                  //               ),
                  //           placeholder: (context, url) =>
                  //           const Padding(
                  //             padding: EdgeInsets.all(5.0),
                  //             child: Image(
                  //               image: AssetImage(
                  //                 'assets/images/jayga_logo.png',
                  //               ),
                  //             ),
                  //           ),
                  //           errorWidget: (context, url, error) =>
                  //           const Padding(
                  //             padding: EdgeInsets.all(5.0),
                  //             child: Image(
                  //               image: AssetImage(
                  //                 'assets/images/jayga_logo.png',),
                  //             ),
                  //           ),
                  //         )
                  //     ),
                  //     const SizedBox(
                  //       width: 20,
                  //     ),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width * .6,

                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const Text(
                  //             "Booking Details:",
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.normal,
                  //                 fontSize: 18,
                  //                 color: Colors.black54),
                  //           ),
                  //           Text(
                  //             data.listings!.listingTitle,
                  //             style: const TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 18,
                  //                 color: Colors.black),
                  //           ),
                  //           SizedBox(
                  //             height: Get.height*.08,
                  //             width: Get.width * .5,
                  //             child: Text(
                  //               data.listings!.listingAddress!,
                  //               maxLines: 2,
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.normal,
                  //                   fontSize: 12,
                  //                   color: AppColors.textColorGreen),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Text(
                    controller.projectData.value.projectName!,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 6,
                  ),

                  const Divider(),

                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${controller.projectData.value.address!}",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: AppColors.textColorBlack,
                    ),
                  ),

                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),

                  Center(
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      allowHalfRating: false,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        controller.ratingNum.value = rating;
                        print(rating);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your Message",
                    style: TextStyle(
                      color: AppColors.textColorBlack,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Your review matters. Help others get to know about this place better.",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    maxLines: 5,
                    controller: controller.reviewController.value,
                    decoration: InputDecoration(
                      // hintText: "Please share your Experience",
                      fillColor: Colors.white,
                      hintText: 'Describe your experience and services',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                      ),
                      // suffixIcon: Icon(
                      //   Icons.email_outlined,
                      // ),
                      focusColor: AppColors.primaryColor,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Email is Required";
                      } else if (!GetUtils.isEmail(value.trim())) {
                        return "Please enter valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.textColorBlack,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (controller.reviewController.value.text.isEmpty || controller.ratingNum.value == 0) {
                          Get.showSnackbar(
                              Ui.ErrorSnackBar(message: "Please give comment and give stars", title: 'Error'.tr));
                        } else {
                          controller.addReview();
                        }
                      },
                      child: Text(
                        "Review",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
