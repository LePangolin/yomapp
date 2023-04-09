import 'package:flutter/material.dart';
import 'package:yomapp/View/acceuil_view.dart';

class ScoreView extends StatefulWidget {
  final int score;
  const ScoreView({super.key, required this.score});

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
            height: 350,
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
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PageAcceuil()),
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
            )),
      ),
    ));
  }
}
