import 'package:amber_erp/Pages/branches_screen.dart';
import 'package:amber_erp/SideBar/side_bar_layout.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../models/branch_model.dart';
import '../utils/constant.dart';

class ClientList extends StatefulWidget {
  List<dynamic> businessList;
  ClientList({Key? key, required this.businessList}) : super(key: key);

  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  //List<dynamic> Report =  [];
  @override
  Widget build(BuildContext context) {
    //print("clientlistpage : ${widget.businessList.length}");
    return Scaffold(
      appBar: AppBar(),
      // floatingActionButton: GestureDetector(onTap: (){
      //   print("click ckcil");
      // },child: Text("click"),),
//       body: ListWheelScrollView.useDelegate(
//         itemExtent: 250,
// onSelectedItemChanged: (value) {
//   print(value);
// },
//         childDelegate: ListWheelChildBuilderDelegate(
//           //childCount: 10,
//           childCount: widget.businessList.length,
//           builder: (context,index) {
//
//             var element = widget.businessList.elementAt(index);
//             return buildCard(element);
//           }
//         ),
//       ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var element = widget.businessList.elementAt(index);
          return buildCard(element);
        },
        itemCount: widget.businessList.length,
      ),
    );
  }

  Widget buildCard(var element) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('client_id', (element['clientId']));
        await prefs.setString('shop_name', (element['clientName']).toString());
        List<Branch> branches =
            await getBranches(element['clientId'].toString());
        if (branches.length == 0) {
          await prefs.setString('branch', '1');
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MySidebarLayout()));
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text("User Successfully LoggedIn"),
          ));
          final _sharedPrefs = await SharedPreferences.getInstance();
          await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BranchesScreen(branches: branches)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Container(
          height: 150, width: 300,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 25),
          // width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20.0),
          ),

          child: Column(
            children: [
              const Image(
                image: AssetImage("assets/shopImage.png"),
                height: 80,
                width: 80,
              ),
              Text(
                element['clientName'],
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
