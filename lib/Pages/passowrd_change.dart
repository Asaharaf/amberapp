import 'package:amber_erp/Pages/login_page.dart';
import 'package:amber_erp/models/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordChange extends StatefulWidget {

  const PasswordChange({Key? key}) : super(key: key);

  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  bool isObscurePassword = true;
  var myTextController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _currentpasswordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Password"),leading: IconButton(
        icon: const Icon(Icons.arrow_back,color: Colors.white,), onPressed: () {
          Get.back();
      },
      ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings,color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(children: [
            Center(
              child: Stack(children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4,color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/AMBER.ico"),

                    )
                  ),
                ),
                Positioned(
                  bottom: 0,
                    right: 0,
                    child: Container(
                     height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Colors.white
                        ),
                        color: Colors.blue
                      ),
                      child: const Icon(Icons.edit,color: Colors.white,),
                    ))
              ],),
            ),
            const SizedBox(height: 30),
            buildTextField("email", "info@amalgamatetechnology.com", false,_emailController),
            buildTextField("current password", "******", false,_currentpasswordController),
            buildTextField("new password", "********", true,_newpasswordController),
            buildTextField("confirm password", "********", true,_confirmpasswordController),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: const Text("CANCEL",style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 2,
                  color: Colors.black
                ),),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),
                ),
                ElevatedButton(onPressed: (){
                  changePassword();
                }, child: const Text("SAVE",style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 2,
                  color: Colors.white
                ),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),)
              ],
            )

          ],),
        ),
      ),
    );
  }
  Widget buildTextField(String labelText,String placeholder,bool isPasswordTextField,myTextController){
    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
      child: TextField(controller: myTextController,
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
              IconButton(
                  onPressed: (){
                    setState(() {
                      isObscurePassword =!isObscurePassword;
                    });
                  }, icon: const Icon(Icons.remove_red_eye,color: Colors.grey,)):null,
              contentPadding: const EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          )
        ),
      ),
    );
  }

  void changePassword(){

    String txtemail = _emailController.text;
    String txtNewPass = _newpasswordController.text;
    String txtPass = _confirmpasswordController.text;
    String currentPass = _currentpasswordController.text;

    if(txtNewPass == txtPass) {
      ChangePassword().editPassword(txtemail, txtPass,currentPass).then((value) {
        if (value == "Password has been updated") {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const Login_page()));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(10),
            content: Text(value),));
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(10),
            content: Text("email or username was not found"),));
        }
      });
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        content: Text("both passwords are incorrect"),));
    }
  }
}
