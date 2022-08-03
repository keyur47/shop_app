import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/controller/controller.dart';

import 'add.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());

  // double get totalCost {
  //   double total = 0;
  //   for (var item in controller.data) {
  //     total += int.parse(item.price.toString()) * int.parse(item.quantity.toString());
  //     print("total:- ${double.parse(item.total.toString())}");
  //     print("total1:- ${total}");
  //   }
  //   return total;
  // }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Add());
        },
        child: const Icon(Icons.add_circle),
      ),
      body: Column(
          children: [
            Container(
              color: Colors.blue,
              height: 85,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Obx(
                    () => TextFormField(
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      onTap: () async {
                        controller.presentDatePicker(context);
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 12, right: 18),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.blue,
                        hintText: controller.selectedDate.value != null
                            ? DateFormat('yyyy-MM-dd')
                                .format(controller.selectedDate.value)
                            : controller.isDate(),
                      ),
                    ),
                  ),
                  // Obx(()=>
                  //    Padding(
                  //     padding: const EdgeInsets.only(bottom: 5, left: 10),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //           color: Colors.red,
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Text("Total:- ${totalCost}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10, bottom: 10),
              child: Table(
                  // border:TableBorder.all(width: 1.0,color: Colors.grey),
                  children: const [
                    TableRow(children: [
                      Text(
                        "Date",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Name",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Total",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Delete",
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                    ]),
                  ]),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    final data = controller.data[index];
                    return DateFormat('yyyy-MM-dd').format(controller.selectedDate.value) ==
                            controller.data[index].isDate
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 25, top: 10, bottom: 10),
                            child: Table(
                              children: [
                                TableRow(children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.isDate ?? " ",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data.name??"",
                                        // "${data.name?.substring(0, 1).toUpperCase()}${data.name?.substring(1).toLowerCase()}",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${double.parse(data.price.toString())* double.parse(data.quantity.toString())}",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        controller.data.removeAt(index);
                                        // SharedPrefs.setString("chatModal", json.encode(controller.data));
                                        await controller.setPref();
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.delete,
                                            size: 22,
                                          ),
                                        ],
                                      ))
                                ])
                              ],
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
    );
  }
}
