import 'package:amber_erp/components/appbar_normal.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';

class PosReconcilation extends StatefulWidget {
  const PosReconcilation({Key? key}) : super(key: key);

  @override
  _PosReconcilationState createState() => _PosReconcilationState();
}

class _PosReconcilationState extends State<PosReconcilation> {
  List<dynamic> Report = [];
  Future<List> getReconcilation() async {
    DateTime today = DateTime.now();
    PosReconMaster().reconcilationdetails(today).then((value) {
      List<dynamic> list = (value as List).reversed.toList();
//print(list);
      setState(() {
        Report = list;
      });
    });
    return Report;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pos reconcilation Report"),),
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getReconcilation(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: Report.length,
                itemBuilder: (context, index) {
                  var element = Report.elementAt(index);
                  return Card(
                    elevation: 5,
                    color: Colors.white70,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 350,
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 20.0),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Date :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            element['RecoDate'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'UserName :',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            element['UserName'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(blurRadius: 2)
                                          ],
                                        ),
                                        height: 80,
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: const [
                                                Image(
                                                  image: AssetImage(
                                                      "assets/CashIcon.png"),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Cash',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              element['Cash'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(blurRadius: 2)
                                          ],
                                        ),
                                        height: 80,
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: const [
                                                Image(
                                                  image: AssetImage(
                                                      "assets/CardIcon.png"),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Card',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              element['Card'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(blurRadius: 2)
                                          ],
                                        ),
                                        height: 80,
                                        width: 100,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: const [
                                                Image(
                                                  image: AssetImage(
                                                      "assets/CreditIcon.jpg"),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Credit',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              element['Credit'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 18,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      height: 30,
                                      width: 300,
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.0),
                                            child: Text(
                                              'Systemcash :',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 40,
                                          ),
                                          Text(
                                            element['SystemCash'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: const [
                                          BoxShadow(blurRadius: 2)
                                        ],
                                      ),
                                      height: 80,
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: const [
                                              Image(
                                                image: AssetImage(
                                                    "assets/UserIcon.png"),
                                                height: 30,
                                                width: 30,
                                              ),
                                              Text(
                                                'Usercash',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            element['PhysicalCash'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: const [
                                          BoxShadow(blurRadius: 2)
                                        ],
                                      ),
                                      height: 80,
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: const [
                                              Image(
                                                image: AssetImage(
                                                    "assets/ExcessIcon.jpg"),
                                                height: 30,
                                                width: 30,
                                              ),
                                              Text(
                                                'Excess',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            element['Excess'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: const [
                                          BoxShadow(blurRadius: 2)
                                        ],
                                      ),
                                      height: 80,
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: const [
                                              Image(
                                                image: AssetImage(
                                                    "assets/ShortIcon.jpg"),
                                                height: 30,
                                                width: 30,
                                              ),
                                              Text(
                                                'Short',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            element['Short'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("no data found"),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
