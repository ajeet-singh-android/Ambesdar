import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;

  const CustomText(
      this.text, {
        Key? key,
        this.style = const TextStyle(), // Default style if not provided
        this.textAlign = TextAlign.start, // Default alignment
        this.overflow = TextOverflow.ellipsis, // Default overflow behavior
        this.maxLines = 1, // Default max lines
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: true,
    );
  }
}
