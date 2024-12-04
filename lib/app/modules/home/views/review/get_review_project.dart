import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';


class ReviewListView extends GetView<HomeController> {
  const ReviewListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textColorBlack,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "All Reviews",
          style: TextStyle(
            color: AppColors.textColorBlack,
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.toNamed(Routes.ADDREVIEW);
        },
      ),
      // PreferredSize(
      //   preferredSize: Size.fromHeight(70.0), // here the desired height
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Container(
      //         alignment: Alignment.bottomLeft,
      //         // color: AppColors.backgroundColor,
      //         child: Image.asset(
      //           'assets/images/jayga_logo.png',
      //           height: 70,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    border: Border.all(color: AppColors.containerColor, width: 2),
                    color: AppColors.containerColor,
                  ),
                  // color: AppColors.backgroundColor,
                  child: CachedNetworkImage(
                    imageUrl: "https://new.jayga.io/uploads/listings/${data.images.first.listingFilename}",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                          'assets/images/demo_room1.png',
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Image(
                        image: AssetImage('images/img.png'),
                      ),
                    ),
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.projectData.value.projectName!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),


                          Container(height: 15, width: 2, color: Colors.black54),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "${controller.reviewList.value.length} reviews",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18, color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  separatorBuilder: ((context, index) => const SizedBox(
                    height: 10,
                  )),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.reviewList.value.length,
                  itemBuilder: (BuildContext c, i) {
                    var data = controller.reviewList[i];
                    return Container(
                      height: Get.height * 0.14,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             CircleAvatar(
                              radius: 19,
                              backgroundColor: AppColors.primaryColor,
                              child: const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.white,
                              ),
                            ),

                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.user.name,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Verified user",
                                  style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  data.message,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  DateFormat.yMMMM().format(
                                    data.createdAt,
                                  ),
                                  style: const TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .03,
                                  child: RatingBar.builder(
                                    initialRating: double.parse(data.star),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 14,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 12,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      /*ListTile(
                              title: Text(
                                data.userName,
                                style: const TextStyle(fontSize: 22),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * .03,
                                    child: RatingBar.builder(
                                      initialRating: double.parse(data.stars),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 16,
                                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 14,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ),
                                  Text(
                                    DateFormat.yMd().add_jm().format(
                                          data.createdAt,
                                        ),
                                    style:
                                        const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black54),
                                  ),
                                  Text(
                                    data.description,
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
                                  ),
                                ],
                              ),
                              leading: data.user.avatars == null
                                  ? CircleAvatar(
                                      radius: 19,
                                      backgroundColor: AppColors.textColorGreen,
                                      child: const CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.white,
                                      ),
                                    )
                                  : Container(
                                      height: 70,
                                      width: 70,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                                        imageUrl:
                                            "https://new.jayga.io/uploads/useravatars/${data.user.avatars!.userFilename}",
                                        imageBuilder: (context, imageProvider) => Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) => const Padding(
                                            padding: EdgeInsets.all(5.0), child: Icon(Icons.verified_user_outlined)),
                                        errorWidget: (context, url, error) => const Padding(
                                            padding: EdgeInsets.all(5.0), child: Icon(Icons.verified_user_outlined)),
                                      ),
                                      // color: AppColors.backgroundColor,
                                    ),
                            ),*/
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
