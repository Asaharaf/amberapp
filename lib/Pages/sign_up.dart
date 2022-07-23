import 'package:amber_erp/Pages/login_page.dart';
import 'package:amber_erp/components/drop_down_selection.dart';
import 'package:amber_erp/components/text_field_box.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';

import '../models/network_service.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPassController = TextEditingController();
  final TextEditingController _qidController = TextEditingController();
  final TextEditingController _mobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _shopController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _clientcodeController = TextEditingController();

  String categoryValue = "";
  String designatedValue = "";
  String softwareValue = "";
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Registration")),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: ListView(
          children: [
            //  Center(
            //     child: GestureDetector(
            //         onTap: () {
            //           _showDialog(context);
            //         },
            //         child: Text( 'Hello World', )
            //     )
            // ),

            const Text(
              "CreateAccount",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                const Text(
                  "Already a member?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextButton(
                    child: const Text("Log in"),
                    style: TextButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
              name: "firstname",
              icon: const Icon(Icons.person),
              myTextController: _firstNameController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
              name: "lastname",
              icon: const Icon(Icons.person),
              myTextController: _lastNameController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
              name: "Username",
              icon: const Icon(Icons.person),
              myTextController: _userNameController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
              name: "Password",
              icon: const Icon(Icons.lock),
              myTextController: _passwordController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
              name: "Confirm Password",
              icon: const Icon(Icons.lock),
              myTextController: _confPassController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
              name: "QID",
              myTextController: _qidController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
              name: "Mobile No",
              myTextController: _mobController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
              name: "Email Id",
              icon: const Icon(Icons.email),
              myTextController: _emailController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
              name: "Shop Name",
              myTextController: _shopController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
              name: "Location",
              myTextController: _locationController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            myTextField(
                name: "Client Code", myTextController: _clientcodeController),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            MyDropDown_Software(
              changedSoftware: (value) {
                softwareValue = value;
              },
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            MyDropDown(
              changedValue: (value) {
                categoryValue = value;
              },
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            MyDropDown_Designation(
              changedDesignation: (value) {
                designatedValue = value;
              },
            ),

            Wrap(
              children: [
                Checkbox(
                  value: agree,
                  onChanged: (value) {
                    setState(() {
                      agree = value ?? false;
                    });
                  },
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "You have read and agree to our",
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  const TextSpan(
                      text: "Data Policy",
                      style: TextStyle(color: Colors.blue)),
                  TextSpan(
                      text: "and",
                      style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  const TextSpan(
                      text: "Terms", style: TextStyle(color: Colors.blue)),
                ]))
              ],
            ),

            SizedBox(
              height: screenHeight * 0.01,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, onPrimary: Colors.white),
                    onPressed: agree ? getData : null,
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            //onPressed: (){getData();},child: Text("Submit"),),
          ],
        ),
      ),
    );
  }

  void getData() async {
    String txtFingerPrint = await getUid();
    String txtfirstname = _firstNameController.text;
    String txtlastname = _lastNameController.text;
    String txtusername = _userNameController.text;
    String txtpassword = _passwordController.text;
    String txtconfirmpass = _confPassController.text;
    String txtqid = _qidController.text;
    String txtmobno = _mobController.text;
    String txtemail = _emailController.text;
    String txtshop = _shopController.text;
    String txtlocation = _locationController.text;
    String txtclientcode = _clientcodeController.text;
    String txtsoftware = softwareValue;
    String txtcategory = categoryValue;
    String txtdesignation = designatedValue;

    var params = {
      "firstname": txtfirstname,
      "lastname": txtlastname,
      "username": txtusername,
      "password": txtpassword,
      "confirmpass": txtconfirmpass,
      "qid": txtqid,
      "mobno": txtmobno,
      "email": txtemail,
      "shop": txtshop,
      "location": txtlocation,
      "clientcode": txtclientcode,
      "softwarename": txtsoftware,
      "category": txtcategory,
      "designation": txtdesignation,
      "fingerprint": txtFingerPrint,
    };
print(params);
    UserAuth().login(params).then((value) {
      _showDialogMessage(context, value);
      if (value == "Welcome,Registration Successfull") {

        _firstNameController.clear();
        _lastNameController.clear();
        _userNameController.clear();
        _passwordController.clear();
        _confPassController.clear();
        _qidController.clear();
        _mobController.clear();
        _emailController.clear();
        _shopController.clear();
        _locationController.clear();
        _clientcodeController.clear();
      }
    });
  }
}

void _showDialogMessage(BuildContext context, String Data) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: const Text("Message"),
        content: Text(Data),
        actions: <Widget>[
          ElevatedButton(
            child: const Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
