import 'package:flutter/material.dart';
import 'package:chatt_app/module/model/message_model.dart';
import 'package:chatt_app/module/widgets/image_message_widget.dart';
import 'package:chatt_app/module/widgets/pdf_message_widget.dart';
import 'package:chatt_app/module/widgets/text_message_widgets.dart';

class SenderMessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isFirstMessage;

  const SenderMessageBubble({
    super.key, 
    required this.message,
    this.isFirstMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: _bubbleByType(),
      ),
    );
  }

  Widget _bubbleByType() {
    switch (message.type) {
      case MessageType.image:
        return ImageMessageBubble(message: message);

      case MessageType.pdf:
        return PdfMessageBubble(message: message);

      case MessageType.text:
      return TextMessageBubble(
          message: message, 
          isFirstMessage: isFirstMessage,
        );
      case MessageType.file:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}