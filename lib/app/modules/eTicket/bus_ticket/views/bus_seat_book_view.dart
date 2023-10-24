import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/controllers/bus_ticket_controller.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/views/book_ticket_form.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';

import 'package:latest_payplus_agent/common/custom_data.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class BusSeatBookView extends GetView<BusTicketController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffac68cd),
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        title: const Text('Book Seat'),
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.width * .2,
                    width: size.width * .5,
                    decoration: Ui.getBoxDecoration(color: Colors.white),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: size.width * .1,
                              width: size.width * .1,
                              decoration: Ui.getBoxDecoration(
                                  radius: 0,
                                  color: AppColors.primaryLightColor,
                                  border: Border.all(color: Colors.grey)),
                            ),
                            const Text(
                              'Fill-up',
                              style: TextStyle(color: Color(0xffac68cd)),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: size.width * .1,
                              width: size.width * .1,
                              decoration: Ui.getBoxDecoration(
                                  radius: 0,
                                  color: Colors.white,
                                  border: Border.all(
                                      color: const Color(0xffac68cd))),
                            ),
                            const Text(
                              'Blank',
                              style: TextStyle(color: Color(0xffac68cd)),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: size.width * .1,
                              width: size.width * .1,
                              decoration: Ui.getBoxDecoration(radius: 0),
                            ),
                            const Text(
                              'Book',
                              style: TextStyle(color: Color(0xffac68cd)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.width * .24,
                    width: size.width * .35,
                    // decoration: Ui.getBoxDecoration(radius: 0),
                    decoration: const BoxDecoration(
                        color: Color(0xffac68cd),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(10))),
                    alignment: Alignment.center,
                    child: const Image(
                      height: 50,
                      width: 50,
                      image: AssetImage('assets/icons/steering.png'),
                    ),
                  ),
                ],
              ),
              Container(
                height: size.width * .2,
                width: size.width,
                // decoration: Ui.getBoxDecoration(radius: 0),
                decoration: const BoxDecoration(
                    color: Color(0xffac68cd),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(10))),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30),
                child: const Icon(Icons.door_front_door_sharp,
                    color: Colors.white, size: 30),
              ),
              Container(
                height: size.height * .5,
                width: size.width,
                decoration: Ui.getBoxDecoration(radius: 0, color: Colors.white),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: controller.seatBookLoading.value == true
                    ? Container(
                        height: 20,
                        width: 20,
                        child: Center(child: CircularProgressIndicator()))
                    : GridView.count(
                        childAspectRatio: .19,
                        mainAxisSpacing: 4,
                        padding: EdgeInsets.all(4),
                        crossAxisSpacing: 4,
                        crossAxisCount: 4,
                        children: controller.seatLayout.value.map((seat) {
                          return Container(
                            height: size.height * .5,
                            child: ListView.separated(
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      Divider(),
                              itemCount: seat.length,
                              itemBuilder: (BuildContext context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (seat[index].seatAvailability == 1) {
                                      controller.seatId.value = seat[index].seatNumber;
                                    controller.ticketIDs.value = seat[index].ticketId!.toString();
                                      controller.seatFare.value = seat[index].seatFare!.toString();

                                     // controller.busName.value = seat[index].d;
                                    //  controller.seatFare.value = seat[index].;
                                    //  controller.tripId.value = controller.coachList[index].tripId!.toString();
                                      controller.serviceCharge.value = 0;
                                      print(
                                          "seat no is ${seat[index].ticketId}");

                                      controller.seatStatusController();
                                    } else {
                                      print(
                                          "seat no is ${seat[index].ticketId}");
                                      print("Seat Booked ++++++++++++++");
                                    }
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: seat[index].seatNumber == ""
                                          ? Colors.white
                                          : seat[index].seatAvailability == 1
                                              ? Get.theme.primaryColor
                                              : Get.theme.primaryColorLight,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                        child: Text(
                                      seat[index].seatNumber,
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                      ),
              ),
              Container(
                height: size.width * .1,
                width: size.width,
                // decoration: Ui.getBoxDecoration(radius: 0),
                decoration: const BoxDecoration(
                    color: Color(0xffac68cd),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                alignment: Alignment.center,
                child:
                    const Text('Engine', style: TextStyle(color: Colors.white)),
              ),
              controller.seatBookedView.value == true
                  ? Container(
                      height: MediaQuery.of(context).size.height * .14,
                      child: Row(
                        children: [
                          Card(
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * .42,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.busName.value,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "Model name",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12),
                                    ),
                                    Divider(),
                                    Text(
                                      "Select Seats",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      controller.seatId.value,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * .42,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Seat Fare",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                        Text(
                                          controller.seatFare.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Service Charge",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                        Text(
                                          controller.serviceCharge.value.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Fare",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10),
                                        ),
                                        Text(
                                          (double.parse(controller.seatFare.value) + controller.serviceCharge.value).toString(),

                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              color: AppColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        );
      }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if( controller.seatBookedView.value == true) {

            Get.to(BookTicketFormView());
          } else {
            Get.showSnackbar(Ui.ErrorSnackBar(message: "Please select a Seat First", title: 'error'.tr));

          }

        },
        child: Container(
          height: size.width * .15,
          decoration: Ui.getBoxDecoration(radius: 0),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              Icon(Icons.arrow_forward, color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}

// seat layout

// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child:  Text('A1'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('A2'),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('A3'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('A4'),
// ),
// ],
// )
// ],
// ),
// const SizedBox(height: 10),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('B1'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('B2'),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('B3'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('B4'),
// ),
// ],
// )
// ],
// ),
// const SizedBox(height: 10),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('C1'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('C2'),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('C3'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('C4'),
// ),
// ],
// )
// ],
// ),
// const SizedBox(height: 10),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('D1'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('D2'),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('D3'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('D4'),
// ),
// ],
// )
// ],
// ),
// const SizedBox(height: 10),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('E1'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('E2'),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('E3'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('E4'),
// ),
// ],
// )
// ],
// ),
// const SizedBox(height: 10),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('F1'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('F2'),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('F3'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('F4'),
// ),
// ],
// )
// ],
// ),
// const SizedBox(height: 10),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('G1'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('G2'),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('G3'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('G4'),
// ),
// ],
// )
// ],
// ),
// const SizedBox(height: 10),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('H1'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('H2'),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('H3'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('H4'),
// ),
// ],
// )
// ],
// ),
// const SizedBox(height: 10),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('I1'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('I2'),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('I3'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('I4'),
// ),
// ],
// )
// ],
// ),
// const SizedBox(height: 10),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('J1'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('J2'),
// ),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('J3'),
// ),
// const SizedBox(width: 3),
// Container(
// height: size.width * .1,
// width: size.width * .15,
// decoration: Ui.getBoxDecoration(radius: 5, color: Colors.white, border: Border.all(color: Colors.grey)),
// alignment: Alignment.center,
// child: const Text('J4'),
// ),
// ],
// )
// ],
// ),
// const SizedBox(height: 10),
//
// ],
// ),
