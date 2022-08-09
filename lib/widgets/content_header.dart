// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflixclone/models/content_model.dart';
import 'package:netflixclone/widgets/widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;
  const ContentHeader({
    Key? key,
    required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featuredContent.titleImageUrl),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VerticalIconButton(
                  icon: Icons.add,
                  title: "My List",
                ),
                FlatButton.icon(
                    padding: EdgeInsets.fromLTRB(15, 5, 20, 5),
                    color: Colors.white,
                    label: const Text(
                      "Play",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.play_arrow,
                      size: 30,
                    )),
                VerticalIconButton(
                  icon: Icons.info_outlined,
                  title: "More Info",
                ),
              ],
            )),
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        label: const Text(
          "Play",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 30,
        ));
  }
}
