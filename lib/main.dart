import 'package:amber_erp/Pages/sign_up.dart';
import 'package:amber_erp/Pages/splash_screen.dart';
import 'package:amber_erp/models/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.purple,
        alignment: Alignment.center,
        child: const Text(
          'Something went wrong!',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  };
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => NotificationProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.blue),

      routes: {
        "signup": (context) => const Sign_up(),
      },

      debugShowCheckedModeBanner: false,

      //home: Sign_up(),
      // home: Login_page(),
      // home: HomePage(),
      // home: MySidebarLayout(),
      //home: MyDashBord(),
      //home: CategoryViewChart(),
      // home: MyListViewDashbord(),
      //home: Home_Screen(),
      //home: MonthlyDashBord(),
      //home: SalesReport(),
      //home: PurchaseReport(),
      //home: CashSummary(),
      // home: ProfitReport(),
      //home: QuotationReport(),
      home: FutureBuilder(future: InternetConnectionChecker().hasConnection,
        builder: (context,AsyncSnapshot<bool> snapshot) {

        if(snapshot.hasData){
          if(snapshot.data!){
            return const SplashScreen();
          }else{
            return Scaffold(
              body: Container(
                color: Colors.purple,
                alignment: Alignment.center,
                child: const Text(
                  'No Internet!',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            );
          }
        }else{
          return LinearProgressIndicator();
        }
      } ,),
      // home: TutorialVideo(),
      //home: VideoHome(),
      //home: WatsNewPage(),
      //home: SupportPage(),
      // home: SearchPage(),
      // home: ProductSearch(),
      // home: NotificationPage(),
      //home: MailPage(),
      // home: SettingsPage(),
      // home: PasswordChange(),
      //home: ClientList(),
      //home: SummaryReport(),
      // home: SupplierSummary(),
      //home: CustomerSummary(),
      // home: CommonReports(),
      //home: PosReconcilation(),
      // home: Vouchers(),
      // home: ListviewControll(),
    );
  }

}
