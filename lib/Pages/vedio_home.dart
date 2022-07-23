import 'dart:convert';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';


class VideoHome extends StatefulWidget {
  const VideoHome({Key? key}) : super(key: key);

  @override
  _VideoHomeState createState() => _VideoHomeState();
}

class _VideoHomeState extends State<VideoHome> {

  List Vedioinfo=[];
  bool _playArea=false;
  bool _isPlaying=false;
  bool _disposed=false;
  int _isPlayingIndex=-1;
  VideoPlayerController? _controller;
  //List<dynamic> Report =  [];
  _initData()async{
    await DefaultAssetBundle.of(context).loadString("assets/promovideio.json").then((value){
      setState(() {
        Vedioinfo =  json.decode(value);
      });
    });
  }

  // Future<List> _initData() async{
  //   VideoMaster().videodetails().then((value){
  //     List<dynamic>list = value as List;
  //     setState(() {
  //       Report = list;
  //     });
  //
  //   });
  //
  //   return Report;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  void dispose(){
    _disposed=true;
    _controller?.pause();
    _controller?.dispose();
    _controller=null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: _playArea==false? const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 0, 255, 0.9),
              Color.fromRGBO(65, 105,225, 0.5),
            ],
            begin: FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          )
        ):const BoxDecoration(
           color: Color(0xFF6985e8)
         ),
        child: Column(
          children: [
           _playArea==false? Container(
              padding: const EdgeInsets.only(top: 70,left: 30,right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                      onTap: (){
                        Get.back();
                      }
                          ,child: const Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,)),
                      Expanded(child: Container()),
                      const Icon(Icons.info_outline,size: 20,color: Colors.white,)
                    ],
                  ),
                  const SizedBox(height: 30,),
                  const Text("Learn well",style: TextStyle(fontSize: 25,color: Colors.white),),
                  const SizedBox(height: 5,),
                  const Text("About Amber erp software",style: TextStyle(fontSize: 25,color: Colors.white),),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(0, 0, 255, 0.9),
                              Color.fromRGBO(65, 105,225, 0.5),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.timer,size: 20,color: Colors.white,),
                            SizedBox(width: 5,),
                            Text("68Min",style: TextStyle(fontSize: 16,color: Colors.white),),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Flexible(
                        child: Container(
                          width: 250,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(0, 0, 255, 0.9),
                                  Color.fromRGBO(65, 105,225, 0.5),
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.handyman_outlined,size: 20,color: Colors.white,),
                              SizedBox(width: 5,),
                              Text("Session based videos",style: TextStyle(fontSize: 16,color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ):Container(
            child: Column(
              children: [
                Container(
                  height: 100,
                  padding: const EdgeInsets.only(top: 50,left:30,right: 30),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                         Get.back();
                        },
                        child: const Icon(Icons.arrow_back_ios,size: 20,color: Color(0xFFb7bce8),),
                      ),
                      Expanded(child: Container()),
                      const Icon(Icons.info_outline,size: 20,color: Color(0xFFb7bce8),),
                    ],
                  ),
                ),
                _playView(context),
                _controlView(context),
              ],
            ),
           ),
            Expanded(child: Container(
             decoration: const BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(
                 topRight: Radius.circular(70),
               )
             ),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      const Text("Circuit 1: Tutorials",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black54),),
                      Expanded(child: Container()),
                      Row(
                        children: const [
                          Icon(Icons.loop,size: 30,color: Colors.black54,),
                          SizedBox(width: 10,),
                          Text("5 Sets",style: TextStyle(fontSize: 15,color: Colors.black54),)
                        ],
                      ),
                      const SizedBox(width: 20,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Expanded(child:_listView() )
                ],
              ),
            ))
          ],
        ),
      ),

    );
  }

  Widget _controlView(BuildContext context){
    final noMute=(_controller?.value.volume??0)>0;
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 5),
      color: const Color(0xFF6985e8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0,0.0),
                      blurRadius: 4.0,
                      color: Color.fromRGBO(50, 0, 0, 0),
                    )
                  ]
                ),
                child: Icon(noMute?Icons.volume_up:Icons.volume_off,color: Colors.white,),
              ),
            ),
            onTap: (){
             if(noMute){
               _controller?.setVolume(0);
             }else{
               _controller?.setVolume(1.0);
             }
             setState(() {

             });
            },
          ),
          ElevatedButton(onPressed: ()async{
            final index = _isPlayingIndex-1;
            if(index>=0&&Vedioinfo.length>=0){
              _initializeVideo(index);
            }else{
              Get.snackbar("VideoList", "",
                  snackPosition: SnackPosition.BOTTOM,
                  icon: const Icon(Icons.face,
                    size: 30,
                    color: Colors.white,
                  ),
                  backgroundColor: const Color(0xFF6985e8),
                  colorText: Colors.white,
                  messageText: const Text("No videos ahead !",
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
              );
            }
          }, child: const Icon(Icons.fast_rewind,
            size: 36,
            color: Colors.white,
          )),
          ElevatedButton(onPressed: ()async{
            if(_isPlaying){
              setState(() {
                _isPlaying=false;
              });
              _controller?.pause();
            }else{
              setState(() {
                _isPlaying=true;
              });
              _controller?.play();
            }
          }, child: Icon(_isPlaying?Icons.pause:Icons.play_arrow,
            size: 36,
            color: Colors.white,
          )),
          ElevatedButton(onPressed: ()async{
           final index= _isPlayingIndex+1;
           if(index<=Vedioinfo.length-1){
             _initializeVideo(index);
           }else{
             Get.snackbar("VideoList", "",
               snackPosition: SnackPosition.BOTTOM,
               icon: const Icon(Icons.face,
                 size: 30,
                 color: Colors.white,
               ),
               backgroundColor: const Color(0xFF6985e8),
               colorText: Colors.white,
               messageText: const Text("No more videos in the list",
                 style: TextStyle(fontSize: 20,color: Colors.white),
               )
             );
           }
          }, child: const Icon(Icons.fast_forward,
            size: 36,
            color: Colors.white,
          ))
        ],
      ),
    );
  }

 Widget _playView(BuildContext context){
      final controller = _controller;
      if(controller!=null&&controller.value.isInitialized){
        return AspectRatio(
          aspectRatio: 16/9,
          child: VideoPlayer(controller),
        );
      }else{
       return const AspectRatio(
         aspectRatio:16/9,
           child: Center(child: Text("Preparing....",style: TextStyle(fontSize: 20,color: Colors.white),)));
      }
  }
var _onUpdateControllerTime;
  void _onControllerUpdate()async{
    if(_disposed){
      return;
    }
    _onUpdateControllerTime=0;
    final now=DateTime.now().millisecondsSinceEpoch;
    if(_onUpdateControllerTime>now){
      return;
    }
    _onUpdateControllerTime=now+500;
    final contoller = _controller;
    if(contoller==null)
      {
        debugPrint("controller is null");
        return;
      }
    if(!contoller.value.isInitialized){
      debugPrint("controller can not be initialized");
      return;
    }
    final playing = contoller.value.isPlaying;
    _isPlaying=playing;
  }

  _initializeVideo(int index)async{
    final controller = VideoPlayerController.network(
        Vedioinfo[index]['videoUrl']);
    final old=_controller;
    _controller = controller;
    if(old!=null){
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {

      controller..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex=index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {
        });
      });

    });

  }
  _onTapVideo(int index) {
    _initializeVideo(index);
  }
  _listView(){
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
        itemCount: Vedioinfo.length,
        itemBuilder: (_,int index){

          return GestureDetector(
              onTap: (){
                _onTapVideo(index);
                debugPrint(index.toString());
                setState(() {
                 if(_playArea == false){
                   _playArea = true;
                 }
                });
              },
              child: _buildCard(index)
          );
        });
  }
  _buildCard(int index){
    return SizedBox(
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(Vedioinfo[index]['thumbnail']),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Vedioinfo[index]['title'],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(top:3),
                    child: Text(Vedioinfo[index]['time'],style: TextStyle(color: Colors.grey[500]),),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 18,),
          Row(
            children: [
              Container(
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "15s rest",style: TextStyle(color: Color(0xFF839fed)),
                  ),
                ),
              ),
              Row(
                children: [
                  for(int i=0;i<70;i++)
                    i.isEven?Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                        color: const Color(0xFF839fed),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ):Container(
                      width: 3,
                      height: 1,
                      color: Colors.white,
                    )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
