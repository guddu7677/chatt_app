import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/core/widgets/dilog_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:chatt_app/constant/appimage.dart';
import 'package:chatt_app/constant/apptext_style.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String time;

  const ChatAppBar({super.key, required this.userName, required this.time});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: _circleIcon(icon: Icons.keyboard_arrow_left_outlined),
        ),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(AppImage.profileImg),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: ApptextStyle.semiBlack16),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  color: Color(0xFF1A93B2),
                  fontSize: 14.5,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
      GestureDetector(
 onTap: () {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) =>  EndChatDialog(),
  );
},

  child: Container(
    height: 25,
    padding:  EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color:  Color(0xFFFF3B30),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: Text("End", style: ApptextStyle.white500s13),
    ),
  ),
),

         SizedBox(width: 8),
        PopupMenuButton<String>(      
          offset:  Offset(0, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onSelected: (value) {
            if (value == 'report') {
            } else if (value == 'block') {
            } else if (value == 'download') {
            }
          },
          itemBuilder: (context) => [
             PopupMenuItem(value: 'report', child: Text("Report")),
             PopupMenuDivider(),
             PopupMenuItem(value: 'block', child: Text("Block")),
             PopupMenuDivider(),
             PopupMenuItem(
              value: 'download',
              child: Text("Download Chat"),
            ),
          ],
          child: Container(
            height: 34,
            width: 34,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: Appcolor.containerBgColor,
              border: Border.all(color: Appcolor.borderColor)
            ),
            child:  Icon(Icons.more_horiz, size: 22),
          ),
        ),

        const SizedBox(width: 12),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: Colors.grey.shade300),
      ),
    );
  }

  Widget _circleIcon({required IconData icon}) {
    return Container(
      height: 34,
      width: 34,
      decoration:  BoxDecoration(
        shape: BoxShape.circle,
        color: Appcolor.containerBgColor,
                      border: Border.all(color: Appcolor.borderColor)

      ),
      child: Icon(icon, size: 22),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);

  
}
