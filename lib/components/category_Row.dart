import 'package:amber_erp/components/pie_chart.dart';
import 'package:flutter/material.dart';

class MyCategoryRow extends StatelessWidget {
  const MyCategoryRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 3,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          for(var category in kCategories)
            ExpenseCategory(
                text: category.name, index: kCategories.indexOf(category)),

        ],)
    );
  }
}

class ExpenseCategory extends StatelessWidget {
  const ExpenseCategory({Key? key,required this.index,required this.text}) : super(key: key);

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10,bottom: 10),
      child: Row(
            children:<Widget>[
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(shape: BoxShape.circle,color: kNeumorphicColors.elementAt(index % kNeumorphicColors.length)),
              ),
              const SizedBox(width: 20),
              Text(text,style: const TextStyle(color: Colors.blue),),
            ],
      ),
    );
  }
}




