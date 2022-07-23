import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectNumbers extends StatelessWidget {
  const ProjectNumbers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(text:'Products',value:5,click: () async {
        await launchUrlString("https://www.amalgamatetechnologies.com/product.php");
      }),
      buildDivider(),
      buildButton(text:'Clients',value:1034,icon: FontAwesomeIcons.user,click: () async {
        await launchUrlString("https://www.amalgamatetechnologies.com/clients.php");
      }),
      buildDivider(),
      buildButton(text:'Service',value:18,icon: FontAwesomeIcons.bars,click: () async {
        await launchUrlString("https://www.amalgamatetechnologies.com/solutions.php");
      }),
      buildDivider(),

    ],
  );

  Widget buildDivider()=>const SizedBox(
    height: 24,
    child: VerticalDivider(),
  );

  Widget buildButton({
  required String text,
    required int value,
    required Function() click,
    icon = FontAwesomeIcons.star,
})=>
      InkWell(onTap: click,
        child: Chip(avatar: Icon(icon),
          elevation: 2,backgroundColor: Colors.white,
          padding: const EdgeInsets.all( 8),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          label: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('$value',
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
              const SizedBox(height: 2,),
              Text(text,style: const TextStyle(fontSize: 16),)
            ],
          ),
            ),
      );


}
