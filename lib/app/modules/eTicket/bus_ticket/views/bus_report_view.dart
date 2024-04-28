import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/controllers/bus_ticket_controller.dart';
import 'package:latest_payplus_agent/app/modules/eTicket/bus_ticket/views/pdf_bus/pdf_preview.dart';
import 'package:latest_payplus_agent/app/pdfexport/pdfpreview.dart';
import 'package:latest_payplus_agent/app/routes/app_pages.dart';
import 'package:latest_payplus_agent/common/Color.dart';
import 'package:latest_payplus_agent/common/custom_data.dart';
import 'package:latest_payplus_agent/common/ui.dart';


class BusReportReportView extends GetView<BusTicketController> {
  const BusReportReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF652981),
        title: Text('Bill History'.tr),
        centerTitle: true,

      ),
      body: Obx(() {
        if (controller.billReportLoaded.isTrue) {
          return controller.busReportList.value!.where((element) => element.status == "PAID").isEmpty ?
              Center(child: Text("You did not purchase any ticket yet."))
              :SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: List.generate(controller.busReportList.value!.where((element) => element.status == "PAID").length, (index) {
                var data = controller.busReportList.value.where((element) => element.status == "PAID").toList()[index];
                return GestureDetector(
                  onTap: () {
                //    Get.toNamed(Routes.BILL_DETAILS, arguments: controller.busReportList.value[index].id.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: SizedBox(
                        height: size.width * .35,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width*.37,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [


                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          data.busName,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ), SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          data.journeyRoute,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Status: ${data.status}',
                                          style:  TextStyle(
                                              fontSize: 13,
                                              color: AppColors.primaryColor
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width*.35,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [

                                        Text(
                                          DateFormat.yMMMd().format(data.journeyDate!) +
                                              ' ' +
                                              DateFormat.jm().format(data.journeyDate),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          uniCodeTk + ' ' + data.amount!.toString(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {

                                      Get.to(PdfPreviewPageBus(
                                        journeyDate: data.journeyDate,
                                     journeyRoute:  data.journeyRoute,
                                       busName: data.busName,
                                       amount: data.amount,
                                       status: data.status,
                                     id: data.id,


                                      ));
                                    },
                                    child: Container(
                                      width: size.width * .5,
                                      height: size.width * .08,
                                      decoration: Ui.getBoxDecoration(
                                          color: AppColors.primarydeepLightColor, radius: 10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.print,
                                                size: 15,
                                                color:
                                                AppColors.primaryColor, //The color which you want set.
                                              ),
                                              // Image.asset(
                                              //   "assets/sales/sale_from_list.png",
                                              //   width: 20,
                                              //   height: 20,
                                              // ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Text(
                                                  'Print/Share/Save',
                                                  style: TextStyle(fontSize: 12, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Icon(
                                                Icons.download,
                                                size: 15,
                                                color:
                                                AppColors.primaryColor, //The color which you want set.
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        } else {
          return SizedBox(
            height: Get.size.height,
            child: Center(
              child: Ui.customLoader(),
            ),
          );
        }
      }),
    );
  }
}
