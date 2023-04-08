import 'package:flutter/material.dart';
import 'package:yomapp/Helpers/Enum/alphabet_enum.dart';

class Alphabet extends StatefulWidget {

  final String sound;

  const Alphabet({super.key, required this.sound});


  @override
  State<Alphabet> createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {

  
  @override
  Widget build(BuildContext context) {
    Map<String, String> alphabet = AlphabetEnum.getEnum(widget.sound);
    String son = alphabet['Son']!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Son : $son",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height * 0.53,
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: createCol1(false, alphabet),
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          children: createCol1(true, alphabet),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> createCol1(bool end, Map<String, String> alphabet) {
    List<Widget> list = [];
    int max = 0;
    int i = 0;
    if (!end) {
      i = 1;
      max = alphabet.length > 7 ? 7 : alphabet.length;
    } else {
      i = 5;
      max = alphabet.length;
    }
    for (i; i < max; i++) {
      String key = alphabet.keys.elementAt(i);
      String value = alphabet[key]!;
      list.add(
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            '$value : $key',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return list;
  }
}
