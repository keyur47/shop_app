import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/controller.dart';
import 'homepage.dart';

class quantityScreen extends StatelessWidget {
  quantityScreen({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All History"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const HomePage());
        },
        child: const Icon(Icons.history),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:15,top:10,bottom:10,right:15),
            child: Table(
                border: TableBorder.all(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2),
                children:  [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "Name",
                            style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: const [
                          Text(
                            "Product",
                            style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "Quantity",
                            style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: const [
                          Text(
                            "Price",
                            style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "Total",
                            style:
                                TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                itemCount: homeController.data.value.length,
                itemBuilder: (context, index) {
                  final data = homeController.data.value[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 15,bottom: 4,right: 15),
                    child: Table(
                      // defaultColumnWidth: FixedColumnWidth(120.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${data.name?.substring(0, 1).toUpperCase()}${data.name?.substring(1).toLowerCase()}",
                                  textAlign: TextAlign.center,
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
                                   "${data.products?.substring(0,1).toUpperCase()}${data.products?.substring(1).toLowerCase()}",
                                  textAlign: TextAlign.center,
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
                                  "${data.quantity??""}",
                                  textAlign: TextAlign.center,
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
                                  "${data.price??""}",
                                  textAlign: TextAlign.center,
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
                                  textAlign: TextAlign.center,style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ])
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
