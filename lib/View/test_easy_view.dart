import 'package:flutter/material.dart';

class EasyTest extends StatefulWidget {
  const EasyTest({super.key});

  @override
  State<EasyTest> createState() => _EasyTestState();
}

class _EasyTestState extends State<EasyTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: const Text(
              "Question 1/10",
              style: TextStyle(
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
                  children:  [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Question place",
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
                      "エ",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
          ),
        )),
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.19),
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
                    margin: const EdgeInsets.only(top:5, left: 7),
                    child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(MediaQuery.of(context).size.width *0.48, MediaQuery.of(context).size.height *0.13),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                )
                              ),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            child: const Text("Reponse 1"),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(MediaQuery.of(context).size.width *0.48, MediaQuery.of(context).size.height *0.13),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                )
                              ),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            child: const Text("Reponse 2"),
                          ),
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 7),
                    child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(MediaQuery.of(context).size.width *0.48, MediaQuery.of(context).size.height *0.13),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20)
                                )
                              ),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            child: const Text("Reponse 3"),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Theme.of(context).primaryColor,
                              minimumSize: Size(MediaQuery.of(context).size.width *0.48, MediaQuery.of(context).size.height *0.13),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20)
                                )
                              ),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            child: const Text("Reponse 4"),
                          ),
                        ]),
                  ),
                ],
            )),
          ),
        )
      ],
    ));
  }
}
