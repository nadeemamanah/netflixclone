// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import 'package:netflixclone/assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        color: Colors.black
            .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
        child: SafeArea(
          child: Row(
            children: [
              Image.asset(Assets.netflixLogo0),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _AppBarButton(
                      title: 'Tv show',
                    ),
                    _AppBarButton(
                      title: 'Movies',
                    ),
                    _AppBarButton(
                      title: 'My List',
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class _AppBarButton extends StatelessWidget {
  _AppBarButton({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  // final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(title);
      },
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
