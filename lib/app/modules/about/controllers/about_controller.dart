// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AboutController extends GetxController {
  // late YoutubePlayerController controller;
  // late PlayerState playerState;
  // late YoutubeMetaData videoMetaData;
  // bool isPlayerReady = false;

  // void listener() {
  //   if (isPlayerReady && !controller.value.isFullScreen) {
  //     playerState = controller.value.playerState;
  //     videoMetaData = controller.metadata;
  //   }
  // }

  // @override
  // void onInit() {
  //   controller = YoutubePlayerController(
  //     initialVideoId: 'UmL1jxQDuFk',
  //     flags: const YoutubePlayerFlags(
  //       mute: true,
  //       autoPlay: false,
  //       disableDragSeek: false,
  //       loop: false,
  //       isLive: false,
  //       forceHD: false,
  //       enableCaption: false,
  //     ),
  //   )..addListener(listener);
  //   videoMetaData = YoutubeMetaData();
  //   playerState = PlayerState.unknown;
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // controller.dispose();

    super.onClose();
  }
}
