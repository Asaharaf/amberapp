import 'package:amber_erp/components/project_numbers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Support"),),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(top: top, child: buildProfileImage()),
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          const Text(
            "AMBER",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "erp software",
            style: TextStyle(fontSize: 20, color: Colors.black45),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (await canLaunchUrl(
                      Uri.parse("fb://page/1975782479401228"))) {
                    await launchUrl(
                        Uri.parse("fb://page/1975782479401228"));
                  }else{
                    await launchUrl(
                        Uri.parse("https://www.facebook.com/AmalgamateTechnology/"));
                  }

                },
                child: buildSocialIcon(FontAwesomeIcons.facebook),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () async {
                  if (await canLaunchUrl(
                      Uri.parse("vnd.youtube://channel/UCIwwZvH1HmhdPbA7R-WNz6A"))) {
                    await launchUrl(
                        Uri.parse("vnd.youtube://channel/UCIwwZvH1HmhdPbA7R-WNz6A"));
                  }else{
                    await launchUrl(
                        Uri.parse("https://www.youtube.com/channel/UCIwwZvH1HmhdPbA7R-WNz6A"));
                  }

                },
                child: buildSocialIcon(FontAwesomeIcons.youtube),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () async {
                  if (await canLaunchUrl(
                      Uri.parse("twitter://user?user_id=AmalgamateTech1"))) {
                    await launchUrl(
                        Uri.parse("twitter://user?user_id=AmalgamateTech1"));
                  }else{
                    await launchUrl(
                        Uri.parse("https://twitter.com/AmalgamateTech1/"));
                  }
                },
                child: buildSocialIcon(FontAwesomeIcons.twitter),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () async {
                  _launchInstagram();
                  // if (await canLaunchUrl(
                  //     Uri.parse("instagram://user?username=severinas_app"))) {
                  //   await launchUrl(
                  //       Uri.parse("instagram://user?username=severinas_app"));
                  // }else{
                  //   await launchUrl(
                  //       Uri.parse("https://www.instagram.com/amalgamate_technology/"),);
                  // }

                },
                child: buildSocialIcon(FontAwesomeIcons.instagram),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          SingleChildScrollView(child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: const ProjectNumbers(),
          ),scrollDirection: Axis.horizontal,),
          const SizedBox(
            height: 16,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          buildAbout(),
        ],
      );
  _launchInstagram() async {
    const nativeUrl = "instagram://user?username=amalgamate_technology";
    const webUrl = "https://www.instagram.com/amalgamate_technology/";
    if (await canLaunchUrl(Uri.parse(nativeUrl))) {
      await launchUrlString(nativeUrl);
    } else if (await canLaunchUrlString(webUrl)) {
      await launchUrlString(webUrl);
    } else {
      await launchUrlString(webUrl);
    }
  }
  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Material(
            shape: const CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Center(
              child: Icon(
                icon,
                size: 32,
              ),
            )),
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About us",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              '''Amber is complete business management interface that efficiently manages a company's Inventory,
      Finance and payroll system in easiest and the simplest way. it is complete business management software that
      enables efficient management of company's inventories and finance system. 
      It includes more than 30 applications for managing your Business Assets (Customer Orders), 
      Finance System (Accounting & Net Income) and E-Business Systems. Additionally, 
      you can setup an account with corporate payroll service using Amber". 
      "It supports simple pricing control via billing accounts." 
      "Discovery tool allows use to integrate multiple customer relationships from One Account into new organization",
        ... which does not offer very much additional functionality apart From listing other services like Payload processing,
        Accounting systems or Tax Forms. If we want to automate most tasks then look no further! But if we have small budgets ;
         do what works best? This one suits us!''',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18, height: 1.4),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "For sales",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            salesContainer(),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "For support",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            supportContainer(),
          ],
        ),
      );

  Widget salesContainer() => SizedBox(
        width: 400,
        height: 100,
        child: Card(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                      Expanded(child: Container()),
                      const Text("30611913 / 77013425"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        color: Colors.green,
                      ),
                      Expanded(child: Container()),
                      const Text("info@amalgamatetechnologies.com"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget supportContainer() => SizedBox(
        width: 400,
        height: 100,
        child: Card(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.red,
                      ),
                      Expanded(child: Container()),
                      const Text("30032216 / 30032217"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.mail,
                        color: Colors.red,
                      ),
                      Expanded(child: Container()),
                      const Text("support@amalgamatetechnologies.com")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          "assets/supportImage.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.white,
        backgroundImage: const AssetImage("assets/AMBER.ico"),
      );
}
