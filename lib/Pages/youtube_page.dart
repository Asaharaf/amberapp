import 'package:amber_erp/models/YoutubeModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePage extends StatefulWidget {
  const YoutubePage({Key? key,required this.playList}) : super(key: key);
  final List<YoutubeModel> playList ;
  @override
  _YoutubePageState createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {


  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.playList.first.vdoId,
      params: YoutubePlayerParams(
        playlist: widget.playList.map((e) => e.vdoId).toList(), // Defining custom playlist
        // startAt: Duration(seconds: 30),
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          YoutubePlayerIFrame(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.playList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  _controller.playVideoAt(index);
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.youtube,color: Colors.red),
                      title: Text(widget.playList.elementAt(index).title)
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
