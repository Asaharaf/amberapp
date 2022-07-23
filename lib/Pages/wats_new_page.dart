//import 'dart:html';

import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:readmore/readmore.dart';

class WatsNewPage extends StatefulWidget {
  const WatsNewPage({Key? key}) : super(key: key);

  @override
  _WatsNewPageState createState() => _WatsNewPageState();
}

class _WatsNewPageState extends State<WatsNewPage> {
  List<dynamic> Report = [];
  Future<List> getWatsNew() async {
    // DateTime today = DateTime.now();
    WatsnewMaster().watsnewdetails().then((value) {
      List<dynamic> list = (value as List).reversed.toList();

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
        title: const Text("Wat's New"),
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
                    version: element['versionNo'],
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
                    Lottie.network(
                        'https://assets9.lottiefiles.com/packages/lf20_3yoqcnbq.json',
                        height: 50),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("version : $version"),
                              )
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
