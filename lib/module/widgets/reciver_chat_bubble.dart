import 'package:flutter/material.dart';
import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/constant/appimage.dart';
import 'package:chatt_app/constant/apptext_style.dart';

class ReceiverChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool showAvatar;

  const ReceiverChatBubble({
    super.key,
    required this.message,
    required this.time,
    this.showAvatar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showAvatar)
            Container(
              height: 32,
              width: 32,
              margin:  EdgeInsets.only(right: 6),
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppImage.messageprofile),
                ),
              ),
            )
          else
            const SizedBox(width: 38),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Appcolor.containerBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message, style: ApptextStyle.black14regular),
                 SizedBox(height: 4),
                Text(time, style: ApptextStyle.grey12regular),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
