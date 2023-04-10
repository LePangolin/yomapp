import 'package:flutter/material.dart';
import 'package:yomapp/View/test_easy_view.dart';
import 'package:yomapp/View/acceuil_view.dart';
import 'package:yomapp/View/test_medium_view.dart';

class MenuTest extends StatefulWidget {
  const MenuTest({super.key});

  @override
  State<MenuTest> createState() => _MenuTestState();
}

class _MenuTestState extends State<MenuTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PageAcceuil()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Container(
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
          child: Row(
            children: [
              const Text(
                "Choisissez la difficulté",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.01),
                child: IconButton(
                  onPressed: _showHelp,
                  icon: const Icon(
                    Icons.help_outline,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: 500,
          width: 300,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Text("Difficulté",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EasyTest(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize: const Size(250, 50),
                  ),
                  child: const Text("Facile"),
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
                        builder: (context) => const MediumTest(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize: const Size(250, 50),
                  ),
                  child: const Text("Moyen"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 6.0,
                        backgroundColor: Colors.white,
                        behavior: SnackBarBehavior.floating,
                        content:
                            Text("Cette difficulté n'est pas encore disponible",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                )),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize: const Size(250, 50),
                  ),
                  child: const Text("Difficile"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 6.0,
                        backgroundColor: Colors.white,
                        behavior: SnackBarBehavior.floating,
                        content:
                            Text("Cette difficulté n'est pas encore disponible",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                )),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize: const Size(250, 50),
                  ),
                  child: const Text("Expert"),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _showHelp() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text("Aide",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              )),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children:  [
                  const Text(
                      "1.Facile\nLa difficulté \"Facile\" est sous forme de QCM",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: const Text(
                        "2.Moyen\nDans cette difficulté, vous devez répondre à une question en une seule fois, mais vous avez le droit à 3 indices",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: const Text(
                        "3.Difficile\nDans cette difficulté, vous devez répondre à une question en une seule fois",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: const Text(
                        "4.Expert\nDans cette difficulté, vous devez répondre à une question en une seule fois, des kanjis apparaissent de temps en temps",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
            
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Fermer",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ],
        );
      },
    );
  }
}
