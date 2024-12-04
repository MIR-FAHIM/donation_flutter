import 'package:donation_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:donation_flutter/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class DataTableWidget extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        return Container(
          width: Get.width,
          child: DataTable(

            dividerThickness: 1,
            columnSpacing: 6,
            columns: [
              DataColumn(label: Text('Date', style: TextStyle(fontSize: 12),)),
              DataColumn(label: Text('Project', style: TextStyle(fontSize: 12),)),
              DataColumn(label: Text('Acc No', style: TextStyle(fontSize: 12),)),
              DataColumn(label: Text('Amount', style: TextStyle(fontSize: 12),)),
              DataColumn(label: Text('Accepted?', style: TextStyle(fontSize: 12),)),
            ],
            rows: controller.donationByUserList
                .value! // Loops through dataColumnText, each iteration assigning the value to element
                .map(
              ((element) => DataRow(
                color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      // Set color based on selected state
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.primaryColor
                            .withOpacity(0.5); // Color when selected
                      }
                      return Colors.green
                          .withOpacity(.1); // Use default color
                    }),
                cells: <DataCell>[
                  DataCell(
                    Text(
                      DateFormat('yMMMMd').format(element.createdAt!),
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  DataCell(Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 0.0), // Add padding to Service cell

                    width: Get.width *
                        0.15, // Adjust width to give more space to Service
                    child: Text(element!.projectId.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 10)),
                  )),
                  DataCell(Container(
                    width: Get.width * 0.15,
                    child: Text(element.accountNum!.toString(),
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal)),
                  )),
                  DataCell(Container(
                    width: Get.width * 0.1,
                    child: Text(element.amount.toString(),
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal)),
                  )),
                  DataCell(
                      element.status == 0 ?
                      Container(
                        width: Get.width * 0.1,
                        child: Text("No",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue)),
                      )
                      :
                      Container(
                        width: Get.width * 0.1,
                        child: Text("Yes",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.blue)),
                      )
                  ),
                ],
              )),
            )
                .toList(),
          ),
        );
      }),
    );
  }
}
