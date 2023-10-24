import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:latest_payplus_agent/app/modules/bill_payment/views/Gas/Jalalabad_form_view.dart';
import 'package:latest_payplus_agent/app/modules/bill_payment/views/Gas/bakhrabad_gas_form_view.dart';
import 'package:latest_payplus_agent/app/modules/bill_payment/views/Gas/paschimanchal_gas_form_view.dart';
import 'package:latest_payplus_agent/app/services/auth_service.dart';
import 'package:latest_payplus_agent/common/ui.dart';

class GasBillerList extends GetView {
  final _size = Get.size;
  var _id = Get.arguments['id'];
  var _title = Get.arguments['title'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: Color(0xFF652981),
          centerTitle: true,
          title: Text(_title),
          elevation: 0,
          // actions: [
          //   IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         CupertinoIcons.bell,
          //         color: Colors.white70,
          //       )),
          // ],
        ),
      ),
      body: FutureBuilder(
          future: getBillerList(_id),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              final datas = snapshot.data as Map;
              var billerList = datas['data'];
              // print(billerList[1]['bill_code']);
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(billerList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        var data = {"title": billerList[index]['name'], "images": billerList[index]['image']};
                        if (billerList[index]['bill_code'] == 'jalalabad_gas') {
                          Get.to(JalalabadGasFormView(), arguments: data);
                        } else if (billerList[index]['bill_code'] == 'bakhrabad_gas') {
                          Get.to(BakhrabadGasFormView(), arguments: data);

                          // Get.toNamed(Routes.Desco_Postpaid_List_View);
                        } else if (billerList[index]['bill_code'] == 'paschimanchal_gas') {
                          Get.to(PashchimanchalFormView(), arguments: data);

                          // Get.toNamed(Routes.Desco_Postpaid_List_View);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Container(
                          width: _size.width,
                          decoration: Ui.getBoxDecoration(
                            color: Colors.white,
                            radius: 5,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.network(
                                    billerList[index]['image'],
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    billerList[index]['name'],
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<Map<dynamic, dynamic>> getBillerList(int id) async {
    print(id);
    Map data = {
      'type_id': id.toString(),
    };
    String token = Get.find<AuthService>().currentUser.value.token!;

    // var headers = {'token': 'fd9znFAAo6L8BQh6zPxefNLppzrAJzqUzczmRjCa'};

    var headers = {'token': token};
    // var url =
    //     'http://103.219.160.235:8989/paystation/public/api/appapi/billpay/biller-list';
    var url = 'https://shl.com.bd/api/appapi/billpay/biller-list';

    // var body = json.encode(data);

    var response = await http.post(Uri.parse(url), headers: headers, body: data);
    var resp = json.decode(response.body);
    print('Bill List : $resp');
    return resp;
  }
}
