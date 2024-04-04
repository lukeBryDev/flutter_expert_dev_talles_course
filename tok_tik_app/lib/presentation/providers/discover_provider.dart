import 'package:flutter/material.dart';
import 'package:tok_tik_app/domain/entities/video_post.dart';
import 'package:tok_tik_app/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videoPostsRepository;

  DiscoverProvider({required this.videoPostsRepository});

  bool initialLoading = true;
  List<VideoPost> videos = <VideoPost>[];

  Future<void> loadNextPage() async {
    final newVideos = await videoPostsRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
