import 'package:flutter/material.dart';
import 'package:netflixclone/data/data.dart';

import '../models/models.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;
  const ContentList({
    Key? key,
    required this.title,
    required this.contentList,
    required this.isOriginals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      Container(
          height: isOriginals ? 500 : 220,
          child: ListView.builder(
              itemCount: contentList.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemBuilder: (BuildContext context, int index) {
                final Content content = contentList[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: isOriginals ? 400 : 200,
                  width: isOriginals ? 200 : 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover)),
                );
              }))
    ]);
  }
}
