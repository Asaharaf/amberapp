import 'package:amber_erp/Pages/passowrd_change.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountoptionRow(context, "Change Password"),
            buildAccountoptionRow(context, "Language"),
            buildAccountoptionRow(context, "Social"),
            buildAccountoptionRow(context, "Content Settings"),
            buildAccountoptionRow(context, "Privacy and Security"),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: const [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildNotificationMethodRow("Finger Print", false),
            buildNotificationMethodRow("Notification", true),
            buildNotificationMethodRow("Dark Theme", false),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: OutlinedButton(
                  onPressed: () {
                    _showMyDialog();
                  },
                  child: const Text(
                    "SIGN OUT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationMethodRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(value: isActive, onChanged: (bool val) {}))
      ],
    );
  }

  GestureDetector buildAccountoptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        if (title == "Change Password") {
          Get.to(() => const PasswordChange());
        }

        // showDialog(context: context,
        //     builder:(BuildContext context){
        //   return AlertDialog(
        //     title: Text(title),
        //     content: Column(mainAxisSize: MainAxisSize.min,
        //       children: [
        //       Text("Option 1"),
        //       Text("Option 2"),
        //       Text("Option 3"),
        //
        //     ],),
        //     actions: [
        //       ElevatedButton(onPressed:(){
        //         Navigator.of(context).pop();
        //       }, child: Text("Close"))
        //     ],
        //   );
        //     });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
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
                _sharedPrefs.clear();
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
