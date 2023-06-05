import 'package:design_ajrak2/design_area.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/history_bloc.dart';
import 'blocs/bloc/layred_bloc.dart';
import 'design_var.dart';
import 'model/history_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {

    return  MultiBlocProvider(
      
      providers: [
        BlocProvider(create: (context) => LayredBloc(),),
        BlocProvider(create: (context) => HistoryBloc(),)
      ],
      child:const MaterialApp(
          debugShowCheckedModeBanner: false, title: '', home: design_area()),
    );
  }
}
