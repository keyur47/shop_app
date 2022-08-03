import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/helper/shared_preferences.dart';
import 'package:shop_app/model/model.dart';

class HomeController extends GetxController {
  RxList<Data> data = <Data>[].obs;
  RxList getAllData = [].obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  RxBool isValue = false.obs;
  SharedPreferences? prefs;
  Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getIntoInit();

    /// getString
    // if(SharedPrefs.getString("chatModal") != "") {
    //   final Iterable l = json.decode(SharedPrefs.getString("chatModal"));
    //   final List<Data> posts =
    //   List<Data>.from(l.map((model) => Data.fromJson(model)));
    //
    //   data.clear();
    //   data.addAll(posts);
    // }
  }

  initPreference() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  getIntoInit() async {
    try {
      await initPreference();
      data.clear();
      final List<String>? items = prefs?.getStringList('UserList');
      if (items != null) {
        isValue.value = true;
        for (var element in items) {
          Data userData = Data.fromJson(json.decode(element));
          data.add(userData);
        }
        isValue.value = false;
      }
    } catch (e) {
      print("error in get$e");
    }
  }

  //
  // AppPreference.setString("chatModal", json.encode(chatModel));
  // final Iterable l = json.decode(AppPreference.getString("chatModal"));
  // final List<ChatModel> posts =
  // List<ChatModel>.from(l.map((model) => ChatModel.fromJson(model)));
  //
  // chatModel.clear();
  // chatModel.addAll(posts);
/// save
//   void save() {
//     SharedPrefs.setString("chatModal", json.encode(data));
//     final Iterable l = json.decode(SharedPrefs.getString("chatModal"));
//     final List<Data> posts =
//         List<Data>.from(l.map((model) => Data.fromJson(model)));
//     data.clear();
//     data.addAll(posts);
//   }

  Future<void> saveSP() async {
    Data userData = Data(
        name: nameController.text.toString(),
        product: productNameController.text.toString(),
        price: int.parse(priceController.text),
        quantity: int.parse(quantityController.text),
        total: int.parse(priceController.text) *
            int.parse(quantityController.text),
        time: isTime(),
        isDate: isDate());
    data.add(userData);
    await setPref();
  }

  Future setPref() async {
    await initPreference();
    List<String> abc = [];
    for (var element in data) {
      abc.add(json.encode(element));
    }
    prefs?.setStringList('UserList', abc);
  }

  clearController() {
    nameController.clear();
    productNameController.clear();
    priceController.clear();
    quantityController.clear();
  }

  isTime() {
    final DateFormat formatter = DateFormat('hh:mm a');
    final String formatted = formatter.format(DateTime.now());
    return formatted;
  }

  isDate() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(selectedDate.value);
    return formatted;
  }

  void presentDatePicker(context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      selectedDate.value = pickedDate;
    });
  }
Future<void> updateSP({required int index,required int price,required int quantity,required String name}) async {
  Data userData = Data(
      name: name,
      price: int.parse(price.toString()),
      quantity: int.parse(quantity.toString()),
      time: isTime(),
      isDate: isDate());

  data.removeAt(index);
  data.insert(index, userData);
  await setPref();
}


}

// Obx(
// () => TextFormField(
// readOnly: true,
// keyboardType: TextInputType.text,
// onTap: () async {
// controller.presentDatePicker(context);
// },
// decoration: InputDecoration(
// // contentPadding:
// // const EdgeInsets.only(top: 5, left: 12, right: 12, bottom: 5),
// focusedBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(10),
// borderSide: BorderSide.none),
// enabledBorder: OutlineInputBorder(
// borderRadius: BorderRadius.circular(10),
// borderSide: BorderSide.none),
// border: InputBorder.none,
// filled: true,
// fillColor: Colors.blue,
// hintText: controller.selectedDate.value != null
// ? DateFormat('yyyy-MM-dd')
// .format(controller.selectedDate.value)
// : controller.isDate(),
// ),
// ),
// )
