import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/views/bus_seat_book_view.dart';
import 'package:latest_payplus_agent/common/custom_data.dart';
import 'package:latest_payplus_agent/common/ui.dart';
import '../../bus_ticket/controllers/bus_ticket_controller.dart';

class BusTicketSearchResultView extends GetView<BusTicketController> {
  @override
  Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
           Text(
            "Total Coach: ${controller.coachList.length}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
              itemCount: controller.coachList.length,
                itemBuilder: (BuildContext context, int index){
                  // var data =  controller.coachList.value!.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        width: size.width,
                        //padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                        decoration: Ui.getBoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: size.width * .1,
                                  width: size.width * .35,
                                  decoration: Ui.getBoxDecoration(radius: 0),
                                  alignment: Alignment.center,
                                  child:  Text(
                                    '${controller.coachList[index].details.availableSeats.toString()} seat available',
                                    style: TextStyle(color: Colors.white, fontSize: 15),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    height: size.width * .1,
                                    width: size.width * .2,
                                    decoration: Ui.getBoxDecoration(radius: 0),
                                    alignment: Alignment.center,
                                    child: controller.coachList[index].details.busType == "1" ? Text(
                                      'AC',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ) : Text(
                                      'Non-AC',
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: size.width * .15,
                                        width: size.width * .15,
                                        decoration: Ui.getBoxDecoration(radius: 100, color: const Color(0xffac68cd).withOpacity(.3)),
                                        child: const Icon(CupertinoIcons.bus, color: Color(0xffac68cd)),
                                      ),
                                       SizedBox(width: 5),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          Text(
                                            controller.coachList[index].tripRoute.companyName,
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                          //SizedBox(height: 10),
                                          Text(
                                            DateTime.parse(controller.coachList[index].details.arrivalDate +"T"+controller.coachList[index].details.arrivalTime).difference(DateTime.parse(controller.coachList[index].details.departureDate+"T"+controller.coachList[index].details.departureTime)).inHours.toString() + "hrs",
                                            style: TextStyle(color: Colors.grey, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children:  [
                                      controller.coachList[index].details.busType == "1" ?   Text(
                                        'Ticket price: ${controller.coachList[index].tripRoute.businessClassFare}',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 11),
                                      ):  Text(
                                        'Ticket price: ${controller.coachList[index].tripRoute.economyClassFare}',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 11),
                                      ),
                                      //SizedBox(height: 10),
                                      Text(
                                        "Class",
                                        style: TextStyle(color: Colors.grey, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      Text(
                                        'Starting Time',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 11),
                                      ),
                                      //SizedBox(height: 10),
                                      Text(
                                          DateFormat.jm().format(DateFormat("hh:mm:ss").parse(controller.coachList[index].tripRoute.departureTime)),

                                        style: TextStyle(color: Colors.grey, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:  [
                                      Text(
                                        'Arrival Time',
                                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 11),
                                      ),
                                      //SizedBox(height: 10),
                                      Text(
                                        DateFormat.jm().format(DateFormat("hh:mm:ss").parse(controller.coachList[index].tripRoute.arrivalTime)),

                                        style: TextStyle(color: Colors.grey, fontSize: 11),
                                      ),
                                    ],
                                  ),
                                  Obx(() {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.tripId.value = controller.coachList[index].tripId!.toString();
                                          controller.tripROuteId.value = controller.coachList[index].tripRouteId!.toString();
                                          controller.busName.value = controller.coachList[index].datumsOperator!.companyName.toString();
                                          controller.boardingPointIDs.value = controller.coachList[index].boardingPoints![index].tripPointId.toString();
                                          controller.index.value = index;
                                          controller.getSeatLayout(0);





                                        },
                                        child: Container(
                                          height: size.width * .13,
                                          width: size.width * .3,
                                          decoration: Ui.getBoxDecoration(radius: 0),
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Row(
                                            children:  [
                                              controller.bookNowClicked.value == true &&  controller.index.value == index ? CircularProgressIndicator() :
                                              Text(
                                                'Book Now',
                                                style: TextStyle(color: Colors.white, fontSize: 15),
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                }),
            // children: List.generate(5, (index) {

            // }),
          ),
          const SizedBox(height: 10),
        ],
      );
  }
}
