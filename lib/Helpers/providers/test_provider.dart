import 'dart:math';
import 'package:flutter/material.dart';
import 'package:yomapp/Helpers/Enum/alphabet_enum.dart';

class TestProvider extends ChangeNotifier {

  Map<String, String> _randomLetter() {
    List<String> sounds = ["A", "I", "U", "E", "O", "N", "G", "Z", "D", "B", "P"];
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

  String _alphabetFromSound(String sound) {
    bool isHiragana = false;
    List<String> sounds = ["A", "I", "U", "E", "O", "N", "G", "Z", "D", "B", "P"];
    for (int i = 0; i < sounds.length; i++) {
      if (AlphabetEnum.getEnumHiragana(sounds[i]).containsValue(sound)) {
        isHiragana = true;
      }
    }
    if (isHiragana) {
      return "Hiragana";
    } else {
      return "Katakana";
    }
  }

  Map<String, dynamic> _easyTestGenerator() {
    List<String> questions = [
      "De quel syllabe s'agit-il ?",
      "A quelle charactère correspond cette syllabe ?",
      "De quelle alphabet s'agit-il ?"
    ];
    int random = Random().nextInt(questions.length);
    String question = questions[random];
    Map<String, String> letterToFound = _randomLetter();
    if (question == questions[0]) {
      List<String> answers = [];
      for (int i = 0; i < 3; i++) {
        Map<String, String> letter = _randomLetter();
        if (letter.keys.first == letterToFound.keys.first) {
          i--;
        } else if (answers.contains(letter.keys.first)) {
          i--;
        } else {
          answers.add(letter.keys.first);
        }
      }
      answers.add(letterToFound.keys.first);
      answers.shuffle();
      return {
        "question": question,
        "sound": letterToFound.values.first,
        "answers": answers,
        "correctAnswer": letterToFound.keys.first,
      };
    }else if (question == questions[1]) {
      List<String> answers = [];
      for (int i = 0; i < 3; i++) {
        Map<String, String> letter = _randomLetter();
        if (letter.values.first == letterToFound.values.first) {
          i--;
        } else if (answers.contains(letter.values.first)) {
          i--;
        } else if (letter.keys.first == letterToFound.keys.first) {
          i--;
        } else {
          answers.add(letter.values.first);
        }
      }
      answers.add(letterToFound.values.first);
      answers.shuffle();
      return {
        "question": question,
        "letter": letterToFound.keys.first,
        "answers": answers,
        "correctAnswer": letterToFound.values.first,
      };
    } else if(question == questions[2]){
      String alphabet = _alphabetFromSound(letterToFound.values.first);
      List<String> answers = [
        "Hiragana",
        "Katakana",
        "Kanji",
        "Romaji"
      ];
      answers.shuffle();
      return {
        "question": question,
        "sound": letterToFound.values.first,
        "answers": answers,
        "correctAnswer": alphabet,
      };
    } else {
      return {};
    }
  }

  Map<String, dynamic> easyTestGenerator() {
    return _easyTestGenerator();
  }
}
