import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/constant/appimage.dart';
import 'package:chatt_app/constant/apptext_style.dart';
import 'package:flutter/material.dart';

class SenderChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final double height;

  const SenderChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: height,
              padding:  EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Appcolor.chatbgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Text(
                message,
                style: ApptextStyle.white14regular,
              ),
            ),
            Image.asset(
              AppSvg.chatrightsidecontaine,
              height: height,
              fit: BoxFit.cover,
              color: Appcolor.chatbgColor,
            ),
          ],
        ),
        Positioned(
          bottom: 4,
          right: 14,
          child: Row(
            children: [
              Text(time, style: ApptextStyle.white12regular),
               SizedBox(width: 4),
               Icon(Icons.done_all_outlined, size: 16, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }
}