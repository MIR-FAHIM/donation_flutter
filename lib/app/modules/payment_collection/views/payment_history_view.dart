import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';

class PaymentHistoryView extends StatefulWidget {
  @override
  State<PaymentHistoryView> createState() => _PaymentHistoryViewState();
}

class _PaymentHistoryViewState extends State<PaymentHistoryView> {
  final _size = Get.size;

  // Future<Map<String, dynamic>> getPaymentHistory(String searchValue) async {
  //   var url =
  //       'http://103.219.160.235:8989/paystation/public/api/appapi/payment-collection-history';
  //   String token = Get.find<AuthService>().currentUser.value.token!;
  //   print(token);
  //   Map data = {"searchvalue": searchValue};
  //   Map res01;
  //   var response =
  //       await http.post(Uri.parse(url), headers: {'token': token}, body: data);
  //   var resp = json.decode(response.body);
  //   // setState(() {});

  //   return resp;
  // }

  Stream<dynamic> getPaymentHistory(String searchValue) async* {
    Map resp = {};
    var url =
        'http://103.219.160.235:8989/paystation/public/api/appapi/payment-collection-history';
    String token = Get.find<AuthService>().currentUser.value.token!;
    print(token);
    Map data = {"searchvalue": searchValue};

    var response =
        await http.post(Uri.parse(url), headers: {'token': token}, body: data);
    resp = json.decode(response.body);

    yield resp;
  }

  @override
  Widget build(BuildContext context) {
    String searchValue = "";

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF652981),
          title: Text('Transaction History'.tr),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: _size.width,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter Mobile No/ Transaction ID'.tr,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 35.0, top: 5),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/user.png',
                                          height: 50,
                                          width: 50,
                                          color: Color(0xFF652981),
                                        ),
                                        Container(
                                          width: _size.width * .4,
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            initialValue: '',
                                            onChanged: (input) {
                                              searchValue = input;
                                            },
                                            validator: (input) => input!
                                                        .length <
                                                    11
                                                ? 'Please provide valid phone number'
                                                    .tr
                                                : null,
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xFF652981),
                                            ),
                                            obscureText: false,
                                            textAlign: TextAlign.start,
                                            cursorColor: Color(0xFF652981),
                                            decoration: InputDecoration(
                                              hintText: '01xxxxxxxxx',
                                              hintStyle: TextStyle(
                                                fontSize: 20,
                                                color: Colors.grey,
                                              ),
                                              focusColor: Color(0xFF652981),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: IconButton(
                                      onPressed: () {
                                        getPaymentHistory(searchValue);
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        size: 30,
                                        color: Color(0xFF652981),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(children: [
                    StreamBuilder(
                        stream: getPaymentHistory(searchValue),
                        builder: (ctx, snapshot) {
                          if (snapshot.hasData) {
                            var paymentData = snapshot.data as Map;

                            var paymentDetail = paymentData['data'];

                            return Container(
                              width: _size.width,
                              height: MediaQuery.of(context).size.height * 0.85,
                              child: ListView.builder(
                                  itemCount: paymentDetail.length,
                                  itemBuilder: (context, index) {
                                    print(paymentDetail[index]['cust_name']);

                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        elevation: 5,
                                        child: Container(
                                          // height: _size.width * .2,
                                          width: _size.width,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .grey.shade100,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Image.asset(
                                                            'assets/images/user.png',
                                                            height: 35,
                                                            width: 35,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        width:
                                                            _size.width * .50,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              paymentDetail[
                                                                      index]
                                                                  ['cust_name'],
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color: Color(
                                                                    0xFF652981),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            // Text(
                                                            //   DateFormat.yMMMd().format(
                                                            //           DateTime.parse(controller
                                                            //               .transactionReport[
                                                            //                   index]
                                                            //               .trxTime
                                                            //               .toString())) +
                                                            //       ' ' +
                                                            //       DateFormat.jm().format(
                                                            //           DateTime.parse(controller
                                                            //               .transactionReport[
                                                            //                   index]
                                                            //               .trxTime
                                                            //               .toString())),
                                                            //   style: TextStyle(
                                                            //     fontSize: 12,
                                                            //   ),
                                                            // ),
                                                            Text(
                                                              DateFormat.yMMMd().format(
                                                                      DateTime.parse(
                                                                          paymentDetail[index]
                                                                              [
                                                                              'trx_time'])) +
                                                                  ' ' +
                                                                  DateFormat
                                                                          .jm()
                                                                      .format(DateTime.parse(
                                                                          paymentDetail[index]
                                                                              [
                                                                              'trx_time'])),
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Phone : " +
                                                                  paymentDetail[
                                                                          index]
                                                                      [
                                                                      'cust_phone'],
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                              ),
                                                              maxLines: 1,
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "Invoice No : " +
                                                                  paymentDetail[
                                                                          index]
                                                                      [
                                                                      'invoice_number'],
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                              ),
                                                              maxLines: 1,
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        paymentDetail[index]
                                                            ['payment_method'],
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        paymentDetail[index]
                                                            ['amount'],
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Color(0xFF652981),
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
                                    );
                                  }),
                            );
                          } else
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                        })
                  ]),
                )
              ],
            )));
  }
}
