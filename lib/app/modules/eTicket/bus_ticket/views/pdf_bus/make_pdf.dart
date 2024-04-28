import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:latest_payplus_agent/common/custom_data.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<Uint8List> makePdfBus({String? journeyRoute,
DateTime? journeyDate,
String? busName,
String? amount,
int? id,
String? status,}
    ) async {
  final pdf = Document();
  final imageLogo = MemoryImage((await rootBundle.load('assets/Logo.png')).buffer.asUint8List());
  pdf.addPage(Page(
    pageFormat: PdfPageFormat.a5,
    build: (context) => Center(
      // child:
      // Text(text, style: TextStyle(fontSize: 48)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 40,
                width: 100,
                child: Image(imageLogo),
              )),
          Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("Ticket Purchase",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                )),
          ),
          Center(
            child: Text(
              "Payment Successful",
              style: TextStyle(fontSize: 20, color: PdfColors.green, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ticket Information : ",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bus Name.",
                            style: const TextStyle(
                              fontSize: 14,
                              color: PdfColors.deepPurple,
                            ),
                          ),
                          Text(
                            busName!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Journey Route",
                            style: const TextStyle(
                              fontSize: 14,
                              color: PdfColors.deepPurple,
                            ),
                          ),
                          Text(
                         journeyRoute!,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

               Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Journey Date",
                            style: const TextStyle(
                              fontSize: 14,
                              color: PdfColors.deepPurple,
                            ),
                          ),
                          Text(
                            DateFormat.yMMMd().format(journeyDate!) +
                                ' ' +
                                DateFormat.jm().format(journeyDate),
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount ",
                            style: const TextStyle(
                              fontSize: 14,
                              color: PdfColors.deepPurple,
                            ),
                          ),
                          Text(
                            amount!,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Powered by PayStation.",
              style: TextStyle(fontSize: 11, color: PdfColors.black, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),





    ),
  ));
  return pdf.save();
}

Widget PaddedText(
    final String text, {
      final TextAlign align = TextAlign.left,
    }) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
