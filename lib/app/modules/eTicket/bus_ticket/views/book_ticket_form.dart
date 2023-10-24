import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/controllers/bus_ticket_controller.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/views/book_ticket_form.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/views/ticket_preview.dart';
import 'package:latest_payplus_agent/app/modules/global_widgets/text_field_widget.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';

import 'package:latest_payplus_agent/common/custom_data.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class BookTicketFormView extends GetView<BusTicketController> {
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        decoration: Ui.getBoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_location,
                                        color: Color(0xffac68cd)),
                                    Column(
                                      children: List.generate(9, (index) {
                                        return Container(
                                            width: 1,
                                            height: 3,
                                            color: const Color(0xffac68cd),
                                            margin: const EdgeInsets.only(
                                                top: 2, bottom: 2));
                                      }),
                                    ),
                                    const Icon(Icons.add_location,
                                        color: Color(0xffac68cd)),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Obx(() {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Pickup Point'),
                                      const SizedBox(height: 5),
                                      Container(
                                              width: size.width * .5,
                                              height: size.width * .1,
                                              color: Colors.white,
                                        child: Text(controller.fromStation.value, style: TextStyle(fontSize: 16),),
                                            ),
                                      const SizedBox(height: 10),
                                      Container(
                                        width: size.width * .4,
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(height: 10),
                                      const Text('Drop Point'),
                                      const SizedBox(height: 5),
                                      Obx(() {
                                        return Container(
                                                width: size.width * .5,
                                                height: size.width * .1,
                                                color: Colors.white,
                                          child: Text(controller.toStation.value, style: TextStyle(fontSize: 16),),
                                              );
                                      }),
                                    ],
                                  );
                                }),
                              ],
                            ),
                            Obx(() {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                    height: size.width * .12,
                                    width: size.width * .12,
                                    decoration: Ui.getBoxDecoration(radius: 5),
                                    child: controller.searchTicket == true
                                        ? Container(
                                            height: 10,
                                            width: 10,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()))
                                        : Image.asset(
                                            "assets/eticket/Vector.png",
                                            color: Colors.white,
                                            height: 10,
                                            width: 10,
                                          )),
                              );
                            })
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                      DateFormat('MMMM d, y', 'en_US').format(controller.journeyDate.value),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  Text(
                                    controller.journeyTime.value.toString(),
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Seats",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Mobile No",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    controller.passengerPhoneController.value.text,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bus",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "S.Alam",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Seats",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    "E1, E2",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "From",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "Jessore Newmarket",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "To",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "Dhaka , Abdullahpur",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Passenger Informations",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: controller.passengerPhoneController.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phone No',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width * .4,
                      child: TextField(
                        controller: controller.passengerFirstNameController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'First Name',
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width * .4,
                      child: TextField(
                        controller: controller.passengerLastNameController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Last Name',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: controller.passengerEmailController.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: controller.passengerGenderController.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Gender',
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if(controller.passengerPhoneController.value.text == ""){
            Get.showSnackbar(Ui.ErrorSnackBar(message: "Please Input Phone No", title: 'error'.tr));

          }if(controller.passengerFirstNameController.value.text == ""){
            Get.showSnackbar(Ui.ErrorSnackBar(message: "Please Input First Name", title: 'error'.tr));

          }if(controller.passengerLastNameController.value.text == ""){
            Get.showSnackbar(Ui.ErrorSnackBar(message: "Please Input Last Name", title: 'error'.tr));

          }if(controller.passengerEmailController.value.text == ""){
            Get.showSnackbar(Ui.ErrorSnackBar(message: "Please Input Email", title: 'error'.tr));

          }if(controller.passengerGenderController.value.text == ""){
            Get.showSnackbar(Ui.ErrorSnackBar(message: "Please Input Gender", title: 'error'.tr));

          } else {
            controller.bookSeatController();

          }

        },
        child: Container(
          height: size.width * .15,
          decoration: Ui.getBoxDecoration(radius: 0),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            controller.seatBookLoading.value == true? CircularProgressIndicator():  Icon(Icons.arrow_forward, color: Colors.white)
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
