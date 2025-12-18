import 'package:chatt_app/module/widgets/sender_chat_text.dart';
import 'package:chatt_app/module/widgets/sender_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:chatt_app/module/model/message_model.dart';
import 'package:chatt_app/module/widgets/reciever_message_widget.dart';

enum MessageUiType { welcome, sender, receiver }

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isFirstReceiverMessage;
  final bool isFirstSenderMessage;

  const ChatBubble({
    super.key, 
    required this.message,
    this.isFirstReceiverMessage = false,
    this.isFirstSenderMessage = false,
  });

  MessageUiType get _type {
    if (message.isWelcome) return MessageUiType.welcome;
    if (message.isSender) return MessageUiType.sender;
    return MessageUiType.receiver;
  }

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case MessageUiType.welcome:
        return _welcomeBubble();

      case MessageUiType.sender:
        return SenderMessageBubble(
          message: message,
          isFirstMessage: isFirstSenderMessage,
        );

      case MessageUiType.receiver:
        return ReceiverMessageBubble(
          message: message,
          isFirstMessage: isFirstReceiverMessage,
        );
    }
  }

  Widget _welcomeBubble() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: SenderChatBubble(
          message: message.text,
          time: message.time,
          height: 65,
        ),
      ),
    );
  }
}