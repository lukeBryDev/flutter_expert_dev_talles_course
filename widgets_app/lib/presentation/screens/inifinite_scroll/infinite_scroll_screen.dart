import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final List<int> _imagesIds = [1, 2, 3, 4, 5];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _isMounted = true;

  @override
  void initState() {
    _scrollController.addListener(() {
      if ((_scrollController.position.pixels + 500) >=
          _scrollController.position.maxScrollExtent) {
        _loadNextPage();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isMounted = false;
    super.dispose();
  }

  Future<void> _loadNextPage() async {
    if (_isLoading == true) return;
    _isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    _addFiveImages();
    _isLoading = false;
    if (!_isMounted) return;
    setState(() {});
    _moveScrollToBottom();
  }

  Future<void> _onRefresh() async {
    _isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if (!_isMounted) return;
    _isLoading = false;
    final lastId = _imagesIds.last;
    _imagesIds.clear();
    _imagesIds.add(lastId + 1);
    _addFiveImages();
    setState(() {});
  }

  void _moveScrollToBottom() {
    if ((_scrollController.position.pixels + 150) <=
        _scrollController.position.maxScrollExtent) return;
    _scrollController.animateTo(
      _scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _addFiveImages() {
    final lastId = _imagesIds.last;
    _imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
              controller: _scrollController,
              itemCount: _imagesIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${_imagesIds[index]}/500/300'),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: _isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
        onPressed: () => context.pop(),
      ),
    );
  }
}
