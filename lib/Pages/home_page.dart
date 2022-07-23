import 'package:amber_erp/Pages/mail_page.dart';
import 'package:amber_erp/Pages/phonecall_list.dart';
import 'package:amber_erp/Pages/search_page.dart';
import 'package:amber_erp/Pages/settings_page.dart';
import 'package:amber_erp/Pages/support.dart';
import 'package:amber_erp/components/app_bar_footer.dart';
import 'package:amber_erp/components/banner_image.dart';
import 'package:amber_erp/components/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:amber_erp/components/app_bar.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';

import '../components/report_dropdown.dart';
import '../models/authentication.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final _pages = [
    MenuPage(),
    const MailPage(),
    const SupportPage(),
    const SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MyAppbar(),
      ),
      body: _pages[index],
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
          onPressed: () {
            Get.to(() => PhoneCallList());
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          MyAppbarFooter(index: index, onChangedTab: onChangedTab),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
      // if (index == 2) {
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => const SupportPage()));
      // }
      // if (index == 0) {
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => const SearchPage()));
      // }
      // if (index == 1) {
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => const MailPage()));
      // }
      // if (index == 3) {
      //   Navigator.of(context).push(
      //       MaterialPageRoute(builder: (context) => const SettingsPage()));
      // }
    });
  }
}

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);
  final gridItems = [
    GridData('https://assets5.lottiefiles.com/packages/lf20_wpr8vxxt.json',
        "Dashbord"),
    GridData("https://assets3.lottiefiles.com/private_files/lf30_rkzommaq.json",
        "SalesReport"),
    GridData("https://assets5.lottiefiles.com/packages/lf20_svfmrsni.json",
        "PurchaseReport"),
    GridData("https://assets3.lottiefiles.com/packages/lf20_nn7raoys.json",
        "QuotationReport"),
    GridData("https://assets6.lottiefiles.com/packages/lf20_bnecesf3.json",
        "CashSummary"),
    GridData("https://assets8.lottiefiles.com/packages/lf20_zprfc7im.json",
        "ProfitReport"),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        FutureBuilder(
            future: syncTime(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              return snapshot.hasData
                  ? SizedBox(
                    width: width,
                height: 15,
                child: Marquee(
                  text: 'last sync time : ${snapshot.data}',
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 200.0,
                  // velocity: 100.0,
                  style: TextStyle(color: Colors.red),
                  startPadding: 10.0,

                ),
                  )
                  : Text("no data");
            }),
        const MyBannerImage(),
        // Padding(
        //   padding: EdgeInsets.only(top: 18.0, left: 32.0, right: 32.0),
        //   child: ReportDropdown(
        //     text: 'Report',
        //   ),
        // ),
        Expanded(
            child: MyGridview(
          listData: gridItems,
        )),
      ],
    );
  }
}
