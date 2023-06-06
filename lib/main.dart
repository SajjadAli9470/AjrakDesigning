import 'package:design_ajrak2/blocs/Loginbloc/login_bloc.dart';
import 'package:design_ajrak2/screens/splash_page.dart';
import 'package:design_ajrak2/services/classBuilder.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/history_bloc.dart';
import 'blocs/bloc/layred_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
         
         );
  ClassBuilder.registerClasses();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayredBloc(),
        ),
        BlocProvider(
          create: (context) => HistoryBloc(),
        ),
        BlocProvider(create: (context) => LoginBloc())
      ],
      child: MaterialApp(
        
          debugShowCheckedModeBanner: false, title: '',
          theme: ThemeData(fontFamily: 'QuickSand'),
          home: SplashScreen()),
    );
  }
}

class color {
  static Color primary = const Color.fromARGB(255, 49, 51, 53);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color red = Color.fromARGB(255, 70, 16, 11);
  static Color blue = const Color.fromARGB(255, 13, 30, 70);
  static Color grey = const Color.fromARGB(248, 99, 99, 101);
  // static Color blue
}
