//import 'package:flutter/cupertino.dart';
//import 'dart:js';

import 'package:amber_erp/SideBar/side_bar_layout.dart';
import 'package:amber_erp/main.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Lottie.asset('assets/confetti.json', fit: BoxFit.fitWidth),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Lottie.asset(
              'assets/celebration.json',
            ),
          ),
          FutureBuilder(
            future: GotoLogin(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  checkUserLoggedInn();
                });
              }
              return Center(
                child: Image(
                  image: AssetImage("assets/amber logo final-01.jpg"),
                  height: 100,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<String> GotoLogin() async {
    await Future.delayed(const Duration(seconds: 10));
    return "3";
    // Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (BuildContext ctx) => Login_page()));
  }

  Future<void> checkUserLoggedInn() async {
    final _sharedPref = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPref.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (cont) => const Login_page()));
    } else {

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const MySidebarLayout()));
    }
  }
}
