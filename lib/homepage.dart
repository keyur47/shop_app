import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/controller/controller.dart';
import 'add.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  ///totalCost
  double get totalCost {
    double total = 0;
    for (var item in homeController.data) {
      total += double.parse(item.price.toString())* double.parse(item.quantity.toString());
    }
    return total;
  }


  ///selectedDate
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
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
                  TextFormField(
                      readOnly: true,
                      keyboardType: TextInputType.text,
                      onTap: () async {
                        _selectDate(context);
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
                        hintStyle: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),
                        // ignore: unnecessary_null_comparison
                        hintText: selectedDate != null
                            ? DateFormat('yyyy-MM-dd')
                                .format(selectedDate)
                            : homeController.isDate(),
                      ),
                    ),
                   Padding(
                    padding: const EdgeInsets.only(bottom: 13, left: 15),
                    child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back,color: Colors.white,)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10, top: 10, bottom: 10),
              child: Table(
                  border: TableBorder.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2),
                  // border:TableBorder.all(width: 1.0,color: Colors.grey),
                  children:  [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: const [
                            Text(
                              "Date",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: const [
                            Text(
                              "Name",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: const [
                            Text(
                              "Product",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: const [
                            Text(
                              "Total",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: const [
                            Text(
                              "Delete",
                              style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ]),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: homeController.data.length,
                  itemBuilder: (context, index) {
                    final data = homeController.data[index];
                    return DateFormat('yyyy-MM-dd').format(selectedDate) ==
                            homeController.data[index].isDate
                        ? Padding(
                            padding:
                                const EdgeInsets.only(left: 10,right: 10, bottom: 5),
                            child: Table(
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              border: TableBorder.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 2),
                              children: [
                                TableRow(
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          data.isDate ?? " ",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          data.time ?? " ",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          //data.name??"",
                                           "${data.name?.substring(0, 1).toUpperCase()}${data.name?.substring(1).toLowerCase()}",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 16),

                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          //data.products??"",
                                           "${data.products?.substring(0, 1).toUpperCase()}${data.products?.substring(1).toLowerCase()}",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 16),

                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${double.parse(data.price.toString())* double.parse(data.quantity.toString())}",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 16,color: Colors.red),

                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        homeController.data.removeAt(index);
                                        await homeController.setPref();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 3),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.delete,
                                              size: 22,
                                            ),
                                          ],
                                        ),
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
            Align(
                alignment: Alignment.bottomLeft,
                child:  Padding(
                  padding:  const EdgeInsets.only(bottom: 20,left: 20),
                  child: Container(
                      decoration: BoxDecoration(
                      color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("\$ ${totalCost.toString()}",style: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w700),),
                      )),
                )),

          ],
        ),
    );
  }
}
