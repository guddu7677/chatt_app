// import 'package:chatt_app/module/screens/chat_first_screen.dart';
// import 'package:chatt_app/module/screens/chat_fourth_screen.dart';
// import 'package:chatt_app/module/screens/chat_request_screen.dart';
// import 'package:chatt_app/module/screens/chat_second_screen.dart';
// import 'package:chatt_app/module/screens/chat_third_screen.dart';
import 'package:chatt_app/module/chatscreen/unifieldchat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UnifiedChatScreen(),
      routes: {
        // "/ChatFirstScreen": (context) => ChatFirstScreen(),
        // "/ChatSecondScreen": (context) => ChatSecondScreen(),
        // "/ChatThirdScreen": (context) => ChatThirdScreen(),
        // "/ChatFourthScreen": (context) => ChatFourthScreen(),
        // "/ChatRequestScreen":(context)=>ChatRequestScreen(),
       "/UnifiedChatScreen":(context)=>UnifiedChatScreen()
      },
    );
  }
}
