import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  var myTextController = TextEditingController();
  myTextField({Key? key,this.name = "",this.icon,required this.myTextController}) : super(key: key);

  String name;
  Icon? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(controller: myTextController,autofocus: true,
      decoration: InputDecoration(prefixIcon: icon,
          labelText: name,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.red),
          )),
      keyboardType: TextInputType.text,
    );
  }
}
