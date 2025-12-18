import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/constant/appimage.dart';
import 'package:chatt_app/constant/apptext_style.dart';
import 'package:chatt_app/module/model/message_model.dart';
import 'package:flutter/material.dart';

class TextMessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isFirstMessage;

  const TextMessageBubble({
    super.key,
    required this.message,
    this.isFirstMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            constraints:  BoxConstraints(maxWidth: 200),
            padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Appcolor.chatbgColor,
              borderRadius: isFirstMessage
                  ?  BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    )
                  : BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    message.text, 
                    style: ApptextStyle.white14regular,
                  ),
                ),
               SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message.time, style: ApptextStyle.white12regular),
                     SizedBox(width: 4),
                     Icon(Icons.done_all_outlined, size: 16, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        if (isFirstMessage)
          Image.asset(
            AppSvg.chatrightsidecontaine,
            height: 54,
            fit: BoxFit.cover,
            color: Appcolor.chatbgColor,
          ),
      ],
    );
  }
}