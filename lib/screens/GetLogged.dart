// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, use_build_context_synchronously

import 'dart:developer';

import 'package:design_ajrak2/auth/user_auth.dart';
import 'package:design_ajrak2/screens/Reset.dart';
import 'package:design_ajrak2/widget/widget_tree.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetLoggedIN extends StatefulWidget {
  const GetLoggedIN({super.key});

  @override
  State<GetLoggedIN> createState() => _GetLoggedINState();
}

class _GetLoggedINState extends State<GetLoggedIN> {
  final User? user = Auth().currentUser;
  bool isLogin = true;
  String? errorMessage = '';
  String email = "";
  String password = "";
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerpassword = TextEditingController();

  var isEmpty = false;
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;

  var Ebstyle = ElevatedButton.styleFrom(
    shape: const StadiumBorder(),
    elevation: 0.0,
    backgroundColor: Colors.amber
  );

  GetNotifiedOfError(String error, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  Future<void> signInWithEmailandPassword() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerpassword.text);

      setState(() {
        _isLoading = false;
        isLogin = true;
      });
      GetNotifiedOfError('Logged in successfullyy', Colors.black);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const WidgetTree()));
    } on FirebaseAuthException catch (e) {
      GetNotifiedOfError(e.message.toString(), Colors.black);
    }
  }

  Future<void> createUserWithEmailandPassword() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Auth().createUserWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerpassword.text);

      setState(() {
        _isLoading = false;
        isLogin = true;
      });
      GetNotifiedOfError('Signed and Logged in successfullyy', Colors.black);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const WidgetTree()));
    } on FirebaseAuthException catch (e) {
      GetNotifiedOfError(e.message.toString(), Colors.black);
    }
  }

  Widget _textField(
      String title, TextEditingController controller, bool obscure) {
    return TextFormField(
      obscureText: obscure,
      validator: (value) {
        if (value == null || value.isEmpty) {}
        return null;
      },
      controller: controller,
      style: const TextStyle(fontSize: 15, height: 2),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(5),
          floatingLabelStyle: const TextStyle(fontSize: 15),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: title,
          hintText: title,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 202, 202, 202)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: !isEmpty ? Colors.grey : Colors.red),
              borderRadius: BorderRadius.circular(50)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: !isEmpty ? Colors.grey : Colors.red),
              borderRadius: BorderRadius.circular(50))),
    );
  }

  @override
  void initState() {
    bool isLogin = true;
    super.initState();
  }

  Future<void> _onSubmit() async {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 4), () async {
      setState(() => _isLoading = false);
    });
  }

  var onFocus = true;
  double height = 250.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Container(
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
          child: SingleChildScrollView(
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
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  !isLogin ? 'SIGN IN' : 'LOGIN AS MEMBER',
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
                              !isLogin
                                  ? const Text('Sign in to become a member')
                                  : const Text('Login to Explore more'),
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
                              children: <Widget>[
                                _textField('Email', _controllerEmail, false),
                                const SizedBox(
                                  height: 20,
                                ),
                                _textField(
                                    'Password', _controllerpassword, true),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 40,
                                  width: 150,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 80),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: ElevatedButton(
                                    style: Ebstyle,
                                    onPressed: () async {
                                      if (_controllerEmail.text.isEmpty ||
                                          _controllerpassword.text.isEmpty) {
                                        setState(() {
                                          isEmpty = true;
                                        });
                                      } else {
                                        if (RegExp(r'\S+@\S+\.\S+')
                                            .hasMatch(_controllerEmail.text)) {
                                          if (_controllerpassword.text.length >=
                                              6) {
                                            setState(() {
                                              isEmpty = false;
                                            });

                                            log('$_isLoading');
                                            isLogin
                                                ? signInWithEmailandPassword()
                                                : createUserWithEmailandPassword();
                                          } else {
                                            GetNotifiedOfError(
                                                'Your password must have at least 6 characters ',
                                                Colors.black);
                                          }
                                        } else {
                                          GetNotifiedOfError(
                                              'Enter valid email address',
                                              Colors.black);
                                        }
                                      }
                                    },
                                    child: _isLoading
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  isLogin ? "Login" : 'Signin',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const Icon(
                                                    Icons.arrow_circle_right)
                                              ],
                                            ),
                                          ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isLogin = !isLogin;
                                      });
                                    },
                                    child: Text(
                                      isLogin
                                          ? 'Signin Instead'
                                          : 'Login Instead',
                                      style: const TextStyle(color: Colors.amber),
                                    ),
                                  ),
                                ),
                                isLogin
                                    ? Container(
                                        padding: const EdgeInsets.all(8),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Reset()));
                                          },
                                          child: const Text(
                                            'Forgot Password ?',
                                            style: TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ),
                        ],
                      ),
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
