import 'package:chatt_app/constant/appcolor.dart';
import 'package:chatt_app/constant/apptext_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suggestmessagecontainer extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback onTap;
  Suggestmessagecontainer({required this.text, required this.width,
  required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Appcolor.containerBgColor,
                        border: Border.all(color: Appcolor.borderColor)

        ),
        child: Center(child: Text(text, style: ApptextStyle.black14regular)),
      ),
    );
  }
}
