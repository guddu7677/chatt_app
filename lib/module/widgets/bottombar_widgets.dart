import 'dart:io';
import 'package:flutter/material.dart';

import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/constant/appimage.dart';
import 'package:chatt_app/constant/apptext_style.dart';
import 'package:chatt_app/module/model/message_model.dart';
import 'package:chatt_app/module/widgets/attach_widgets.dart';

class ChatBottomBar extends StatefulWidget {
  final TextEditingController messageController;
  final File? selectedFile;
  final String? selectedFileName;
  final MessageType selectedFileType;
  final VoidCallback onSendMessage;
  final VoidCallback onCameraCapture;
  final Function(MessageType) onFileSelection;
  final VoidCallback onClearFile;

  const ChatBottomBar({
    super.key,
    required this.messageController,
    required this.selectedFile,
    required this.selectedFileName,
    required this.selectedFileType,
    required this.onSendMessage,
    required this.onCameraCapture,
    required this.onFileSelection,
    required this.onClearFile,
  });

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  final FocusNode _focusNode = FocusNode();
  bool _showDropUp = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(_updateIcon);
    widget.messageController.addListener(_updateIcon);
  }

  void _updateIcon() {
    setState(() {
      _showDropUp =
          _focusNode.hasFocus || widget.messageController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AttachmentButton(
              onCameraCapture: widget.onCameraCapture,
              onFileSelection: widget.onFileSelection,
            ),
             SizedBox(width: 8),
            Expanded(
              child: AnimatedContainer(
                duration:  Duration(milliseconds: 200),
                padding:
                 EdgeInsets.only(left: 12,top: 2 ),
                decoration: BoxDecoration(
                  color: Appcolor.containerBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.selectedFile != null &&
                        widget.selectedFileType == MessageType.image)
                      Padding(
                        padding:  EdgeInsets.only(bottom: 6),
                        child: Stack(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: FileImage(widget.selectedFile!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: widget.onClearFile,
                                child: Container(
                                  height: 16,
                                  width: 16,
                                  decoration:  BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.close,
                                      size: 10,
                                      color: Appcolor.chatbgColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                      // border: Border.all(color: Appcolor.borderColor)

                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: widget.messageController,
                              focusNode: _focusNode,
                              minLines: 2,
                              maxLines: 4,
                              decoration:  InputDecoration(
                                hintText: "Write Message here",
                                border: InputBorder.none,
                                isDense: false,
                                contentPadding:  EdgeInsets.symmetric(vertical: 13),
                              ),
                              style: ApptextStyle.grey14reg,
                            ),
                          ),
                           SizedBox(width: 6),                
                          Center(
                            child: Icon(
                              _showDropUp
                                  ? Icons.keyboard_arrow_up_sharp
                                  : Icons.keyboard_arrow_down_sharp,
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onSendMessage,
                            child: Center(
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration:  BoxDecoration(
                                  color: Appcolor.chatbgColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(AppSvg.sendIcon),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
