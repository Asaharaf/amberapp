import 'package:flutter/material.dart';
// import 'package:flutter_image_slider/carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';

class MyBannerImage extends StatefulWidget {
  const MyBannerImage({Key? key}) : super(key: key);

  @override
  _MyBannerImageState createState() => _MyBannerImageState();
}

class _MyBannerImageState extends State<MyBannerImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        // child: Carousel(
        //   autoScroll: true,
        //   animationPageCurve: Curves.decelerate,
        //   // widgets
        //   items: [
        //     Container(
        //         child: const Image(
        //           image: AssetImage("assets/image1.jpg"),
        //           fit: BoxFit.fill,
        //         )),
        //     Container(
        //         child: const Image(
        //           image: AssetImage("assets/image2.jpg"),
        //           fit: BoxFit.fill,
        //         )),
        //     Container(
        //         child: const Image(
        //           image: AssetImage("assets/image3.png"),
        //           fit: BoxFit.cover,
        //         )),
        //   ],
        // ),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: [
            "https://assets1.lottiefiles.com/packages/lf20_q1zhicxb.json",
            "https://assets1.lottiefiles.com/packages/lf20_l1qryt3o.json",
            "https://assets6.lottiefiles.com/packages/lf20_qdiq7qa5.json"
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: Lottie.network(i),
                );
              },
            );
          }).toList(),
        ));
  }
}
