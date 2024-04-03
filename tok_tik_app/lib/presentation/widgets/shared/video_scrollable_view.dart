import 'package:flutter/material.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';
import 'package:tok_tik_app/presentation/widgets/shared/video_buttons.dart';
import 'package:tok_tik_app/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView(
      {super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (ctx, i) {
        final video = videos[i];
        return Stack(
          children: [
            // video player + gradient
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: video.videoUrl,
                caption: video.caption,
              ),
            ),
            // buttons
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: video),
            ),
          ],
        );
      },
    );
  }
}
