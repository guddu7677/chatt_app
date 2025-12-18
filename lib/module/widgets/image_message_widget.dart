import 'dart:io';

import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/constant/apptext_style.dart';
import 'package:chatt_app/module/model/message_model.dart';
import 'package:flutter/material.dart';

class ImageMessageBubble extends StatelessWidget {
  final ChatMessage message;

  const ImageMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: 112,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Appcolor.chatbgColor, width: 3),
        image: DecorationImage(
          image: FileImage(File(message.filePath!)),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(message.time, style: ApptextStyle.white12regular),
            const SizedBox(width: 4),
            const Icon(Icons.done_all_outlined, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
