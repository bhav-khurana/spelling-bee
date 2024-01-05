import 'package:blinking_text/blinking_text.dart';
import 'package:flutter/material.dart';

class PreviewText extends StatefulWidget {
  const PreviewText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<PreviewText> createState() => _PreviewTextState();
}

class _PreviewTextState extends State<PreviewText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.text, style: Theme.of(context).textTheme.headlineSmall),
        const BlinkText(
          '|',
          style: TextStyle(fontSize: 30.0, color: Colors.yellow),
          endColor: Colors.white,
          duration: Duration(milliseconds: 500)
        ),
      ],
    );
  }
}
