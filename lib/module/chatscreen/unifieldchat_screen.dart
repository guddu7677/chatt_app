import 'dart:io';
import 'dart:ui';
import 'package:chatt_app/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

import 'package:chatt_app/core/widgets/appbar_widgets.dart';
import 'package:chatt_app/module/model/message_model.dart';
import 'package:chatt_app/module/widgets/bottombar_widgets.dart';
import 'package:chatt_app/module/widgets/main_chat_widget.dart';
import 'package:chatt_app/module/widgets/suggestion_chat.dart';

class UnifiedChatScreen extends StatefulWidget {
  const UnifiedChatScreen({super.key});

  @override
  State<UnifiedChatScreen> createState() => _UnifiedChatScreenState();
}

class _UnifiedChatScreenState extends State<UnifiedChatScreen> {
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  final List<ChatMessage> _messages = [];
  bool _showSuggestions = false;

  File? _selectedFile;
  String? _selectedFileName;
  MessageType _selectedFileType = MessageType.text;

  final List<String> _suggestions = [
    "Please wait…",
    "I am checking your details…",
    "Let me see your chart…",
  ];

  @override
  void initState() {
    super.initState();
    _addInitialMessages();
  }

  void _addInitialMessages() {
    _messages.addAll([
      ChatMessage(
        text:
            "Hello, Welcome to BookmyAstro I'm \nAstrologer Name. How can I help you? 👋",
        time: "11:31 AM",
        isSender: true,
        isWelcome: true,
      ),
      ChatMessage(
        text: "I'm down! Any ideas??",
        time: "11:31 AM",
        isSender: false,
      ),
      ChatMessage(
        text: "Let me know",
        time: "11:31 AM",
        isSender: false,
      ),
    ]);
  }


  void _sendMessage({String? suggestionText}) {
    final text = suggestionText ?? _messageController.text.trim();

    if (_selectedFile != null) {
      _addFileMessage();
    } else if (text.isNotEmpty) {
      _addTextMessage(text);
    }

    setState(() {});
    _scrollToBottom();
  }

  void _addTextMessage(String text) {
    _messages.add(ChatMessage(
      text: text,
      time: _currentTime(),
      isSender: true,
    ));

    _messageController.clear();

    final nonWelcomeCount = _messages.where((m) => !m.isWelcome).length;

    _showSuggestions = nonWelcomeCount <= 4;
  }

  void _addFileMessage() {
    _messages.add(ChatMessage(
      text: _selectedFileName ?? '',
      time: _currentTime(),
      isSender: true,
      type: _selectedFileType,
      filePath: _selectedFile!.path,
      fileName: _selectedFileName,
    ));
    _clearFile();
  }


  Future<void> _pickImage({bool camera = false}) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        _selectedFile = File(image.path);
        _selectedFileName = image.name;
        _selectedFileType = MessageType.image;
      });
    }
  }

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
        _selectedFileName = result.files.single.name;
        _selectedFileType = MessageType.pdf;
      });
    }
  }

  void _clearFile() {
    _selectedFile = null;
    _selectedFileName = null;
    _selectedFileType = MessageType.text;
  }


  String _currentTime() {
    final now = DateTime.now();
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  void _scrollToBottom() {
    Future.delayed( Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  bool _isFirstReceiverMessage(int index) {
    if (_messages[index].isSender || _messages[index].isWelcome) return false;
    
    if (index > 0 && !_messages[index - 1].isSender && !_messages[index - 1].isWelcome) {
      return false; 
    }
    
    return true; 
  }

  bool _isFirstSenderMessage(int index) {
    if (!_messages[index].isSender || _messages[index].isWelcome) return false;
    
    if (index > 0 && _messages[index - 1].isSender && !_messages[index - 1].isWelcome) {
      return false; 
    }
    
    return true; 
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:  Color(0xFFFEFEFE),
      appBar: ChatAppBar(time: "3:40 mins", userName: "User Name here"),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: Appcolor.appbackgroundColor
        ),
        child: Stack(
          children: [
            _blurredTopBackground(),
            ListView.builder(
              controller: _scrollController,
              padding:  EdgeInsets.only(top: 20, bottom: 120),
              itemCount: _messages.length,
              itemBuilder: (_, index) => ChatBubble(
                message: _messages[index],
                isFirstReceiverMessage: _isFirstReceiverMessage(index),
                isFirstSenderMessage: _isFirstSenderMessage(index),
              ),
            ),
            if (_showSuggestions)
              ChatSuggestionChips(
                suggestionTexts: _suggestions,
                onSuggestionTap: (t) => _sendMessage(suggestionText: t),
              ),
            ChatBottomBar(
              messageController: _messageController,
              selectedFile: _selectedFile,
              selectedFileName: _selectedFileName,
              selectedFileType: _selectedFileType,
              onSendMessage: _sendMessage,
              onCameraCapture: () => _pickImage(camera: true),
              onFileSelection: (type) =>
                  type == MessageType.pdf ? _pickPdf() : _pickImage(),
              onClearFile: _clearFile,
            ),
          ],
        ),
      ),
    );
  }

  Widget _blurredTopBackground() {
    return Positioned(
      top: 30,
      left: 0,
      right: 0,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: const Color(0xFF1A93B2).withOpacity(0.15),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: const SizedBox(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}