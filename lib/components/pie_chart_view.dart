import 'package:amber_erp/components/pie_chart.dart';
import 'package:flutter/material.dart';

class MyPieChartView extends StatelessWidget {
  const MyPieChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 4,child: LayoutBuilder(
      builder: (context,constraint)=> Padding(
        padding: const EdgeInsets.only(bottom: 40,left: 20),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(193, 214, 233, 1),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 17,
                offset: Offset(-5,-5),
                color: Colors.white,
                //color: Color.fromRGBO(146, 182, 216, 1)

              ),
              BoxShadow(
                spreadRadius: -2,
                blurRadius: 10,
                offset: Offset(-7,-7),
                color: Color.fromRGBO(146, 182, 216, 1)
              )
            ]
          ),

          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: constraint.maxWidth * 0.6,
                  child: CustomPaint(
                    child: const Center(),
                    foregroundPainter: PieChart(
                      width: constraint.maxWidth * 0.5,
                      categories: kCategories,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: constraint.maxWidth * 0.4,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(193, 214, 233, 1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      const BoxShadow(
                        blurRadius: 1,
                        offset: Offset(-1,-1),
                        color: Colors.white,
                      ),
                      BoxShadow(
                        spreadRadius: -2,
                        blurRadius: 10,
                        offset: const Offset(5,5),
                        color: Colors.black.withOpacity(0.5),
                      ),

                    ]
                  ),
                  child: const Center(
                    child: Text('25,000'),
                  )

                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
