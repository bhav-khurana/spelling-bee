import 'package:flutter/material.dart';

class WordList extends StatefulWidget {
  const WordList({
    super.key,
    required this.words,
  });

  final List words;

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Wrap(
        children: [
          for (var word in widget.words) 
            Text('$word, ')
        ],
      )
    );
  }
}
