import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/history_bloc.dart';
import 'blocs/bloc/layred_bloc.dart';
import 'design_var.dart';

class LayersUp extends StatefulWidget {
  const LayersUp({super.key});

  @override
  State<LayersUp> createState() => _LayersUpState();
}

class _LayersUpState extends State<LayersUp> {
   @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, hstate) {
        int selectedd = hstate.histroyList.isNotEmpty
            ? hstate.histroyList.last.selectedItem
            : -1;
        return InkWell(
          onTap: () {

            if(selectedd!=-1){
              context.read<LayredBloc>().add(layer_up(id: selectedd));
         
            
            }
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
              ),
              child: Icon(
                Icons.layers,
                color:
                    selectedd != -1 ? ajrakColor : ajrakColor.withOpacity(0.4),
                size: 40,
              )),
        );
      },
    );
  }

}