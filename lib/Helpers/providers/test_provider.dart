import 'dart:math';
import 'package:flutter/material.dart';
import 'package:yomapp/Helpers/Enum/alphabet_enum.dart';

class TestProvider extends ChangeNotifier {
  Map<String, String> _randomLetter() {
    List<String> sounds = ["A", "I", "U", "E", "O", "N"];
    int random = Random().nextInt(sounds.length);
    String randomSound = sounds[random];
    random = Random().nextInt(2);
    Map<String, String> randomAlphabet = random == 0
        ? AlphabetEnum.getEnumHiragana(randomSound)
        : AlphabetEnum.getEnumKatakana(randomSound);
    random = Random().nextInt(randomAlphabet.length);
    String randomKey = randomAlphabet.keys.elementAt(random);
    String randomValue = randomAlphabet[randomKey]!;
    if (randomKey == "Son") {
      randomKey = randomAlphabet.keys.elementAt(1);
      randomValue = randomAlphabet[randomKey]!;
    }
    return {randomKey: randomValue};
  }

  Map<String, dynamic> _easyTestGenerator() {
    List<String> questions = [
      "De quel son s'agit-il ?",
    ];
    int random = Random().nextInt(questions.length);
    String question = questions[random];
    Map<String, String> letterToFound = _randomLetter();
    // if (question == "De quel son s'agit-il ?") {
    List<String> answers = [];
    for (int i = 0; i < 3; i++) {
      Map<String, String> letter = _randomLetter();
      answers.add(letter.keys.first);
    }
    answers.add(letterToFound.keys.first);
    answers.shuffle();
    return {
      "question": question,
      "sound": letterToFound.values.first,
      "answers": answers,
      "correctAnswer": letterToFound.keys.first,
    };
    // }
  }

  Map<String, dynamic> easyTestGenerator() {
    return _easyTestGenerator();
  }
}


