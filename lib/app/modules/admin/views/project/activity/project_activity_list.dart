// import 'dart:html';

import 'dart:io';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:donation_flutter/app/api_providers/api_url.dart';
import 'package:donation_flutter/app/modules/admin/controllers/admin_controller.dart';
import 'package:donation_flutter/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:donation_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:donation_flutter/app/modules/home/views/homepage_listing_profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import 'package:donation_flutter/app/services/facebook_service.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'package:donation_flutter/app/routes/app_pages.dart';
import 'package:donation_flutter/app/services/auth_service.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:donation_flutter/common/custom_data.dart';
import 'package:donation_flutter/common/ui.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProjectActivityListAdmin extends GetView<AdminController> {


  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: (){
                Get.toNamed(Routes.ADDACTIVITY);
              },
            ),
            backgroundColor: Colors.white,
            // drawer: RechargeDrawer(),
            endDrawer: MainDrawerWidget(),
            appBar: PreferredSize(
              preferredSize: const Size(65, 65),
              child: AppBar(
                backgroundColor: AppColors.primaryColor,
                automaticallyImplyLeading: false,
                centerTitle: false,
                title: Text("Project Activity"),

                elevation: 0,

              ),
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height * .9,
              child: ListView.builder(
                shrinkWrap: true,
                //  physics: const NeverScrollableScrollPhysics(),
                // new
                scrollDirection: Axis.vertical,
                itemCount: controller.projectActivityList.value.length,

                itemBuilder: (BuildContext context, index) {
                  var data = controller.projectActivityList.value[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //image

                          // Container(
                          //   height: MediaQuery.of(context).size.height * .2,
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     border: Border.all(color: Colors.transparent, width: 2),
                          //     color: AppColors.primaryColor,
                          //   ),
                          //   child:CachedNetworkImage(
                          //     //imageUrl: "http://new.jaygaheight: MediaQuery.of(context).size.height *.12/uploads/listings/66dGWkgYLX5JyZGg0uHTv9N8M1bGhcCtBNzsX3MD.jpg",
                          //     imageUrl:
                          //     "${ApiClient.baseUrl}${data.activityImage}",
                          //     imageBuilder: (context, imageProvider) => Container(
                          //       width: double.infinity,
                          //       decoration: BoxDecoration(
                          //         color: Colors.transparent,
                          //         borderRadius: BorderRadius.circular(20),
                          //         image: DecorationImage(
                          //           image: imageProvider,
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //     ),
                          //     placeholder: (context, url) => const Padding(
                          //       padding: EdgeInsets.all(5.0),
                          //       child: Image(
                          //         image: AssetImage(
                          //           'assets/images/charity.png',
                          //         ),
                          //       ),
                          //     ),
                          //     errorWidget: (context, url, error) => const Padding(
                          //       padding: EdgeInsets.all(5.0),
                          //       child: Image(
                          //         fit: BoxFit.fill,
                          //         image: AssetImage(
                          //           'assets/images/charity.png',
                          //         ),
                          //       ),
                          //     ),
                          //   ),),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width*.7,
                                child: ListTile(
                                  title: Text(data.title),
                                  subtitle: Text(data.details),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat.yMMMd().format(data.createdAt) ,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(

                                        DateFormat.jm().format(data.createdAt),
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text("${data.cost.toString()} Tk"),

                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
    );
  }
}

