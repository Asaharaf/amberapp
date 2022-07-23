import 'package:amber_erp/Pages/dash_bord.dart';
import 'package:amber_erp/Pages/monthlyview_dashbord.dart';
import 'package:amber_erp/components/app_bar.dart';
import 'package:amber_erp/components/listview_dashbord.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen>
    with SingleTickerProviderStateMixin {
  final colorstheme = Color.fromARGB(255, 255, 255, 255);

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0)
      ..addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            // const Text('DashBord',style: TextStyle(color: Colors.blue,fontSize: 25.0,fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Colors.lightBlue, Colors.lightBlue]),
                    //colors: [Colors.redAccent, Colors.orangeAccent]),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent),
                child: TabBar(
                    isScrollable: true,
                    indicatorPadding: const EdgeInsets.all(10),
                    labelColor: Colors.blue,
                    unselectedLabelColor: colorstheme,
                    labelStyle: const TextStyle(fontSize: 18),
                    labelPadding: const EdgeInsets.only(
                        left: 35, right: 35, top: 15, bottom: 15),
                    indicator: BoxDecoration(
                        color: colorstheme,
                        borderRadius: BorderRadius.circular(20)),
                    controller: _tabController,
                    tabs: const [
                      Text('Day'),
                      Text('Week'),
                      Text('Month'),
                    ]),
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                MyDashBord(),
                MyListViewDashbord(),
                MonthlyDashBord(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
