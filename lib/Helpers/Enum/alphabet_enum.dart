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



  static Map<String, String> getEnum(String alphabet) {
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

