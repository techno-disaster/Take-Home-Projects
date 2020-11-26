import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

final emojiPickerOptions = const [
  "❤️",
  "😂",
  "🔥",
  "😍",
  "👍",
  "🤔",
  "👽",
  "😊",
  "🥰",
];

void showEmojiPicker(
  BuildContext context,
) {
  showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return EmojiPicker();
      });
}

class EmojiPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: emojiPickerOptions
                  .map((emoji) => Material(
                        color: Colors.white,
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              emoji,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
