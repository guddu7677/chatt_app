import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/constant/appimage.dart';
import 'package:chatt_app/constant/apptext_style.dart';
import 'package:chatt_app/module/model/message_model.dart';
import 'package:flutter/material.dart';

class PdfMessageBubble extends StatelessWidget {
  final ChatMessage message;

  const PdfMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Appcolor.chatbgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppSvg.pdfimage, height: 21, width: 17),
              const SizedBox(width: 4),
              Text(message.fileName ?? 'document.pdf',
                  style: ApptextStyle.white14regular),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message.time, style: ApptextStyle.white12regular),
              const SizedBox(width: 4),
              const Icon(Icons.done, size: 16, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
