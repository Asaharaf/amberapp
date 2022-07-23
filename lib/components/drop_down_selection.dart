import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  Function(String) changedValue;
   MyDropDown({Key? key,required this.changedValue}) : super(key: key);

  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {

  var categoryValue = "Hypermarket";
  @override
  Widget build(BuildContext context) {
    return Container(height: 60,padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 2,style: BorderStyle.solid),borderRadius: BorderRadius.circular(15)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(value: categoryValue,icon: const Icon(Icons.arrow_downward),
            iconSize: 24,elevation: 16,isExpanded: true,style: const TextStyle(color: Colors.black87,fontSize: 14,height: 1.5),
         // hint: Text("Select Shop Category"),
            items:const[
              DropdownMenuItem<String>(value: "Hypermarket", child: Text("Hypermarket")),
              DropdownMenuItem<String>(value: "Trading", child: Text("Trading")),
              DropdownMenuItem<String>(value: "Restaurant", child: Text("Restaurant")),
              DropdownMenuItem<String>(value: "Spa", child: Text("Spa")),
              DropdownMenuItem<String>(value: "Laundry", child: Text("Laundry")),
            ],
            onChanged: (value){
              setState(() {
                categoryValue = value!;
                widget.changedValue(value);
              });
            },

        ),
      ),
    );
  }
}


class MyDropDown_Designation extends StatefulWidget {
  Function(String) changedDesignation;
  MyDropDown_Designation({Key? key,required this.changedDesignation}) : super(key: key);

  @override
  _MyDropDown_DesignationState createState() => _MyDropDown_DesignationState();
}

class _MyDropDown_DesignationState extends State<MyDropDown_Designation> {
  var designatedValue = "Manager";
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 60,padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 2,style: BorderStyle.solid),borderRadius: BorderRadius.circular(15)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(value: designatedValue,icon: const Icon(Icons.arrow_downward),
          iconSize: 24,elevation: 16,isExpanded: true,style: const TextStyle(color: Colors.black87,fontSize: 14,height: 1.5),
          // hint: Text("Select Shop Category"),
          items:const[
            DropdownMenuItem<String>(value: "Manager", child: Text("Manager")),
            DropdownMenuItem<String>(value: "Owner", child: Text("Owner")),
            DropdownMenuItem<String>(value: "Ceo", child: Text("Ceo")),
            DropdownMenuItem<String>(value: "Managing Director", child: Text("Managing Director")),
            DropdownMenuItem<String>(value: "Chairman", child: Text("Chairman")),
            DropdownMenuItem<String>(value: "Finance Manager", child: Text("Finance Manager")),
          ],
          onChanged: (value){
            setState(() {
              designatedValue = value!;
              widget.changedDesignation(value);
            });
          },

        ),
      ),

    );
  }
}

class MyDropDown_Software extends StatefulWidget {
  Function(String) changedSoftware;
   MyDropDown_Software({Key? key,required this.changedSoftware}) : super(key: key);

  @override
  _MyDropDown_SoftwareState createState() => _MyDropDown_SoftwareState();
}

class _MyDropDown_SoftwareState extends State<MyDropDown_Software> {
  var softwareValue = "Amber";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue,width: 2,style: BorderStyle.solid),borderRadius: BorderRadius.circular(15)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(value: softwareValue,icon: const Icon(Icons.arrow_downward),
          iconSize: 24,elevation: 16,isExpanded: true,style: const TextStyle(color: Colors.black87,fontSize: 14,height: 1.5),
          // hint: Text("Select Shop Category"),
          items:const[
            DropdownMenuItem<String>(value: "Amber", child: Text("Amber")),
            DropdownMenuItem<String>(value: "Zoomie", child: Text("Zoomie")),
            DropdownMenuItem<String>(value: "Beauteqx", child: Text("Beauteqx")),
            DropdownMenuItem<String>(value: "Gozzbe", child: Text("Gozzbe")),

          ],
          onChanged: (value){
            setState(() {
              softwareValue = value!;
              widget.changedSoftware(value);
            });
          },

        ),
      ),
    );
  }
}


