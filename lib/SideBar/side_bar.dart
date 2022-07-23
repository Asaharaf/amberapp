import 'dart:async';
import 'dart:convert';
import 'package:amber_erp/Pages/common_reports.dart';
import 'package:amber_erp/Pages/product_search.dart';
import 'package:amber_erp/Pages/tutorial_video.dart';
import 'package:amber_erp/Pages/wats_new_page.dart';
import 'package:amber_erp/SideBar/menu_item.dart';
import 'package:amber_erp/models/network_service.dart';
import 'package:amber_erp/utils/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Pages/client_list.dart';
import '../Pages/login_page.dart';
import '../Pages/notification_page.dart';
import '../components/report_dropdown.dart';

class MySideBar extends StatefulWidget {
  const MySideBar({Key? key}) : super(key: key);

  @override
  State<MySideBar> createState() => _MySideBarState();
}

class _MySideBarState extends State<MySideBar>
    with SingleTickerProviderStateMixin<MySideBar> {
  late StreamController<bool> isSidebarOpenedStreamController;
  late final Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  late AnimationController _animationController;
  final _animatedDuration = const Duration(milliseconds: 500);
  String shop = "";
  String user = "";
  // final bool isSidebarOpened = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animatedDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
    getUser().then((value) {
      user = value;
    });
    getShop().then((value) {
      shop = value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userName = prefs.getString('user_name').toString();
    return userName;
  }

  getShop() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final shopName = prefs.getString('shop_name').toString();
    return shopName;
  }
  Future<List<dynamic>> getClientDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final clientDetails = prefs.getString('client_details').toString();

    return jsonDecode(clientDetails);
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animatedDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data! ? 0 : -screenwidth,
          right: isSideBarOpenedAsync.data! ? 0 : screenwidth - 35,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.blue,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: Text(
                                  user,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                                subtitle: InkWell(
                                  onTap: () async {
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    var txtuser =
                                        prefs.getString('user_name').toString();
                                    var txtPass =
                                        prefs.getString('pass_word').toString();
                                    var uid = await getUid();
                                    UserLogin()
                                        .login(txtuser, txtPass, uid, context);
                                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductSearch()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      shop,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                                leading: const CircleAvatar(
                                  child: Icon(
                                    Icons.perm_identity,
                                    color: Colors.white,
                                  ),
                                  radius: 40,
                                ),
                              ),
                              Divider(
                                height: 24,
                                thickness: 0.5,
                                color: Colors.white.withOpacity(0.3),
                                indent: 32,
                                endIndent: 32,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 18.0, left: 18.0, right: 32.0),
                                child: ReportDropdown(
                                  text: 'Report',
                                ),
                              ),
                              MyMenuItem(
                                  icon: Icons.home,
                                  title: "Wat's New",
                                  onTap: () {
                                    onIconPressed();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const WatsNewPage()));
                                  }),
                              MyMenuItem(
                                  icon: Icons.home,
                                  title: "Tutorial",
                                  onTap: () {
                                    onIconPressed();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TutorialVideo()));
                                  }),
                              MyMenuItem(
                                  icon: Icons.home,
                                  title: "Price Checking",
                                  onTap: () {
                                    onIconPressed();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProductSearch()));
                                  }),
                              MyMenuItem(
                                  icon: Icons.home,
                                  title: "Branch Control",
                                  onTap: () async {
                                    onIconPressed();
                                    final List report = await getClientDetails();
                                    Get.to(() => ClientList(businessList: report,));
                                  }),
                              MyMenuItem(
                                  icon: Icons.home,
                                  title: "News",
                                  onTap: () {
                                    onIconPressed();
                                    Get.to(() => NotificationPage());
                                  }),
                              MyMenuItem(
                                  icon: Icons.home,
                                  title: "Leave a feedback",
                                  onTap: () async {
                                    await launchUrl(Uri.parse(
                                        "https://docs.google.com/forms/d/e/1FAIpQLScH0fvmEPA__GXxUqFvPdW0_pY3YMPLJzY2jZGGxAf5Cu7DiA/viewform?usp=sf_link"));

                                    onIconPressed();
                                  }),
                              Divider(
                                height: 64,
                                thickness: 0.5,
                                color: Colors.white.withOpacity(0.3),
                                indent: 32,
                                endIndent: 32,
                              ),
                              Card(
                                elevation: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    _showMyDialog();
                                  },
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Exit",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 26,
                                                color: Colors.red),
                                          ),
                                          Icon(
                                            Icons.home,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 25, right: 25),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Divider(color: Colors.white),
                                    _buildBody()
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              Align(
                alignment: const Alignment(0, -0.7),
                child: GestureDetector(
                  onTap: onIconPressed,
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.blue,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              await launchUrl(
                  Uri.parse("https://www.amalgamatetechnologies.com/"));
            },
            child: AutoSizeText(
              'AMALGAMATE',
              maxLines: 1,
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(color: Colors.black),
          AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Advanced',
                ),
                TextSpan(
                  text: ' urban',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' lighting solution',
                ),
              ],
            ),
            style: TextStyle(fontSize: 100),
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are You Sure You Want to Logout?'),
          content: const SingleChildScrollView(),
          actions: <Widget>[
            TextButton(
              child: const Text('Confirm'),
              onPressed: () async {
                final _sharedPrefs = await SharedPreferences.getInstance();
                _sharedPrefs.remove(SAVE_KEY_NAME);
                //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login_page()));
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx) => const Login_page()),
                    (route) => false);
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
