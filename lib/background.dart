import 'dart:developer';

import 'package:design_ajrak2/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'blocs/bloc/history_bloc.dart';
import 'design_var.dart';

class BackGround extends StatefulWidget {
  const BackGround({super.key});

  @override
  State<BackGround> createState() => _BackGroundState();
}

class _BackGroundState extends State<BackGround> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                      child: BlockPicker(
                        itemBuilder: (color, isCurrentColor, changeColor) {
                          return Container(
                            margin: const EdgeInsets.all(5),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: color,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: changeColor,
                                borderRadius: BorderRadius.circular(5),
                                child: AnimatedOpacity(
                                  opacity: isCurrentColor ? 1 : 0,
                                  duration: const Duration(milliseconds: 250),
                                  child: const Icon(
                                    Icons.check_circle,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        layoutBuilder: (context, colors, child) {
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(children: [
                                for (Color color in colors)
                                  SizedBox(height: 60, child: child(color))
                              ]));
                        },
                        pickerColor: selectedColor,
                        onColorChanged: (value) {
                          log('color changed');
                          setState(() {
                          selectedColor = value;
                          });
                          context.read<HistoryBloc>().add(add_history(
                              history: History(
                                border: state.histroyList.last.border,
                                  backgroundColor: selectedColor,
                                  ratio: ratio,
                                  layers: state.histroyList.first.layers,
                                  matrix: state.histroyList.first.matrix,
                                  selectedItem: selectedItem
                                  )));

                          
                        },
                      ),
                    ),
                  );
                });
          },
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
            ),
            child: const Image(
                image: AssetImage('assets/widgetsImages/background.png')),
          ),
        );
      },
    );
  }
}
