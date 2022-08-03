import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/controller/controller.dart';
import 'package:shop_app/widget.dart';

class Add extends StatelessWidget {
  Add({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          color: Colors.blue,
          height: 85,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Obx(
                () => TextFormField(
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  onTap: () async {
                    homeController.presentDatePicker(context);
                  },
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 12, right: 18),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.blue,
                    hintText: homeController.selectedDate.value != null
                        ? DateFormat('yyyy-MM-dd')
                            .format(homeController.selectedDate.value)
                        : homeController.isDate(),
                  ),
                ),
              )
            ],
          ),
        ),
        customTextField(
          name: "Name",
          controller: homeController.nameController,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        customTextField(
          name: "Product name",
          controller: homeController.productNameController,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        customTextField(
          name: "Price",
          controller: homeController.priceController,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          textInputType: TextInputType.number,
          InputFormatters: [
            FilteringTextInputFormatter(RegExp(r'[.0-9]'), allow: true)
          ],
        ),
        customTextField(
          name: "Quantity",
          controller: homeController.quantityController,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          textInputType: TextInputType.number,
          InputFormatters: [
            FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customSubmitButton(
                  text: "Submit",
                  color: Colors.yellow,
                  onTap: () async {
                    if (homeController.data.value.isNotEmpty) {
                      var index = homeController.data.indexWhere((p0) =>
                          homeController.nameController.text == p0.name);
                      log('index  $index');
                      if (index != -1) {
                        var index = homeController.data.indexWhere((p0) => homeController.nameController.text == p0.name);
                        homeController.data[index].price = (homeController.data[index].price ?? 0) + int.parse(homeController.priceController.text);
                        homeController.data[index].quantity = (homeController.data[index].quantity ?? 0) + int.parse(homeController.quantityController.text);
                        homeController.updateSP(index: index,name: homeController.data[index].name.toString(),price: int.parse(homeController.data[index].price.toString()),quantity: (homeController.data[index].quantity ?? 0));
                        homeController.clearController();
                        Get.back();
                        log("index--:$index");
                      } else {
                        homeController.saveSP();
                        log("Savep:-${homeController.saveSP}");
                        homeController.clearController();
                        Get.back();
                      }
                    } else {
                      homeController.saveSP();
                      homeController.clearController();
                      Get.back();
                    }

                    ///
                    // for (var element in homeController.data) {
                    //   log("element:- ${element.toString()}");
                    //   log("element:name- ${element.name}");
                    //   log("element:homeController.nameController.text- ${homeController.nameController.text}");
                    //   if (element.name == homeController.nameController.text) {
                    //     log("modalname:- ${element.name}");
                    //     var index = homeController.data
                    //         .indexWhere((p0) => homeController.nameController.text == p0.name);
                    //     homeController.data.value[index].price =
                    //         (homeController.data.value[index].price ?? 0) +
                    //             int.parse(
                    //                 homeController.priceController.text);
                    //     homeController.data.value[index].quantity =
                    //         (homeController.data.value[index].quantity ?? 0) +
                    //             int.parse(
                    //                 homeController.quantityController.text);
                    //     log("index--:${element.name}");
                    //     Get.back();
                    //     log("index--:${index}");
                    //   } else if(element.name != homeController.nameController.text) {
                    //     homeController.saveSP();
                    //     log("logbook1233");
                    //     Get.back();
                    //   }
                    // }

                    ///
                    // for (var element in homeController.data.value) {
                    //   log("element:- ${element.toString()}");
                    //   log("element:name- ${element.name}");
                    //   log("element:homeController.nameController.text- ${homeController.nameController.text}");
                    //   if (element.name == homeController.nameController.text) {
                    //     log("modalname:- ${element.name}");
                    //     var index = homeController.data
                    //         .indexWhere((p0) => element.name == p0.name);
                    //     homeController.data.value[index].price =
                    //         (homeController.data.value[index].price ?? 0) +
                    //             int.parse(homeController.priceController.text);
                    //     homeController.data.value[index].quantity =
                    //         (homeController.data.value[index].quantity ?? 0) +
                    //             int.parse(
                    //                 homeController.quantityController.text);
                    //     log("index--:${element.name}");
                    //     Get.back();
                    //     log("index--:${index}");
                    //   } else {
                    //     homeController.saveSP();
                    //     log("logbook1233");
                    //     Get.back();
                    //   }
                    //   // homeController.clearController();
                    //
                    //   ///
                    //   // }else{
                    //   //   controller.saveSP();
                    //   //   controller.clearController();
                    //   //   Get.back();
                    //   // }
                    //
                    //   log("message1");
                    //   // for (var e in controller.data){
                    //   //   log("message2");
                    //   //   log("message24${e.name}");
                    //   //   if(e.name == controller.name.text){
                    //   //     log("message3");
                    //   //     controller.updateSP();
                    //   //   }
                    //   //   else{
                    //   //     log("message4");
                    //   //     await controller.saveSP();
                    //   //     controller.clearController();
                    //   //     Get.back();
                    //   //   }
                    //   // }
                    //   // if(controller.name== ) {
                    //   // //
                    //   // // }
                    //   // // else {
                    //   //   await controller.saveSP();
                    //   // // }
                    //   // controller.clearController();
                    //   // Get.back();
                    // }
                  }),
              customSubmitButton(
                  text: "Clear",
                  color: Colors.red,
                  onTap: () async {
                    homeController.clearController();
                  }),
            ],
          ),
        ),
      ]),
    );
  }
}
