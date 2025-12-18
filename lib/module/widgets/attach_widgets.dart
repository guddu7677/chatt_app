import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/module/model/message_model.dart';
import 'package:chatt_app/module/widgets/popup_widgets.dart';
import 'package:flutter/material.dart';

class AttachmentButton extends StatelessWidget {
  final VoidCallback onCameraCapture;
  final Function(MessageType) onFileSelection;

  const AttachmentButton({
    super.key,
    required this.onCameraCapture,
    required this.onFileSelection,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.over,
      offset: const Offset(0, -170),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          onTap: onCameraCapture,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PopupItem(
                icon: Icons.camera_alt,
                text: "Camera",
              ),
              const Divider(height: 1),
            ],
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          onTap: () => onFileSelection(MessageType.image),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PopupItem(
                icon: Icons.photo_library,
                text: "Gallery",
              ),
               Divider(height: 1),
            ],
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.zero,
          onTap: () => onFileSelection(MessageType.pdf),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PopupItem(
                icon: Icons.insert_drive_file,
                text: "File",
              ),
            ],
          ),
        ),
      ],
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Appcolor.containerBgColor,
          border: Border.all(color: Appcolor.borderColor)

        ),
        child:  Icon(Icons.link, color: Colors.black),
      ),
    );
  }
}
