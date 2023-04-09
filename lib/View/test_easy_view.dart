import 'package:flutter/material.dart';
import 'package:yomapp/Helpers/providers/test_provider.dart';
import 'package:yomapp/View/score_view.dart';
class EasyTest extends StatefulWidget {
  const EasyTest({super.key});

  @override
  State<EasyTest> createState() => _EasyTestState();
}

class _EasyTestState extends State<EasyTest> {
  int number = 1;
  Map<String, dynamic> test = TestProvider().easyTestGenerator();
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
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
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 250,
                width: 300,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      test["question"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      test["sound"] ?? test['letter'],
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: test["sound"] != null ? 60 : 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
          ),
        )),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.19),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.274,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5, left: 7),
                      child: Row(children: [
                        ElevatedButton(
                            onPressed: () {
                              confirmAnswer(test["answers"][0]);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.48,
                                  MediaQuery.of(context).size.height * 0.13),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                              )),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              test["answers"][0],
                              style: const TextStyle(fontSize: 30),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              confirmAnswer(test["answers"][1]);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.48,
                                  MediaQuery.of(context).size.height * 0.13),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                              )),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              test["answers"][1],
                              style: const TextStyle(fontSize: 30),
                            )),
                      ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 7),
                      child: Row(children: [
                        ElevatedButton(
                            onPressed: () {
                              confirmAnswer(test["answers"][2]);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.48,
                                  MediaQuery.of(context).size.height * 0.13),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20))),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              test["answers"][2],
                              style: const TextStyle(fontSize: 30),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              confirmAnswer(test["answers"][3]);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.48,
                                  MediaQuery.of(context).size.height * 0.13),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20))),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              test["answers"][3],
                              style: const TextStyle(fontSize: 30),
                            )),
                      ]),
                    ),
                  ],
                )),
          ),
        )
      ],
    ));
  }

  void confirmAnswer(String answer) {
    if (number == 10) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScoreView(score: score)),
      );
    } else {
      setState(() {
        number++;
        test = TestProvider().easyTestGenerator();
        if (answer == test["correctAnswer"]) {
          score++;
        }
      });
    }
  }
}
