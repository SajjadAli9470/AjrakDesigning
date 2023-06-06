// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../widget/widget_tree.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashtime = 3;

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const WidgetTree();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Container(
              alignment: Alignment.center,
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/airpics.webp"),
                        fit: BoxFit.cover),
                  ),
                  // child: Image.asset("assets/airUP.png"),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(23),
                            decoration: BoxDecoration(
                              // color: const Color.fromARGB(75, 194, 192, 192),
                              borderRadius: BorderRadius.circular(10),

                              gradient: const LinearGradient(
                                // Where the linear gradient begins and ends
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                stops: [0.1, 0.9],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Color.fromARGB(59, 146, 146, 146),
                                  Color.fromARGB(55, 17, 17, 17),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  // padding: const EdgeInsets.all(15),
                                  width: 200,
                                  // height,
                                  child: Center(
                                    child: Image(
                                        image: AssetImage('assets/vr.png')),
                                  ),
                                ),
                                const Text(
                                  'VR AIDED \nCONTROL SYSTEM',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            226, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: const Text(
                                        'Semi Automotive Vehicle Control System'))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ])),
        ));
  }
}
