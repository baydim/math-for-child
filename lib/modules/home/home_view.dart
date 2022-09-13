import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int page = 0;
  int first = 0;
  int last = 0;
  int result = 0;

  List<int> buttonChoices = [1, 2, 3, 4, 5, 6, 7];

  generateNumber() {
    setState(() {
      buttonChoices.clear();
      first = Random().nextInt(20);
      last = Random().nextInt(20);
      result = first + last;
      for (var i = 0; i < 7; i++) {
        buttonChoices.add(Random().nextInt(100));
      }
      buttonChoices.add(result);
      buttonChoices.shuffle();
    });
  }

  ConfettiController controllerTopCenter = ConfettiController(
    duration: const Duration(seconds: 1),
  );

  @override
  void initState() {
    super.initState();
    generateNumber();
  }

  Align buildConfettiWidget(
    controller,
  ) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(30, 30),
        shouldLoop: false,
        confettiController: controller,
        // blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        numberOfParticles: 20,

        colors: [
          Colors.green.shade900,
          Colors.blue.shade900,
          Colors.pink.shade900,
          Colors.orange.shade900,
          Colors.purple.shade900
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.blue,
                  Colors.blue[200]!,
                  Colors.blue[200]!,
                ],
              ),
            ),
          ),
          // buildConfettiWidget(controllerTopCenter, pi / 4),
          buildConfettiWidget(controllerTopCenter),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: const Text('Hitung Jendong'),
                backgroundColor: Colors.blue,
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      generateNumber();
                    },
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                first.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "+",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                last.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        flex: 1,
                        child: Wrap(
                          runAlignment: WrapAlignment.spaceEvenly,
                          runSpacing: 5,
                          spacing: 5,
                          children: [
                            for (var i in buttonChoices)
                              Bounce(
                                duration: const Duration(milliseconds: 100),
                                onPressed: () {
                                  setState(() {
                                    page = i;

                                    if (page == result) {
                                      controllerTopCenter.play();
                                      generateNumber();
                                    } else {
                                      Get.rawSnackbar(
                                        message: "Jawaban Salah",
                                        backgroundColor: Colors.red,
                                        padding: EdgeInsets.all(20),
                                      );
                                      generateNumber();
                                    }
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color:
                                        page == i ? Colors.blue : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$i',
                                      style: TextStyle(
                                        color: page == i
                                            ? Colors.white
                                            : Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        )),
                  ],
                ),
              )

              // SingleChildScrollView(
              //   child: SizedBox(
              //       width: Get.width,
              //       child: Wrap(
              //         crossAxisAlignment: WrapCrossAlignment.center,
              //         alignment: WrapAlignment.center,
              //         children: [
              //           for (var i = 0; i < 10; i++)
              //             Card(
              //               child: SizedBox(
              //                 width: Get.width / 4,
              //                 height: Get.width / 4,
              //                 child: Center(
              //                   child: Text(
              //                     'Card $i',
              //                     style: const TextStyle(fontSize: 24),
              //                   ),
              //                 ),
              //               ),
              //             ),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(4),
              //       boxShadow: const [
              //         BoxShadow(
              //             color: Colors.black26,
              //             offset: Offset(0, 2),
              //             blurRadius: 6)
              //       ]),
              //   height: Random().nextInt(75).toDouble() + 200,
              //   margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              //   child: Column(children: [
              //     Expanded(
              //       child: Container(),
              //     ),
              //     Container(
              //       color: Colors.white,
              //       child: ListTile(
              //         leading: FlutterLogo(),
              //         title: Text("Card with index $i"),
              //         subtitle: Text("#card #index$i #flutter"),
              //       ),
              //     )
              //   ]),
              // )
              //         ],
              //       )),
              // ),
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {},
              //   child: const Icon(Icons.add),
              // ),
              // bottomNavigationBar: NavigationBar(
              //   backgroundColor: Colors.blue[100]!,
              //   selectedIndex: page,
              //   onDestinationSelected: (value) {
              //     setState(() {
              //       page = value;
              //     });
              //   },
              //   destinations: [
              //     NavigationDestination(
              //       icon: const Icon(Icons.home),
              //       label: 'Home',
              //     ),
              //     NavigationDestination(
              //       icon: const Icon(Icons.favorite),
              //       label: 'Favorite',
              //     ),
              //     NavigationDestination(
              //       icon: const Icon(Icons.settings),
              //       label: 'Settings',
              //     ),
              //   ],
              // ),
              ),
        ],
      ),
    );
  }
}
