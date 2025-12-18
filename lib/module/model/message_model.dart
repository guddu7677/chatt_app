enum MessageType { text, image, pdf, file }

class ChatMessage {
  final String text;
  final String time;
  final bool isSender;
  final bool isWelcome;
  final MessageType type;
  final String? filePath;
  final String? fileName;

  ChatMessage({
    required this.text,
    required this.time,
    required this.isSender,
    this.isWelcome = false,
    this.type = MessageType.text,
    this.filePath,
    this.fileName,
  });
}
