import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videolist/videoconteroller.dart';
import 'package:videolist/videoplayerwidget.dart';

class ListOfVideos extends StatefulWidget {
  ListOfVideos({Key? key}) : super(key: key);

  @override
  _ListOfVideosState createState() => _ListOfVideosState();
}

class _ListOfVideosState extends State<ListOfVideos> {
  List<String> videsplaylist = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "http://techslides.com/demos/sample-videos/small.mp4",
    "https://images.all-free-download.com/footage_preview/mp4/greenish_blue_butterfly_butterfly_523.mp4",
    "https://images.all-free-download.com/footage_preview/mp4/butterfly_wings_insect_nature_683.mp4",
    "https://images.all-free-download.com/footage_preview/mp4/tulips_flowers_yellow_blossom_spring_996.mp4"
  ];
  VideoController videoController = Get.put(VideoController());

  @override
  void initState() {
    videoController.setvideourl(videsplaylist[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() {
            print(videoController.videourl.value);
            return Container(
              height: 300,
              child: VideoApp(videoController),
            );
          }),
          Expanded(
              child: ListView.builder(
                  itemCount: videsplaylist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(videsplaylist[index]),
                      onTap: () {
                        videoController.setvideourl(videsplaylist[index]);
                      },
                    );
                  }))
        ],
      ),
    );
  }
}
