
import 'package:design_ajrak2/blocs/bloc/layred_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Overlayed.dart';
import 'blocs/bloc/history_bloc.dart';
import 'design_var.dart';
import 'model/history_model.dart';
import 'model/layred_widgets.dart';

class Pattrens extends StatefulWidget {
  const Pattrens({super.key});

  @override
  State<Pattrens> createState() => _PattrensState();
}

class _PattrensState extends State<Pattrens> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          barrierColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Container(
              height: 80,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 1; i <= 13; i++)
                      BlocBuilder<HistoryBloc, HistoryState>(
                        builder: (context, state) {
                          return InkWell(
                                              onTap: () {
                                                int id=index++;
                                                LayeredWidget layer=LayeredWidget(id:id, child:OverlayedWidget( id:id,child: Image.asset('assets/custom/p_$i.png') ));
                                                context.read<LayredBloc>().add(add_layer(layer:layer));
                                                context.read<HistoryBloc>().add(add_history(
                              history: History(
                                border: state.histroyList.last.border,
                                selectedItem : state.histroyList.last.selectedItem ,layers: layer, backgroundColor: selectedColor, ratio: ratio,matrix:null)));
                      
                                              },
                                              child: Container(
                                                  // color: const Color.fromARGB(255, 243, 243, 243),
                                                  padding: const EdgeInsets.all(5),
                                                  margin: const EdgeInsets.all(5),
                                                  child: Image.asset('assets/custom/p_$i.png')),
                                            );
                        },
                      )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
        ),
        child: const Image(image: AssetImage('assets/widgetsImages/pattren.png')),
      ),
    );
  }
}
