
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videolist/videoconteroller.dart';

class VideoApp extends StatelessWidget {
  VideoApp(this.videoController);
  final VideoController videoController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        print("vvvv ${videoController.videourl}");
        return Center(
          child: videoController.loading.value == false &&videoController.chewieController.videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: 3 / 2,
                  child: videoController.player)
              : Center(child: CircularProgressIndicator()),

          // child: Icon(
          //   widget.videoController.controller.value.isPlaying
          //       ? Icons.pause
          //       : Icons.play_arrow,
          // ),
          //),
        );
      }),
    );
  }
}
