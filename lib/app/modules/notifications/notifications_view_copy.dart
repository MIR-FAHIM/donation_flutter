import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/home/controllers/home_controller.dart';
import 'package:latest_payplus_agent/app/modules/inbox/widgets/notification_widget.dart';

class NotificationsViewCopy extends StatefulWidget {
  const NotificationsViewCopy({Key? key}) : super(key: key);

  @override
  State<NotificationsViewCopy> createState() => _NotificationsViewCopyState();
}

class _NotificationsViewCopyState extends State<NotificationsViewCopy>
    with TickerProviderStateMixin {
  TabController? tabController;
  int currentTabIndex = 0;
  void onTabChange() {
    setState(() {
      currentTabIndex = tabController!.index;
      print(currentTabIndex);
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    // tabController.addListener(() {
    //   onTabChange();
    // });
    HomeController homeController = Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = Get.size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(65, 65),
          child: AppBar(
            backgroundColor: Color(0xFF652981),
            centerTitle: true,
            title: Text('Notification'.tr),
            elevation: 0,
          ),
        ),
        body: Container(
          width: _size.width,
          height: _size.width,
          // margin: EdgeInsets.all(20),

          // decoration: Ui.getBoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                NotificationWidget(),
              ],
            ),
          ),
        ));
  }
}
