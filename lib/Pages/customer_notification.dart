//import 'dart:html';

import 'package:amber_erp/models/authentication.dart';
import 'package:amber_erp/models/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant.dart';

class CustomerNotification extends StatefulWidget {
  const CustomerNotification({Key? key}) : super(key: key);

  @override
  _WatsNewPageState createState() => _WatsNewPageState();

}

class _WatsNewPageState extends State<CustomerNotification> {
  List<dynamic> Report = [];
  Future<List> getWatsNew() async {
    // DateTime today = DateTime.now();
    CustumNotification().notificationdetails().then((value) async {
      List<dynamic> list = (value as List).reversed.toList();
      final pref = await SharedPreferences.getInstance();
      bool status = await pref.setInt(KEY_NOTIFICATION_LENGTH, list.length);
      Provider.of<NotificationProvider>(context,listen: false).setNotificationLength = list.length;
      setState(() {
        Report = list;
      });
    });
    return Report;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: FutureBuilder(
          future: getWatsNew(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: Report.length,
                itemBuilder: (context, index) {
                  var element = Report.elementAt(index);
                  return SingleCard(
                    title: element['title'],
                    description: element['subTitle'],
                    version: element['date'],
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

class SingleCard extends StatelessWidget {
  const SingleCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.version})
      : super(key: key);
  final String title, description, version;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        elevation: 8,
        child: Container(
          // width: widget.width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Lottie.network(
                                      'https://assets9.lottiefiles.com/temp/lf20_7BmGsm.json',
                                      height: 50),
                                  Text(
                                    title,
                                    style: const TextStyle(
                                        fontSize: 19, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          const Divider(),
                          ReadMoreText(
                            description,
                            textAlign: TextAlign.justify,
                            trimLines: 4,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            style: const TextStyle(color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Chip(label: Text("$version")),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
