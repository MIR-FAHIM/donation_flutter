import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/models/buticket_model/book_ticket_model.dart';
import 'package:latest_payplus_agent/app/models/buticket_model/coach_details_seat_layout_model.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/views/bus_seat_book_view.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/views/ready_ticket_view.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/views/ticket_preview.dart';

import 'package:latest_payplus_agent/app/repositories/ticket_repository.dart';
import 'package:latest_payplus_agent/common/ui.dart';

import '../../../../models/buticket_model/coachList_model.dart';
import '../../../../models/buticket_model/stationlist_model.dart';

class BusTicketController extends GetxController {
  //TODO: Implement BusTicketController

  ///date & time
  final journeyDate = DateTime.now().obs;
  final journeyTime = TimeOfDay.now().obs;
  final searchTicket = false.obs;
  final seatBookLoading = false.obs;
  final coachList = <Datums>[].obs;
  final fromLocationId = "".obs;
  final ref = "".obs;
  final bookNowClicked = false.obs;
  final index = 0.obs;
  final seatBookedView = false.obs;
  final tripId = "".obs;
  final tripROuteId = "".obs;
  final ticketIDs = "".obs;
  final boardingPointIDs = "".obs;
  final fromStation = "".obs;
  final seatId = "".obs;
  final busName = "".obs;
  final busModel = "".obs;
  final seatFare = "".obs;
  final serviceCharge = 0.obs;


  final toStation = "".obs;
  final nameController = TextEditingController().obs;
  final passengerFirstNameController = TextEditingController().obs;
  final passengerLastNameController = TextEditingController().obs;
  final passengerPhoneController = TextEditingController().obs;
  final passengerGenderController = TextEditingController().obs;
  final passengerEmailController = TextEditingController().obs;


  final allSeats = <Seat>[].obs;

  RxList<RxList<Layout>> seatLayout = <RxList<Layout>>[].obs;
  //final seatLayout  = <Layout>[].obs;
  final fromLocationList = StationList().obs;
  // final toLocationList = BusTicketToLocationModel().obs;
  // final coachList = GetCoachListModel().obs;
  final loadFrom = true.obs;
  final loadTo = true.obs;

  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: journeyDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      helpText: 'Select Journey Date',
      fieldHintText: 'Month/Date/Year',
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (pickedDate != null && pickedDate != journeyDate.value) {
      journeyDate.value = pickedDate;
    }
  }

  chooseTime() async {
    print("uuuuuuu");
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: journeyTime.value,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!);
      },
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'Select Time',
      errorInvalidText: 'Provide valid time',
      hourLabelText: 'Select Hour',
      minuteLabelText: 'Select Minute',
    );
    if (pickedTime != null && pickedTime != journeyTime.value) {
      journeyTime.value = pickedTime;
    }
  }

  getFromLocation() async {
    print("ppppppp");
    loadFrom.value = false;
    TicketRepository().getFromLocation().then((response) {
      loadFrom.value = true;

      fromLocationList.value = response;
    }).catchError((onError) {
      loadFrom.value = true;
    });
  }

  getAllCoachList(DateTime date, String fromCode, String toCode) async {
    print("all coach called");
    coachList.value.clear();
    searchTicket.value = true;
    TicketRepository().getCoachList(journeyDate.value, fromStation.value, toStation.value).then((response) {
      coachList.value = response.data.values.map((datum) => datum).toList();

      print("fahim coach list ++++++ ${coachList.value.length.toString()}");
      searchTicket.value = false;

      //coachList.value = response;
      //print("fahim coach list ++++++ ${coachList.value.data!.length}");
    }).catchError((onError) {
      searchTicket.value = false;
    });
  }

  seatStatusController() {
    seatBookLoading.value = true;

    seatBookLoading.value = true;
    TicketRepository().seatStatus(seatId.value, ticketIDs.value, tripROuteId.value).then((value) {
      print("hlw bro ++++++++++++++ $value");
      if(value["data"] != null){
        print("ppppppppppppppppp hlw br from book seat from controller");


        getSeatLayout(1);

    }});

  }
  bookSeatController() {
    seatBookLoading.value = true;


    TicketRepository().bookSeat(tripID: tripId.value, tripRouteID: tripROuteId.value,
        ticketID: ticketIDs.value, boardingPointID: boardingPointIDs.value,
    passengerFirstName: passengerFirstNameController.value.text, email: passengerEmailController.value.text,
        mobile: passengerPhoneController.value.text, gender: passengerGenderController.value.text ).then((value) {
      print("hlw bro confirm book ++++++++++++++ $value");
      if(value["data"] != null){
        print("ppppppppppppppppp hlw br from book seat from controller");
        var data = BookTicketModel.fromJson(value);
        ref.value = data.data.reservationRef;
        print("hlw bro book or reserve the ticket +++++++++ ${ref.value}");
        seatBookLoading.value = false;
        if(ref.value== ""){
          Get.showSnackbar(Ui.ErrorSnackBar(
              message:"Can not book ticket", title: 'Error'.tr));
        }else {
          Get.to(TicketPreview());
        }






      }});

  }
  confirmBookedSeat() {
    seatBookLoading.value = true;

    seatBookLoading.value = true;
    TicketRepository().confirmBookSeat(ref.value).then((value) {
      print("hlw bro confirm book ++++++++++++++ $value");
      if(value["data"] != null){
        print("ppppppppppppppppp hlw br from book seat from controller");
        Get.to(ReadyTicketView());


      }});

  }
  getSeatLayout(int page) {
    seatLayout.clear();

    bookNowClicked.value = true;
    print("seat layout calling from controller");
    TicketRepository().getCoachDetailsSeatLayout(tripRouteID: tripROuteId.value, tripID: tripId.value , fromStation: fromStation.value,
        toStation: toStation.value, date: journeyDate.value).then((response) {


      print("ppppppp ++++++++ resposne from controller of seatlayout $response");
      allSeats.value = response.data.seats;
      allSeats.forEach((element) {
        print("bro rbro brro rbro ++++++++ ${element.layout![0]}");
        for (List<Layout> subList in element.layout) {
          RxList<Layout> rxSubList = subList.obs;
          seatLayout.add(rxSubList);
          print("yo bro ++++++++ ${seatLayout.length.toString()}");
        }
      });

      if (seatLayout.isNotEmpty) {
        if(page == 1){
          seatBookedView.value = true;
        }
        bookNowClicked.value = false;
        print("I am going to busseat bboking view now +++++++++++++++++++++++");
        seatBookLoading.value = false;
        Get.to(BusSeatBookView());
      }
    }).catchError((onError) {
      seatBookLoading.value = false;
      bookNowClicked.value = false;
    });

    return 0;

  }

  // getToLocation(code) async {
  //
  //   loadTo.value = false;
  //   TicketRepository().getToLocation(code).then((response) {
  //     print("to location $response");
  //     loadTo.value = true;
  //
  //     toLocationList.value = response;
  //
  //   }).catchError((onError) {
  //     loadTo.value = true;
  //   });
  // }
  @override
  void onInit() {
    super.onInit();
    print("puku puku");
    getFromLocation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
