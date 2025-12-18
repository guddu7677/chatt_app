import 'package:flutter/material.dart';
import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/constant/apptext_style.dart';

class EndChatDialog extends StatelessWidget {
  const EndChatDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Appcolor.redColor,
            ),
            child: Center(
              child: Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                child: const Icon(
                  Icons.close,
                  size: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),
          Text(
            "Are you sure want to exit?",
            textAlign: TextAlign.center,
            style: ApptextStyle.boldblack13,
          ),

          const SizedBox(height: 8),

          Text(
            "It looks like you’re about to exit the chat. Please note that your current conversation and any unsent message may not be saved. Do you want to leave anyway?",
            textAlign: TextAlign.center,
            style: ApptextStyle.black11Normal,
          ),

          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Appcolor.greybuttoncolor,
                    ),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Appcolor.redColor,
                    ),
                    child: const Center(
                      child: Text(
                        "Exit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
