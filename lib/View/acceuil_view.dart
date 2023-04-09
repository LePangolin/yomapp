import 'package:flutter/material.dart';
import 'package:yomapp/View/Widget/alphabet.dart';
import 'package:onboarding/onboarding.dart';
import 'package:yomapp/Helpers/Enum/description_enum.dart';

class PageAcceuil extends StatefulWidget {
  const PageAcceuil({super.key});

  @override
  State<PageAcceuil> createState() => _PageAcceuilState();
}

class _PageAcceuilState extends State<PageAcceuil> {
  late int index = 0;
  bool toastShow = false;
  String alphabet = "Hiragana";
  String description =  DescriptionEnum.hiragana;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Swipe left or right to change page'),
          duration: const Duration(seconds: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final onBoardingList = [
      PageModel(widget: Alphabet(sound: "A", alphabet: alphabet)),
      PageModel(widget: Alphabet(sound: "I", alphabet: alphabet)),
      PageModel(widget: Alphabet(sound: "U", alphabet: alphabet)),
      PageModel(widget: Alphabet(sound: "E", alphabet: alphabet)),
      PageModel(widget: Alphabet(sound: "O", alphabet: alphabet)),
      PageModel(widget: Alphabet(sound: "N", alphabet: alphabet)),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: const Center(
                        child: Text(
                          'Alphabet Choisi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (alphabet == "Hiragana") {
                                    alphabet = "Katakana";
                                    description = DescriptionEnum.katakana;
                                  } else {
                                    alphabet = "Hiragana";
                                    description = DescriptionEnum.hiragana;
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Theme.of(context).primaryColor,
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.arrow_back_outlined)),
                          Text(
                            alphabet,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (alphabet == "Hiragana") {
                                    alphabet = "Katakana";
                                    description = DescriptionEnum.katakana;
                                  } else {
                                    alphabet = "Hiragana";
                                    description = DescriptionEnum.hiragana;
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Theme.of(context).primaryColor,
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(Icons.arrow_forward_outlined)),
                          
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: Text(
                          description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  child: Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.683,
                          width: MediaQuery.of(context).size.width,
                          color: const Color(0xFFFEF9EB),
                          child: PageView.builder(
                            physics: const ScrollPhysics(
                              parent: BouncingScrollPhysics(),
                            ),
                            itemCount: onBoardingList.length,
                            itemBuilder: (context, index) {
                              if (index < 0) {
                                return onBoardingList[onBoardingList.length - 1]
                                    .widget;
                              } else if (index > onBoardingList.length - 1) {
                                return onBoardingList[0].widget;
                              } else {
                                return onBoardingList[index].widget;
                              }
                            },
                            onPageChanged: (int index) {
                              setState(() {
                                this.index = index;
                              });
                            },
                          )),
                      Container(
                        color: const Color(0xFFFEF9EB),
                        height: 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(onBoardingList),
                        ),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }

  List<Widget> _buildPageIndicator(List<PageModel> onBoardingList) {
    List<Widget> list = [];
    for (int i = 0; i < onBoardingList.length; i++) {
      list.add(
        Icon(
          Icons.circle,
          color: index == i ? Theme.of(context).primaryColor : Colors.grey,
          size: 10,
        ),
      );
    }
    return list;
  }
}
