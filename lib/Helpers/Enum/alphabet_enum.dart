class AlphabetEnum{
  final Map<String, String> _hiraganaA = {
    'Son': 'A',
    'a': 'あ',
    'ka': 'か',
    'sa': 'さ',
    'ta': 'た',
    'na': 'な',
    'ha': 'は',
    'ma': 'ま',
    'ya': 'や',
    'ra': 'ら',
    'wa': 'わ',
  };

  final Map<String, String> _hiraganaI = {
    'Son': 'I',
    'i': 'い',
    'ki': 'き',
    'shi': 'し',
    'chi': 'ち',
    'ni': 'に',
    'hi': 'ひ',
    'mi': 'み',
    'ri': 'り',
  };

  final Map<String, String> _hiraganaU = {
    'Son': 'U',
    'u': 'う',
    'ku': 'く',
    'su': 'す',
    'tsu': 'つ',
    'nu': 'ぬ',
    'fu': 'ふ',
    'mu': 'む',
    'yu': 'ゆ',
    'ru': 'る',
  };

  final Map<String, String> _hiraganaE = {
    'Son': 'E',
    'e': 'え',
    'ke': 'け',
    'se': 'せ',
    'te': 'て',
    'ne': 'ね',
    'he': 'へ',
    'me': 'め',
    're': 'れ',
  };

  final Map<String, String> _hiraganaO = {
    'Son': 'O',
    'o': 'お',
    'ko': 'こ',
    'so': 'そ',
    'to': 'と',
    'no': 'の',
    'ho': 'ほ',
    'mo': 'も',
    'yo': 'よ',
    'ro': 'ろ',
    'wo': 'を',
  };

  final Map<String, String> _hiraganaN = {
    'Son': 'N',
    'n': 'ん',
  };


  final Map<String, String> _KatakanaA = {
    'Son': 'A',
    'a': 'ア',
    'ka': 'カ',
    'sa': 'サ',
    'ta': 'タ',
    'na': 'ナ',
    'ha': 'ハ',
    'ma': 'マ',
    'ya': 'ヤ',
    'ra': 'ラ',
    'wa': 'ワ',
  };

  final Map<String, String> _KatakanaI = {
    'Son': 'I',
    'i': 'イ',
    'ki': 'キ',
    'shi': 'シ',
    'chi': 'チ',
    'ni': 'ニ',
    'hi': 'ヒ',
    'mi': 'ミ',
    'ri': 'リ',
  };

  final Map<String, String> _KatakanaU = {
    'Son': 'U',
    'u': 'ウ',
    'ku': 'ク',
    'su': 'ス',
    'tsu': 'ツ',
    'nu': 'ヌ',
    'fu': 'フ',
    'mu': 'ム',
    'yu': 'ユ',
    'ru': 'ル',
  };

  final Map<String, String> _KatakanaE = {
    'Son': 'E',
    'e': 'エ',
    'ke': 'ケ',
    'se': 'セ',
    'te': 'テ',
    'ne': 'ネ',
    'he': 'ヘ',
    'me': 'メ',
    're': 'レ',
  };

  final Map<String, String> _KatakanaO = {
    'Son': 'O',
    'o': 'オ',
    'ko': 'コ',
    'so': 'ソ',
    'to': 'ト',
    'no': 'ノ',
    'ho': 'ホ',
    'mo': 'モ',
    'yo': 'ヨ',
    'ro': 'ロ',
    'wo': 'ヲ',
  };

  final Map<String, String> _KatakanaN = {
    'Son': 'N',
    'n': 'ン',
  };

  static Map<String, String> getEnumKatakana(String alphabet) {
    switch (alphabet) {
      case 'A':
        return AlphabetEnum()._KatakanaA;
      case 'I':
        return AlphabetEnum()._KatakanaI;
      case 'U':
        return AlphabetEnum()._KatakanaU;
      case 'E':
        return AlphabetEnum()._KatakanaE;
      case 'O':
        return AlphabetEnum()._KatakanaO;
      case 'N':
        return AlphabetEnum()._KatakanaN;
      default:
        return AlphabetEnum()._KatakanaA;
    }
  }

  static Map<String, String> getEnumHiragana(String alphabet) {
    switch (alphabet) {
      case 'A':
        return AlphabetEnum()._hiraganaA;
      case 'I':
        return AlphabetEnum()._hiraganaI;
      case 'U':
        return AlphabetEnum()._hiraganaU;
      case 'E':
        return AlphabetEnum()._hiraganaE;
      case 'O':
        return AlphabetEnum()._hiraganaO;
      case 'N':
        return AlphabetEnum()._hiraganaN;
      default:
        return AlphabetEnum()._hiraganaA;
    }
  }

}

