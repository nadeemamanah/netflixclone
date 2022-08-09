// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  const VerticalIconButton({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [Icon(icon, color: Colors.white),
        SizedBox(height: 12,),
Text(title,style: TextStyle(color:Colors.white,fontWeight: FontWeight.w600),)        
        ],
      ),
    );
  }
}
