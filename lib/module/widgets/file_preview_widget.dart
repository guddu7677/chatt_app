import 'dart:io';

import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/constant/appimage.dart';
import 'package:chatt_app/constant/apptext_style.dart';
import 'package:chatt_app/module/model/message_model.dart';
import 'package:flutter/material.dart';

class FilePreviewWidget extends StatelessWidget {
  final File selectedFile;
  final String? selectedFileName;
  final MessageType selectedFileType;
  final VoidCallback onClear;

  const FilePreviewWidget({
    super.key,
    required this.selectedFile,
    required this.selectedFileName,
    required this.selectedFileType,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Appcolor.containerBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          if (selectedFileType == MessageType.image)
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.file(
                selectedFile,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            )
          else if (selectedFileType == MessageType.pdf)
            Image.asset(AppSvg.pdfimage, height: 40, width: 32),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              selectedFileName ?? 'File',
              style: ApptextStyle.black14regular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: onClear,
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Icon(Icons.close, size: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}