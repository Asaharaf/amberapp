import 'package:amber_erp/models/branch_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SideBar/side_bar_layout.dart';
import '../models/authentication.dart';
import '../utils/constant.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({Key? key, required this.branches}) : super(key: key);
  final List<Branch> branches;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

  return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: branches.length,
        // separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('branch', branches.elementAt(index).branchId!);
            await prefs.setString('branchName', branches.elementAt(index).branchName!);
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => const MySidebarLayout()),(route) => false);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(10),
              content: Text("User Successfully LoggedIn"),
            ));
            final _sharedPrefs = await SharedPreferences.getInstance();
            await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
          },
            child: Card(color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(leading: Icon(FontAwesomeIcons.addressCard,size: 50,color: Colors.white,),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: FutureBuilder(future:  DashToday().todayreport(now,branchId: branches.elementAt(index).branchId.toString()),
                  builder: (context,AsyncSnapshot snapshot) {
                    return Text("sale: ${snapshot.hasData?(snapshot.data!['saleamount'].toString()):0.0}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white60));
                  }
                ),
              ),
              title: Text(branches.elementAt(index).branchName!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white)),
            ),
                )),
          ),
        ),
      ),
    );
  }
}
