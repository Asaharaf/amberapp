import 'package:flutter/material.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:readmore/readmore.dart';
import 'package:amber_erp/models/news_models.dart';
class NotificationPage extends StatelessWidget {
  var myStatus = newsmodel;
   NotificationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: height,
              ),
              ShapeOfView(
                shape: ArcShape(
                  direction: ArcDirection.Outside,
                  height: 45,
                  position: ArcPosition.Bottom
                ),
                child: Container(
                  height: height*0.32,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage('assets/notificationImage.jfif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 0,
                top: 140,
                right: 0,
                child: Center(
                  child: SizedBox(
                    height: height*0.3,
                    width: width*0.2,
                    child: const ClipOval(

                      //backgroundColor: Colors.blueAccent,
                      child: Image(image: AssetImage("assets/AMBER.ico"),width: 100,height: 100,),
                    ),

                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: height*0.41,

                  ),
                  const Center(
                    child: Text("Recent News",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
                  ),
                  Column(
                    children: [
                      const Divider(
                        height: 0.9,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context,index){
                          return ItemCard(neslist: newsmodel.elementAt(index),
                             height: height,
                            width: width,
                          );
                          
                        }
                      )

                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}

class ItemCard extends StatefulWidget {
  final double height;
  final double width;
  NewsList neslist;
   ItemCard({Key? key,required this.height,required this.width,required this.neslist}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        elevation: 8,
        child: Container(
          width: widget.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: widget.height*0.2,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(widget.neslist.image!),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Text(widget.neslist.title!,style: const TextStyle(fontSize: 19,fontWeight: FontWeight.w600),),
                      const SizedBox(
                        height: 1,
                      ),
                      const Divider(),
                      ReadMoreText(widget.neslist.description!,textAlign: TextAlign.justify,
                        trimLines: 4,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        style: const TextStyle(color: Colors.black),
                      ),
                        const Divider(),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("News Date : 20-03-2022",style: TextStyle(fontSize: 13),),
                          ],
                        ),
                      ElevatedButton(onPressed:(){},

                        child: const Text("Details",style: TextStyle(fontSize: 13,color: Colors.white),),
                      )
                     ],
                   )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

