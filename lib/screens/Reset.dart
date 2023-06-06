// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, use_build_context_synchronously

import 'package:design_ajrak2/auth/user_auth.dart';
import 'package:design_ajrak2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  bool _loading = false;
  final TextEditingController _emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  GetNotifiedOfError(String error, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  Future<void> resetpaass() async {
    try {
      setState(() {
        _loading = true;
      });
      Auth().passwordReset(email: _emailController.text);
      setState(() {
        _loading = false;
      });
      GetNotifiedOfError(
          'Request Sent Sucessfully You will recieved a email to change a password',
          Colors.black);

      Navigator.of(context).pop();
    } on FirebaseException catch (e) {
      GetNotifiedOfError(e.message.toString(), Colors.black);
    }
  }

  bool isEmpty = false;
  double height = 250.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/mobileviewface.webp"),
                  fit: BoxFit.cover),
              // color: Colors.white,
              gradient: LinearGradient(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom == 0
                      ? size.height * 0.40
                      : size.height * 0.15,
                  child: const Center(
                      child: Image(
                    image: AssetImage(
                      'assets/vr.webp',
                    ),
                  )),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'SEND PASSWORD RESET REQUEST',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 18, 39, 19),
                                    fontSize: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom ==
                                            0
                                        ? 25
                                        : 35,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    // return "";
                                  }
                                  return null;
                                },
                                style: const TextStyle(fontSize: 15, height: 2),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.all(5),
                                    floatingLabelStyle:
                                        const TextStyle(fontSize: 15),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    labelText: 'Email',
                                    hintText: 'Your Email to reset a password',
                                    hintStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 202, 202, 202)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: !isEmpty
                                                ? Colors.grey
                                                : Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: !isEmpty
                                                ? Colors.grey
                                                : Colors.red),
                                        borderRadius:
                                            BorderRadius.circular(50))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 40,
                                width: 150,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 80),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    elevation: 0.0,
                                    backgroundColor: Colors.amber,
                                  ),
                                  onPressed: () async {
                                    if (_emailController.text.isEmpty) {
                                      setState(() {
                                        isEmpty = true;
                                      });
                                    } else {
                                      if (RegExp(r'\S+@\S+\.\S+')
                                          .hasMatch(_emailController.text)) {
                                        setState(() {
                                          isEmpty = false;
                                        });
                                        resetpaass();
                                      }
                                    }
                                  },
                                  child: _loading
                                      ? const CircularProgressIndicator()
                                      : Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              Text(
                                                'Reset',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Icon(Icons.mode_edit_outlined)
                                            ],
                                          ),
                                        ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
