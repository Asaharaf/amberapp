import 'dart:convert';

import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/components/text_field_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart';

class ProductSearch extends StatefulWidget {
  const ProductSearch({Key? key}) : super(key: key);

  @override
  _ProductSearchState createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  List data = [];
  String _data = "";
  final TextEditingController _barcodeController = TextEditingController();
  //TextEditingController _productName = TextEditingController(text: element['ProductName']);
  // TextEditingController _unit = TextEditingController();
  // TextEditingController _cost = TextEditingController();
  // TextEditingController _retailPrice = TextEditingController();
  // TextEditingController _stock = TextEditingController();

  getProduct() async {
    Response response = await get(
        Uri.parse("http://192.168.8.102:8080/api/Product?barcodeValue=$_data"));
    var rdata = response.body;
    //print(rdata);
    List list = jsonDecode(rdata);
    print(list);
    setState(() {
      data = list;
      // print(data);
    });
  }

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBarNormal(
          mytitle: "Product Search",
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),

            Center(
                child: SizedBox(
                    width: 300,
                    child: myTextField(
                      name: "Enter barcode",
                      myTextController: _barcodeController,
                    ))),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text("Scan product"),
              // onPressed: ()=> _scan()
              onPressed: () {
                _scan();
              },
              //    onPressed: (){
              //      _scan();
              // _barcodeController.text = _data;
              //  print(_barcodeController.text);
              // return _scan();
              //    }
            ),
            //Text(_data),
            //_barcodeController.text = _data;
            Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var element = data.elementAt(index);
                      TextEditingController _barcode =
                          TextEditingController(text: element['Barcode']);
                      TextEditingController _productName =
                          TextEditingController(text: element['ProductName']);
                      TextEditingController _unit =
                          TextEditingController(text: element['uom']);
                      TextEditingController _cost = TextEditingController(
                          text: element['Cost'].toString());
                      TextEditingController _retailPrice =
                          TextEditingController(
                              text: element['RetailPrice'].toString());
                      TextEditingController _stock = TextEditingController(
                          text: element['Stock'].toString());
                      return Column(
                        children: [
                          SizedBox(
                              width: 300,
                              child: TextField(style: const TextStyle(fontWeight: FontWeight.bold),
                                decoration:
                                    const InputDecoration(labelText: "Barcode"),
                                controller: _barcode,
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                              width: 300,
                              child: TextField(style: const TextStyle(fontWeight: FontWeight.bold),
                                decoration:
                                    const InputDecoration(labelText: "ProductName"),
                                controller: _productName,
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: SizedBox(
                                  width: 300,
                                  child: TextField(style: const TextStyle(fontWeight: FontWeight.bold),
                                    decoration:
                                        const InputDecoration(labelText: "Unit"),
                                    controller: _unit,
                                  ))),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: SizedBox(
                                  width: 300,
                                  child: TextField(style: const TextStyle(fontWeight: FontWeight.bold),
                                    decoration:
                                        const InputDecoration(labelText: "Cost"),
                                    controller: _cost,
                                  ))),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: SizedBox(
                                  width: 300,
                                  child: TextField(style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                                    decoration:
                                        const InputDecoration(labelText: "Price"),
                                    controller: _retailPrice,
                                  ))),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                              child: SizedBox(
                                  width: 300,
                                  child: TextField(
                                    style: const TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                                    decoration:
                                        const InputDecoration(labelText: "Stock",),
                                    controller: _stock,
                                  ))),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
