

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:amber_erp/models/contact_details.dart';

class PhoneCallList extends StatelessWidget {
  var myStatus = contactmodel;
   PhoneCallList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Phone list"),centerTitle: true,),
      body: SafeArea(child: ListView(children: Liststyle(),),),
    );


  }


  List<Widget> Liststyle(){
    List<Widget> a =[];
    for (var sttuslist in myStatus) {
      a.add(MyListtile(sttuslist: sttuslist));

    }
    return a;
  }

}

class MyListtile extends StatefulWidget {
  ContactList sttuslist;
   MyListtile({Key? key,required this.sttuslist}) : super(key: key);

  @override
  _MyListtileState createState() => _MyListtileState();
}

class _MyListtileState extends State<MyListtile> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.sttuslist.name!),
      subtitle: Text(widget.sttuslist.phone!),
      leading: CircleAvatar(
       // child: Image.asset(widget.sttuslist.image!),
        radius: 20.0,
        backgroundImage: AssetImage(widget.sttuslist.image!),
        backgroundColor: Colors.transparent,
      ),
      trailing: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 12),
            shape: const RoundedRectangleBorder(
                side: BorderSide(color: Colors.blue)
            )
        ),
        child: const Text('Call'),
        onPressed: () async{
          //launch('tel://$');

          await FlutterPhoneDirectCaller.callNumber(widget.sttuslist.phone!);
          print(widget.sttuslist.phone);
        },
      ),
    );
  }
}

