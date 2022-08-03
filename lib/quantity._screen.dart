import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controller/controller.dart';
import 'homepage.dart';

class quantityScreen extends StatelessWidget {
  quantityScreen({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());


  // void add(Data data) {
  //   controller.data.add(data);
  //   notifyListeners();
  // }

  // data(){
  //   for (var item in controller.data) {
  //     if(item.name){
  //       item.quantity = item.quantity;
  //     }else{
  //
  //     }
  //   }
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(HomePage());
        },
        child: Icon(Icons.history),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only( left: 15,top: 10, bottom: 10),
            child: Table(
                // border:TableBorder.all(width: 1.0,color: Colors.grey),
                children: const [
                  TableRow(children: [
                    // Text(
                    //   "Date",
                    //   style:
                    //       TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    //   textAlign: TextAlign.start,
                    // ),
                    Text(
                      "Name",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Quantity",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      "Price",
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
                  ]),
                ]),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.data.value.length,
                itemBuilder: (context, index) {
                  final data = controller.data.value[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 15,top: 10, bottom: 10),
                    child: Table(
                      children: [
                        TableRow(children: [
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text(
                          //       data.isDate ?? " ",
                          //       textAlign: TextAlign.center,
                          //     ),
                          //   ],
                          // ),
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
                                "${data.quantity??""}",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data.price??""}",
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
