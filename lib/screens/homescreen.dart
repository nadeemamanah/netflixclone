import 'package:flutter/material.dart';
import 'package:netflixclone/cubits/cubits.dart';
import 'package:netflixclone/data/data.dart';
import 'package:netflixclone/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // double _scrollOffset = 0.0;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        BlocProvider.of<AppBarCubit>(context)
            .setOffset(_scrollController.offset);
        // context.watch<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
            return CustomAppBar(
              scrollOffset: scrollOffset,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () {
          print("cast");
        },
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                  key: PageStorageKey('previews'),
                  title: "Previews",
                  contentList: previews),
            ),
          ),
          SliverToBoxAdapter(
              child: ContentList(
            key: PageStorageKey('MyList'),
            title: 'My List',
            contentList: myList,
            isOriginals: false,
          )),
          SliverToBoxAdapter(
            child: ContentList(
                key: PageStorageKey('netflixOriginals'),
                title: 'Netflix Originals',
                contentList: originals,
                isOriginals: true),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20),
            sliver: SliverToBoxAdapter(
                child: ContentList(
                    key: PageStorageKey('trending'),
                    title: 'Trending',
                    contentList: trending,
                    isOriginals: false)),
          )
        ],
      ),
    );
  }
}
