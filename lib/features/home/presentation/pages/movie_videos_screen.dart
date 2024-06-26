import 'package:cimawy/core/utils/app_colors.dart';
import 'package:cimawy/core/utils/app_strings.dart';
import 'package:cimawy/core/utils/styles.dart';
import 'package:cimawy/features/home/data/models/videos_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieVideosScreen extends StatefulWidget {
  VideosScreenModel videosScreenModel;

  MovieVideosScreen({super.key, required this.videosScreenModel});

  @override
  State<MovieVideosScreen> createState() => _MovieVideosScreenState();
}

class _MovieVideosScreenState extends State<MovieVideosScreen> {
  late YoutubePlayerController _controller;
  bool isFullScreen = false;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videosScreenModel.videosKeys.first,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller.addListener(() {
      if (_controller.value.isFullScreen != isFullScreen) {
        setState(() {
          isFullScreen = _controller.value.isFullScreen;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0.0,
        title: Text(
          widget.videosScreenModel.movieTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Styles.movieNameStyle.copyWith(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: YoutubePlayerBuilder(
          onExitFullScreen: () {
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);
            setState(() {
              isFullScreen = false;
            });
          },
          player: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
            showVideoProgressIndicator: true,
          ),
          builder: (context, player) => Scaffold(
                body: ListView(
                  children: [
                    player,
                  ],
                ),
              )),
    );
  }
}
