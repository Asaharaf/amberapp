import 'package:amber_erp/Pages/customer_notification.dart';
import 'package:amber_erp/Pages/notification_page.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:amber_erp/models/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constant.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({Key? key}) : super(key: key);

  @override
  _MyNotificationState createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  final int _counter =6;
  @override
  void initState() {
    getPref();
    super.initState();
  }
  late SharedPreferences pref;
  getPref() async {
     pref = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationProvider>(
        builder: (context,notification,child){
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CustomerNotification(),),);
            },
            child: SizedBox(
              width: 30,
              height: 30,
              child: Stack(
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                  FutureBuilder(
                    future: CustumNotification().notificationdetails(),
                    builder: (context,snapshot) {
                      if(snapshot.hasData) {
                        List<dynamic> list = (snapshot.data as List).reversed.toList();
                        // print(notification.notificationLength);
                        return (isIconWant(list.length))?
                         Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.only(top: 5),
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border: Border.all(color: Colors.white, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Center(
                              child: Text(
                                "1",
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ):Container();
                      } else {
                        return Container();
                      }
                    }
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  bool isIconWant(int currentLength) {
    int previousLength = pref.getInt(KEY_NOTIFICATION_LENGTH)??0;
    print('$currentLength $previousLength');
    return currentLength>previousLength;
  }
}
