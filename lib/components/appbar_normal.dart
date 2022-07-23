import 'package:flutter/material.dart';

class AppBarNormal extends StatelessWidget {
  String mytitle;
   AppBarNormal({Key? key,required this.mytitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mytitle),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.green, Colors.red],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              )),
        ),
      ),
    );
  }
}
