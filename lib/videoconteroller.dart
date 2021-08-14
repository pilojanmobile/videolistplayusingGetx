import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  var videourl = "".obs;
  late VideoPlayerController controller;
  var loading = true.obs;
  late ChewieController chewieController;
  late var player;

//flutter getx onclose
  @override
  void onClose() {
    controller.dispose();
    chewieController.dispose();
    super.onClose();
  }

  setvideourl(String url) {
    try {
      videourl.value = url;
      // print("playurlis ${url}");
      loading.value = true;
      // chewieController = null;
      // if (chewieController.videoPlayerController.value.isInitialized) {
      //   chewieController!.dispose();
      // }

      controller = VideoPlayerController.network('$url')
        ..initialize().then((_) {
          chewieController = ChewieController(
            videoPlayerController: controller,
            autoPlay: true,
            looping: false,
            autoInitialize: false,
          );
          player = Chewie(
            controller: chewieController,
          );
          // controller.play();
          loading.value = false;
          update();
          
        });

      //update();
    } catch (e) {
      print('error $e');
    }
  }
}
