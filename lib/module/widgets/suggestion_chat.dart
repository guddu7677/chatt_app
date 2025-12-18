import 'package:chatt_app/module/widgets/conainer_widget.dart';
import 'package:flutter/material.dart';

class ChatSuggestionChips extends StatelessWidget {
  final List<String> suggestionTexts;
  final Function(String) onSuggestionTap;

  const ChatSuggestionChips({
    super.key,
    required this.suggestionTexts,
    required this.onSuggestionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 80,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Suggestmessagecontainer(
                text: suggestionTexts[0],
                width: 100,
                onTap: () => onSuggestionTap(suggestionTexts[0]),
              ),
              const SizedBox(width: 8),
              Suggestmessagecontainer(
                text: suggestionTexts[1],
                width: 185,
                onTap: () => onSuggestionTap(suggestionTexts[1]),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Suggestmessagecontainer(
                text: suggestionTexts[2],
                width: 160,
                onTap: () => onSuggestionTap(suggestionTexts[2]),
              ),
              const SizedBox(width: 8),
              Suggestmessagecontainer(
                text: suggestionTexts[0],
                width: 100,
                onTap: () => onSuggestionTap(suggestionTexts[0]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
