import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:spelling_bee/widgets/custom_button.dart';
import 'package:spelling_bee/widgets/preview_text.dart';
import 'package:spelling_bee/widgets/word_list.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

int getIndex(int q, int r) {
  if (q == 0 && r == -1) return 0;
  if (q == 1 && r == -1) return 1;
  if (q == -1 && r == 0) return 2;
  if (q == 0 && r == 0) return 3;
  if (q == 1 && r == 0) return 4;
  if (q == -1 && r == 1) return 5;
  if (q == 0 && r == 1) return 6;
  return -1;
}

class _GamePageState extends State<GamePage> {
  List words = [
    'apple',
    'banana',
    'cherry',
    'durian',
    'elderberry',
    'fig',
    'grape',
    'honeydew',
    'imbe',
    'jackfruit',
    'kiwi',
    'lemon',
    'mango',
  ];

  List letters = [
    'A',
    'B',
    'C',
    'O',
    'E',
    'F',
    'G',
  ];

  String currentWord = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your words',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 4.0),
                WordList(words: words),
                const SizedBox(height: 150.0),
                Center(
                  child: PreviewText(
                    text: currentWord,
                  ),
                ),
                const SizedBox(height: 30,),
                Center(
                  child: InteractiveViewer(
                    alignment: Alignment.center,
                    constrained: true,
                    child: Center(
                      child: HexagonGrid.pointy(
                          color: Colors.white,
                          depth: 1,
                          width: 230,
                          buildTile: (coordinates) {
                            var qc = coordinates.q;
                            var rc = coordinates.r;
                            var idx = getIndex(qc, rc);
                            return HexagonWidgetBuilder(
                              color: qc | rc == 0
                                  ? Colors.yellow
                                  : Colors.grey.shade300,
                              padding: 1.0,
                              cornerRadius: 8.0,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentWord += letters[idx];
                                  });
                                },
                                child: Text(
                                  '${letters[idx]}',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(text: 'Delete'),
                    SizedBox(width: 8.0),
                    IconButton(onPressed: (){}, icon: Icon(Icons.sync)),
                    SizedBox(width: 8.0),
                    CustomButton(text: 'Enter'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
