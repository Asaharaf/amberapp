// import 'dart:html';

import 'dart:convert';

import 'package:amber_erp/Pages/profit_report.dart';
import 'package:amber_erp/Pages/sales_report.dart';
import 'package:amber_erp/Pages/vedio_home.dart';
import 'package:amber_erp/Pages/youtube_page.dart';
import 'package:amber_erp/models/YoutubeModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TutorialVideo extends StatefulWidget {
  const TutorialVideo({Key? key}) : super(key: key);

  @override
  _TutorialVideoState createState() => _TutorialVideoState();
}

class _TutorialVideoState extends State<TutorialVideo> {

  // List info=[];
  // _initData(){
  //   DefaultAssetBundle.of(context).loadString("assets/vediogrid.json").then((value){
  //      setState(() {
  //        info =  json.decode(value);
  //      });
  //
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _initData();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Tutorial",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>const VideoHome());
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Text(
                  "About Amber",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                const Text(
                  "Details",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>const VideoHome());
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 20,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 255, 0.8),
                      Color.fromRGBO(65, 105,225, 0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 255, 0.3),
                    )
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Next Session",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Let's Start with",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Amber erp software",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60Min",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(65, 105, 225, 0.8),
                                      blurRadius: 10,
                                      offset: Offset(4, 8))
                                ]),
                            child: const Icon(
                              Icons.play_circle_fill,
                              color: Colors.red,
                              size: 60,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          //  SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 20),
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                     image: AssetImage("assets/bannerImage.jpg"),
                    fit: BoxFit.fill,
                      ),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 40,
                    offset: Offset(8,10),
                    color: Color.fromRGBO(234, 221, 202, 0.3),


                  ),
              BoxShadow(
                  blurRadius: 10,
                  offset: Offset(-1,-5),
                  color: Color.fromRGBO(234, 221, 202, 0.3),
              )
                ]
              ),
            ),
            Row(
              children: const [
                Text("Area of focus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                )
              ],
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context:context,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GridView(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 4 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                    children: [
                      Card(color: Colors.blue,
                        elevation: 5,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  YoutubePage(playList:  [YoutubeModel("Zoomie", 'hjf0xQN_SRc'), YoutubeModel("title qwerty", 'K6YDEPIbslc'),YoutubeModel("title", 'B0C-cJLhkhQ')],)));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Icon(FontAwesomeIcons.info,color: Colors.white,),
                                Text("Tutorials",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(55)),

                          ),
                        ),
                      ),Card(color: Colors.blue,
                        elevation: 5,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  YoutubePage(playList: [YoutubeModel("title", '0z6TyUASJqw'),YoutubeModel("title", 'jH9zOxyYAN0')],)));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Icon(FontAwesomeIcons.democrat,color: Colors.white,),
                                Text("Demo",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(55)),

                          ),
                        ),
                      ),Card(color: Colors.blue,
                        elevation: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Icon(FontAwesomeIcons.newspaper,color: Colors.white,),
                              Text("News",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(55)),

                        ),
                      ),Card(

                        color: Colors.blue,
                        elevation: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Icon(FontAwesomeIcons.leanpub,color: Colors.white,),
                              Text("Wat's new",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(55)),

                        ),
                      ),
                    ],
                     ),
                ),

              ),
            )
            )
          ],
        ),
      ),
    );
  }
}
