import 'package:flutter/material.dart';
import 'package:yomapp/View/test_easy_view.dart';
import 'package:yomapp/View/test_medium_view.dart';
import 'package:yomapp/View/menu_test_view.dart';

class ScoreView extends StatefulWidget {
  final int score;
  final String difficulte;

  const ScoreView({super.key, required this.score, required this.difficulte});

  @override
  State<ScoreView> createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  @override
  Widget build(BuildContext context) {
    String message = "Félicitation !";
    if (widget.score < 5) {
      message = "Vous êtes sur la bonne voie !";
    }
    if (widget.score < 3) {
      message = "Vous pouvez mieux faire !";
    }
    return Scaffold(
        body: Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 320,
            width: 300,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Text(
                    "Votre score est de ${widget.score}/10",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08),
                      child: ElevatedButton(
                        onPressed: () {
                          MaterialPageRoute route;
                          if (widget.difficulte == "easy") {
                            route = MaterialPageRoute(
                                builder: (context) => const EasyTest());
                          } else if (widget.difficulte == "medium") {
                            route = MaterialPageRoute(
                                builder: (context) => const MediumTest());
                          }else{
                            route = MaterialPageRoute(
                                builder: (context) => const EasyTest());
                          }
                          Navigator.push(
                            context,
                            route,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(128, 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        child: const Text("Réessayer"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.08),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MenuTest()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        child: const Text("Retour au menu"),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    ));
  }
}
