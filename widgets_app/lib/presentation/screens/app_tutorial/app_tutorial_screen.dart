import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

final _slides = <_SlideInfo>[
  _SlideInfo(
      'Busca la comida',
      'mattis possim interpretaris suspendisse pertinax bibendum utinam aliquam',
      'assets/images/1.png'),
  _SlideInfo('Entrega rápida', 'natoque doctus habeo ultricies alia',
      'assets/images/2.png'),
  _SlideInfo(
      'Disfruta la comida',
      'interdum euripidis sagittis accumsan instructior',
      'assets/images/3.png'),
];

class _SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  _SlideInfo(this.title, this.caption, this.imageUrl);
}

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final _pageViewController = PageController();
  bool _endReached = false;

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      final page = _pageViewController.page ?? 0;
      if (!_endReached && page >= _slides.length - 1.5) {
        setState(() {
          _endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageViewController,
            physics: const BouncingScrollPhysics(),
            children: _slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),
          if (_endReached)
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  child: const Text('Comenzar'),
                  onPressed: () => context.pop(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
