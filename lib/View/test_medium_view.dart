import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yomapp/Helpers/providers/test_provider.dart';
import 'package:yomapp/View/score_view.dart';

class MediumTest extends StatefulWidget {
  const MediumTest({super.key});

  @override
  State<MediumTest> createState() => _MediumTestState();
}

class _MediumTestState extends State<MediumTest> {
  int number = 1;
  Map<String, dynamic> test = TestProvider().mediumTestGenerator();
  String answer = "";
  bool reveal = false;
  int score = 0;
  bool isCorrect = false;
  final TextEditingController _controller = TextEditingController();
  int hintRemaining = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Text(
                "Question $number/10",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 250,
                      width: 300,
                      child: widgetPlace()),
                )),
          ),
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.02),
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Form(
                    child: Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                  child: TextFormField(
                    key: const Key('answer'),
                    controller: _controller,
                    onChanged: (value) {
                      answer = value;
                    },
                    cursorColor: Theme.of(context).primaryColor,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                )),
              )),
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                bottom: MediaQuery.of(context).size.height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    confirmAnswer(answer);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    "Valider",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: 50,
                  child: IconButton(
                    onPressed: () {
                      if (hintRemaining == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Il ne vous reste plus d'indices",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                )),
                            duration: const Duration(seconds: 1),
                            backgroundColor: Colors.white,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        );
                      } else {
                        _showHint();
                      }
                    },
                    icon: Icon(Icons.lightbulb_outline_sharp,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void confirmAnswer(String answer) {
    print(answer);
    print(test["correctAnswer"]);
    if (reveal) return;
    if (number == 10) {
      if (answer.toLowerCase() ==
          (test["correctAnswer"]).toString().toLowerCase()) {
        score++;
        isCorrect = true;
      } else {
        isCorrect = false;
      }
      setState(() {
        reveal = true;
      });
      Timer(const Duration(seconds: 1), () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ScoreView(score: score, difficulte: "medium")));
      });
    } else {
      setState(() {
        number++;
        if (answer.toLowerCase() ==
            (test["correctAnswer"]).toString().toLowerCase()) {
          score++;
          isCorrect = true;
        } else {
          isCorrect = false;
        }
        answer = "";
        _controller.clear();
        reveal = true;
        Timer(const Duration(seconds: 1), () {
          setState(() {
            reveal = false;
            test = TestProvider().mediumTestGenerator();
          });
        });
      });
    }
  }

  Widget widgetPlace() {
    if (!reveal) {
      return Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            test["question"],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: MediaQuery.of(context).size.width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            test["sound"],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else {
      return Icon(
        isCorrect ? Icons.check : Icons.close,
        color: isCorrect ? Colors.green : Colors.red,
        size: 100,
      );
    }
  }

  void _showHint() {
    setState(() {
      hintRemaining--;
    });
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: Center(
              child: Text(
                "Indice",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            content: Container(
              height: 100,
              child: Center(
                child: Text("L'indice est : ${test["hint"]}",
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Fermer",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ))),
            ],
          );
        });
  }
}
