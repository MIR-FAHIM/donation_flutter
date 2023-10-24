import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/block_button_widget.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:latest_payplus_agent/app/modules/home/controllers/home_controller.dart';
import 'package:latest_payplus_agent/app/modules/withdraw/controllers/withdraw_controller.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class WithdrawAmount extends GetView<WithdrawController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MainDrawerWidget(),
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: Color(0xFF652981),
          centerTitle: true,
          title: Text('Withdraw'.tr),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell,
                  color: Colors.white70,
                )),
            IconButton(
                onPressed: () => {Scaffold.of(context).openEndDrawer()},
                icon: Icon(
                  Icons.menu,
                  color: Colors.white70,
                )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // TextFieldWidget(
              //   labelText: "Mobile Number".tr,
              //
              //   initialValue: '+880',
              //   // onSaved: (input) =>
              //   // controller.currentUser.value.email = input,
              //   // validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
              //   iconData: Icons.phone,
              //   imageData: null,
              // ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter withdraw amount below:'.tr,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF652981),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: _size.width * .5,
                              width: _size.width,
                              decoration: Ui.getBoxDecoration(
                                  color: Colors.white, radius: 8),
                              child: Center(
                                  child: Container(
                                //  height: _size.width * .4,
                                width: _size.width,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: controller.withdrawController,
                                  validator: (input) => double.parse(controller
                                              .withdrawController.text) <
                                          2
                                      ? 'Minimum recharge amount is TK 2'.tr
                                      : null,
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    color: Color(0xFF652981),
                                  ),
                                  obscureText: false,
                                  focusNode: controller.withdrawFocusFocus,
                                  textAlign: TextAlign.center,
                                  cursorColor: Color(0xFF652981),
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(fontSize: 35),
                                    hintText: '৳ 0',
                                    hintStyle: TextStyle(fontSize: 35),
                                    focusColor: Color(0xFF652981),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                              )),
                            ),
                            // Positioned(
                            //   bottom: 0,
                            //   left: 0,
                            //   right: 0,
                            //   child: Center(
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(10.0),
                            //       child: Text(
                            //         'Your Balance:'.tr + '৳ ${Get.find<HomeController>().balance.toStringAsFixed(1)}',
                            //         style: TextStyle(color: Color(0xFF652981)),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Your Balance:'.tr +
                                        '৳ ${Get.find<HomeController>().balance.value}',
                                    style: TextStyle(color: Color(0xFF652981)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              }),
              BlockButtonWidget(
                onPressed: () {
                  controller.withdrawMoney();
                },
                color: Color(0xFF652981),
                text: Text(
                  "Next".tr,
                  style: Get.textTheme.headline6!
                      .merge(TextStyle(color: Colors.white)),
                ),
              ).paddingSymmetric(vertical: 10, horizontal: 20),
            ],
          ),
        ),
      ),
    );
  }
}
