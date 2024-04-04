import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tok_tik_app/config/theme/app_theme.dart';
import 'package:tok_tik_app/infrastucture/datasources/local_videos_datasource_impl.dart';
import 'package:tok_tik_app/infrastucture/repositories/video_posts_repository_impl.dart';
import 'package:tok_tik_app/presentation/providers/discover_provider.dart';
import 'package:tok_tik_app/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostsRepository = VideoPostsRepositoryImpl(
        videoPostsDatasource: LocalVideosDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videoPostsRepository: videoPostsRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'TokTik',
        home: const DiscoverScreen(),
      ),
    );
  }
}
