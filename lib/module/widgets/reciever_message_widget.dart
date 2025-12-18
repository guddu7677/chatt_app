import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/constant/appimage.dart';
import 'package:chatt_app/constant/apptext_style.dart';
import 'package:chatt_app/module/model/message_model.dart';
import 'package:flutter/material.dart';

class ReceiverMessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isFirstMessage;

  const ReceiverMessageBubble({
    super.key,
    required this.message,
    this.isFirstMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isFirstMessage)
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImage.messageprofile),
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 32), 
                
                const SizedBox(width: 4),
                
                if (isFirstMessage)
                  Image.asset(
                    AppSvg.chatleftsidecontaine,
                    height: 42,
                    fit: BoxFit.cover,
                    color: Appcolor.containerBgColor,
                  ),
                
                Flexible(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 250),
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 4, bottom: 20),
                    decoration: BoxDecoration(
                      color: Appcolor.containerBgColor,
                      borderRadius: isFirstMessage
                          ? const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            )
                          : BorderRadius.circular(8),
                    ),
                    child: Text(
                      message.text,
                      style: ApptextStyle.black14regular,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 4,
              right: 8,
              child: Text(message.time, style: ApptextStyle.grey12regular),
            ),
          ],
        ),
      ),
    );
  }
}